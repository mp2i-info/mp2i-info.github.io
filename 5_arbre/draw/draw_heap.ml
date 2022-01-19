#use "/home/jovyan/work/5_arbre/draw/draw_tree.ml";;

type 'a heap = { a : 'a array; mutable n : int };;

let draw_heap ?(file_out="out") heap =
    let rec heap_to_tree i =
        if i >= heap.n then E
        else N(heap.a.(i), heap_to_tree (2*i + 1), heap_to_tree (2*i + 2)) in
    heap_to_tree 0
    |> tree_to_tex ~file_out:file_out;;
    