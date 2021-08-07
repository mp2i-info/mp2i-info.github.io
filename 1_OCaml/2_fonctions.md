---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.11.4+dev
  kernelspec:
    display_name: OCaml default
    language: OCaml
    name: ocaml-jupyter
---

# Utiliser une fonction

OCaml est un langage fonctionnel, ce qui signifie que les fonctions y occupent une place importante et peuvent être manipulées un peu comme des variables.  
Pour utiliser une fonction `f` sur une valeur `x`, on écrira simplement `f x` (et non pas `f(x)`.  

Un certain nombre de fonctions sont déjà définies en OCaml. Par exemple, la racine carrée : 

```ocaml
sqrt 2.0 (* renvoie la valeur de racine de 2 *)
```

Chaque fonction possède une **signature**, qui donne les types des paramètres (valeurs en entrée de la fonction) et le type de la valeur de retour.

```ocaml
sqrt
```

`float -> float` signifie que `sqrt` est une fonction qui prend un flottant en entrée et renvoie un flottant. On ne peut donc pas l'appliquer sur un entier :

```ocaml
(* sqrt 2 *)
```

# Définir une fonction

<!-- #region -->
En OCaml, une fonction se définie de la façon suivante :
```ocaml
let nom_fonction nom_argument = ... 
```
où `...` est le corps de la fonction, c'est à dire ce qui est exécuté lorsqu'on utilise la fonction. La valeur renvoyée par la fonction est celle de la dernière instruction (pas besoin de `return`).
<!-- #endregion -->

Définissons par exemple la fonction $f: x \longmapsto 2x$ :

```ocaml
let f x = 2*x
```

OCaml nous dit que `f` est de type `int -> int`, ce qui signifie que `f` prend un entier en entrée et renvoie un entier en sortie. Ceci est similaire à la notation mathématique $f : \mathbb{N} \longrightarrow \mathbb{N}$.  

Notons que `x` est une variable **muette** : elle n'existe qu'à l'intérieur de `f`, n'a aucun rapport avec une variable `x` définie précédemment et la fonction suivante définit exactement la même fonction :

```ocaml
let f y = 2*y (* peu importe le nom de la variable muette y *)
```

Maintenant que `f` est définie, on peut calculer $f(3)$ :

```ocaml
f 3
```

Comme pour les variables, il est possible d'utiliser in pour spécifier la portée d'une fonction $g$

```ocaml
let g x = x + 1 in
g 0
```

<!-- #region -->
**Exercice** Donner la valeur de l'expression suivante :
```ocaml
let h x = f x + 1 in
h 3
```
<!-- #endregion -->

Il est possible d'avoir plusieurs instructions dans une fonction (même si seule la dernière sera renvoyée) :

```ocaml
let pow4 x = (* je saute une ligne ici pour plus de lisibilité *)
    let y = x*x in
    y*y (* renvoie x puissance 4 *)
```

```ocaml
pow4 2 (* test de notre fonction *)
```

# Fonctions anonymes


Quand on a besoin d'utiliser une fonction une seule fois, on peut définir une fonction anonyme (sans nom) avec `fun`. 

```ocaml
fun x -> x*2 (* définition d'une fonction anonyme *)
```

```ocaml
(fun x -> x*2) 3 (* applique une fonction anonyme sur la valeur 3 *)
```

<!-- #region -->
Remarque : les deux définitions suivantes sont en fait complètement équivalentes.
```ocaml
let f x = ...
```
```ocaml
let f = fun x -> ...
```
<!-- #endregion -->

# Fonctions de plusieurs variables


Il est possible de définir des fonctions avec plusieurs paramètres, par exemple :

```ocaml
let sum x y = x + y
```
```ocaml
sum 3 4 (* renvoie 3 + 4 *)
```

Le type de `sum` est `int -> int -> int`, ce qui peut paraître étrange.  
C'est équivalent à `int -> (int -> int)`, ce qui signifie que `sum` prend en entier en argument et renvoie une valeur de type `int -> int` (c'est à dire une fonction).  
En effet :

```ocaml
sum 3
```

`sum 3` est une fonction qui prend en argument un entier `y` et qui renvoie `3 + y`, ce qu'on peut vérifier :

```ocaml
let f = sum 3 in (* f est une fonction *)
f 4 (* renvoie sum 3 4, c'est à dire 7 *)
```

La possibilité d'appliquer une fonction seulement sur certains arguments s'appelle l'**application partielle** de fonction. C'est un des avantages d'OCaml par rapport à Python.  


De la même façon, une fonction OCaml à 3 arguments sera de type `... -> ... -> ... -> ...`.


**Exercice** : 
1. Écrire une fonction `xor : bool -> bool -> bool` telle que `xor a b` renvoie le ou exclusif de `a` et `b`, c'est à dire `true` si `a` ou `b` est `true`, mais pas les deux.
2. Écrire une fonction `delta : float -> float -> float -> float` telle que `delta a b c` renvoie le discriminant de l'équation $ax^2 + bx + c = 0$.


# Polymorphisme


Reprenons notre 1er exemple de fonction :

```ocaml
let f x = 2*x
```

OCaml sait que l'argument `x` de `f` est un `int` car on utilise l'opérateur `*` qui ne s'utilise que sur des entiers. Mais dans certaines fonctions, il n'y a pas de contrainte de type :

```ocaml
let id x = x
```

Cette fonction `id` (pour identité) renvoie son argument sans le modifier. Comme aucune opération n'est appliquée sur `x`, il n'y a pas de conrainte sur son type. OCaml utilise alors `'a` pour désigner le type quelconque de `x`.  
Notons que le type de retour de `id` est `'a` également : OCaml nous dit que `id` renvoie une valeur du même type que l'argument.

<!-- #region -->
**Exercice** : donner le type des fonctions suivantes  
```ocaml
 let f x = 42
 ```
```ocaml
 let g x y f = x + f y
 ```
<!-- #endregion -->

# Fonction comme argument

Il est possible d'utiliser une fonction en argument d'une autre fonction. Par exemple, la fonction suivante évalue une autre fonction en la valeur 0 :

```ocaml
let eval f =
f 0
```

```ocaml
let f x = 3*x + 7 in
eval f
```

<!-- #region -->
**Exercice** : 
1. On définit une fonction `h` :
```ocaml
let h f g x = f (g x)
```
Donner la valeur de l'expression :
```ocaml
h (fun x -> x*x) (fun x -> x + 1) 3
```
2. À quoi sert `h`? Comment cette opération s'appelle-t-elle mathématiquement?
<!-- #endregion -->

```ocaml

```
