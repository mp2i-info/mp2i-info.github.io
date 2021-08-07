# Récursivité

La récursivité est la possibilité pour une fonction de s'appeller soi-même. En général, il y a deux étapes pour écrire une fonction récursive :
1. Un cas de base où la fonction renvoie directement une valeur.
2. Un cas général où la fonction s'appelle sur des paramètres "plus petits".

En OCaml, une fonction récursive doit être définie par `let rec ...` :

```ocaml
let rec f x = (* exemple de fonction récursive *)
    if x = 0 then print_newline ()
    else (print_int x;
          f (x - 1))
```

```ocaml
f 3
```

```ocaml
print_int 3234; print_newline ()
```

```ocaml

```
