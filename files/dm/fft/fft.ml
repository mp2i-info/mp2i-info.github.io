
type complexe = {re : float; im : float};;

let float_to_c r = {re = r; im = 0.};; (* pour tester: convertit flottant en complexe *)
let rec lf_to_lc = function  (* pour tester: convertit une liste de flottants en liste de complexes *)
  | [] -> []
  | e::q -> float_to_c e::lf_to_lc q;;

let zero = {re = 0.; im = 0.};;
let un = {re = 1.; im = 0.};;
let conj z = {re = z.re; im = -.z.im};;
let add z1 z2 = {re = z1.re +. z2.re; im = z1.im +. z2.im};;
let mul z1 z2 = {re = z1.re *. z2.re -. z1.im *. z2.im; im = z1.im *. z2.re +. z2.im *. z1.re};;

let rec horner p x = match p with (** /2 **)
  | [] -> zero
  | a::q -> add a (mul x (horner q x));;
(** Intérêt de la méthode: effectuer moins de multiplications (O(n)) que pour la méthode naïve (il faudrait calculer des puissances x**k) **)

horner (lf_to_lc [1.; 2.; 3.]) un;;

let rec divise p = match p with (** /1.5 **)
  | [] -> [], []
  | [a] -> failwith "le nombre de coefficients doit être pair"
  | a::b::q -> let p0, p1 = divise q in
	       a::p0, b::p1;;

let rec fft p w = (** /4 **)
  if List.tl p = [] then p (* cas de base: polynôme constant *)
  else let p0, p1 = divise p in
       let wcarre = mul w w in
       let t0, t1 = fft p0 wcarre, fft p1 wcarre in
       let rec aux wk l0 l1 = match l0, l1 with (* construit la transformée de p à partir de celles de p0 et p1 *)
	 | [], [] -> []
	 | y0::q0, y1::q1 -> (add y0 (mul wk y1))::aux (mul w wk) q0 q1 in
       aux un (t0@t0) (t1@t1);;

(* Soit C(n) la complexité de fft p w pour p de taille n. 
Alors fft p w fait deux appels récursifs sur des listes p0 et p1 de taille n/2. 
De plus divise p et l'appel à aux sont linéaires, c'est à dire ont une complexité Kn avec K constante.
Donc C(n) = 2C(n/2) + K*n = 2(2C(n/4) + Kn/2) + Kn = ... = 2**p C(n/2**p) + Kn + Kn + ... + Kn = 2**p C(n/2**p) + p*Kn.
En prenant p = log2(n), on trouve C(n) = n C(1) + Knlog(n) = O(nlog(n)) *) 

let rec est_puiss2 n =
  if n = 1 then true
  else if n mod 2 = 0 then est_puiss2 (n/2)
  else false;;

let puiss2 l =
  let rec aux n li = match li with (* n est le nombre d'éléments déjà vus *)
    | [] -> if est_puiss2 n then [] else zero::aux (n+1) []
    | e::q -> e::aux (n+1) q in
  aux 0 l;;

puiss2 [un; un; un; un; un];;

let completer l = (** /1 **)
  let rec aux n li = match li with
    | [] -> if n = 0 then [] else zero::aux (n-1) []
    | e::q -> e::aux n q in
  aux (List.length l) l;;

completer [un; un; un];;

let rec mul_ft p q = match p, q with
  | [], [] -> []
  | p0::p', q0::q' -> (mul p0 q0)::mul_ft p' q';;

let coeff r =
  let n = List.length r in
  let rec aux = function
    | [] -> []
    | e::q -> (mul {re = 1./. float n; im = 0.} e)::aux q in
  aux r;;

let mul_poly p q =
  let p', q' = completer p, completer q in
  let n = List.length p' in
  let theta = 2.*.3.14159265 /. float n in
  let w = {re = cos(theta); im = sin(theta)} in (* on peut aussi utiliser exp *)
  let ftp, ftq = fft p' w, fft q' w in
  let r = mul_ft ftp ftq in
  let rhat = fft r (conj w) in
  coeff rhat;;

mul_poly (lf_to_lc ([1.; 0.; 3.; 1.])) (lf_to_lc ([2.; 1.; 0.; 2.]));;
(* (1 + 3X**2 + X**3)*(2 + X + 2X**3) = 2 + X + 6X**2 + 7X**3 + X**4 + 6X**5 + 2X**6 *) 
