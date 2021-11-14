(** [dicho e t] renvoie true si e appartient à t, et false sinon (algorithme dichotomique sur tableau trié croissant) *)
let dicho e t =
    let rec aux i j =
        if i > j then false
        else
            (let m = (i+j)/2 in
            if t.(m) > e then
                aux i (m - 1)
            else if t.(m) < e then
                aux (m + 1) j
            else t.(m) = e) in
    aux 0 (Array.length t - 1);;

(** [ncho n e t] renvoie true si e appartient à t, et false sinon (algorithme n-chotomique sur tableau trié croissant) *)
let ncho n e t =
    let rec aux i j =
        if i > j then false
        else(
            let sec = Array.make (n + 1) i in
            let next_i = ref i in
            let next_j = ref j in
            let k = ref 0 in
            for m=0 to n do
                sec.(m) <- (j-i)*m/n+i
            done;
            while !k < n && !next_i <= j && t.(!next_i) < e do
                (k := !k + 1;
                next_i := sec.(!k) + 1)
            done;
            if t.(!next_i) > e && !k <> 0 then next_i := !next_i - 1;
            k := n;
            while !k > 0 && !next_j >= !next_i && t.(!next_j) > e do
                (k := !k - 1;
                next_j := sec.(!k) - 1)
            done;
            if t.(!next_j) < e && !k <> n then next_j := !next_j + 1;
            t.(i) = e || aux !next_i !next_j
        ) in
    aux 0 (Array.length t - 1);;

(** [exp_rapide a n] renvoie a^n *)
let rec exp_rapide a n =
    if n = 0 then 1.
    else(
        let next = exp_rapide a (n/2) in
        if n mod 2 = 0 then next*.next
        else a*.next*.next);;

(** [sqrt a prec] renvoie la racine carrée de a, utilise la convergence de la suite qui pour n vérifie u(n+1) = -(u(n))^2 + u(n) + a. Plus prec est grand, plus le résultat est précis *)
let sqrt a prec =
    let a2 = ref a in
    let reversed = ref false in
    let u = ref 0. in
    if a = 1 then 1
    else(
        if a > 1. then(
            a2 := 1./.a;
            reversed := true);
        for i=0 to prec do
            u := -.(!u)*.(!u) +. !u +. !a2
        done;
        if !reversed then 1./.(!u)
        else !u);;

(** [nthroot a n prec] renvoie la racine n-ième de a, utilise la convergence de la suite qui pour n vérifie u(n+1) = -(u(n))^n + u(n) + a. Plus prec est grand, plus le résultat est précis, mais la précision reste néanmoins exécrable lorsque n >= 4, peu importe prec. L'aspect mathématique reste intéressant. Ma preuve de la limite est trop longue pour être inscrite ici *)
let nthroot a n prec =
    let a2 = a/.(exp_rapide (a*.(float_of_int n)) n) in
    let u = ref 0. in
    for i=0 to prec do
        u := -.(exp_rapide (!u) n) +. !u +. a2
    done;
    (float_of_int n)*.a*.(!u);;
