(** définition du type dyn_array *)
type 'a dyn_array {mutable tab : 'a Array; mutable size : int};;

(** [make_dyn_array n e] créé une dyn_array de n éléments e *)
let make_dyn_array n e =
    if n = 0 then failwith "make_dyn_array : Construct an empty dynamic array is not permitted";
    {tab = Array.make 2*n e; size = n};;

(** [add e t] ajoute l'élément *)
let add e t =
    if t.size = Array.length (t.tab) then(
        let new_tab = Array.make 2*(t.size) t.tab.(0) in
        for i=1 to n-1 do
            new_tab.(i) <- t.tab.(i)
        done;
        new_tab.(t.size) <- e;
        t.tab <- new_tab;
        t.size <- t.size + 1)
    else t.tab.(t.size) <- e; t.size <- t.size + 1;;




(** définition du type stack *)
type 'a stack {prev : 'a stack; elem : 'a} of E | S of 'a stack;;

(** [stack_push e s] ajoute e à la fin de la stack l et renvoie le haut de la nouvelle stack *)
let stack_push e s =
    S{prev = s; elem = e};;

(** [stack_top s] renvoie le haut de la stack s *)
let stack_top s = match s with
        | E e -> failwith "stack_top : Try to get the top of an empty stack"
        | _ -> s.elem;;




(** définition du type l2c *)
type 'a l2c = {elem : 'a; mutable prev : 'a l2c; mutable next : 'a l2c};;

(** [create e] renvoie une l2c possédant comme seul élément e *)
let create e =
    let rec l = {elem = e; prev = l; next = l} in
    l;;
    
(** [add e l] ajoute l'élément e après l'élément suivant *)
let add e l =
    let bloc = {elem = e; next = l.next; prev = l} in
    l.next.prev <- bloc;
    l.next <- bloc;;
    
(** [del l] supprime l'élément l de la l2c associée*)
let del l =
    l.prev.next <- l.next;
    l.next.prev <- l.prev;;
    
(** [length l] renvoie la longueur de l*)
let length l =
    let rec aux l1 =
        if l1 == l then 1 else 1 + aux l1.next in
    aux l.next;;
    
(** [print_l2c l] affiche l *)
let print_l2c l =
    print_newline ();
    print_string ("[ ");
    let l_cur = ref l in
    while !l_cur.next != l do
        print_int !l_cur.elem;
        print_string ("; ");
        l_cur := !l_cur.next;
    done;
    print_int l.next.elem; print_string ("]"); print_newline ();;
    
(** [mem e l] renvoie true si l contient l'élément e, et false sinon *)
let mem e l =
    let bloc = ref l in
    let valeur = ref (!bloc.elem = e) in
    while l == !bloc do
        bloc := !bloc.next;
        valeur := !valeur || !bloc.elem = e;
    done;
    !valeur;;
    
(** [fusion l1 l2] fusionne l1 et l2 *)
let fusion l1 l2 =
    let next = l1.next in
    l1.next <- l2.next;
    l2.next <- next;
    l2.next.prev <- l2;
    l1.next.prev <- l1;;





(** Définition du type file *)
type 'a file={tab: 'a array ; mutable deb: int ; mutable fin: int ; mutable vide: bool}

(** [ajoute f x] ajoute l'élément x à la fin de la file f *)
let ajoute f x =
    if f.deb = f.fin && not f.vide then failwith "File pleine";
    (f.tab.(f.fin) <- x;
    f.fin <- (f.fin + 1) mod (Array.length f.tab);
    f.vide <- false);;
        
(** [retire f] retire le premier élément de f et le renvoie *)
let retire f =
    if f.vide then failwith "File vide"
    f.deb <- ((f.deb + 1) mod (Array.length f.tab));
    if f.deb = f.fin then f.vide <- true;
    f.tab.((f.deb-1) mod (Array.length f.tab));;
