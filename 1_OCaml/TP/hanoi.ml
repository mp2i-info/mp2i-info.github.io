let rec hanoi n tige1 tige2 =
    if n = 0 then 1 (*On interrompt la récursion*)
    else let tige3 = 3 - tige1 - tige2 in
        let _ = hanoi (n-1) tige1 tige3 in (*On ne souhaite pas stocker le résultat mais juste lancer la récursion*)
            print_int tige1;
            print_string " -> ";
            print_int tige3;
            print_string "\n";
        hanoi (n-1) tige3 tige2;;

hanoi 3 0 2
