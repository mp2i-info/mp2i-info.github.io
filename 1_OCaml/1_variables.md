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

<!-- #region -->
# Introduction au langage OCaml

## Variables

### Définition

Une variable possède 3 propriétés:
- un nom (exemple : `x`)
- une valeur (exemple : 42)
- un type (exemple : entier)

En OCaml, on définit une variable de la façon suivante :
```ocaml
let variable = valeur
```

Par exemple, pour définir une variable `x` valant 42 :
<!-- #endregion -->

```ocaml
let x = 42
```

OCaml nous répond que `x` a pour valeur 42 et est de type `int` (*integer*, c'est à dire entier).
La variable `x` est ici définie globalement, c'est à dire accessible partout dans ce notebook.

On peut alors faire des calculs avec la valeur de `x` :

```ocaml
3*x - 2 (* OCaml remplace x par 42 et fait le calcul *)
```

Il est possible d'avoir une expression (un calcul) à droite d'une définition :

```ocaml
let a = 1 + 2 + 3 + 4 (* la valeur à droite de = est calculée puis mise dans a *)
```

### Variable locale

Il est possible de définir une variable locale en utilisant la forme `let y = in ...`  
`y` est alors seulement accessible dans `...`

```ocaml
let y = -1 in y (* y est accessible dans le in *)
```

```ocaml
(* utiliser y ici donnerait une erreur  *)
```

### Variables numériques

Nous avons déjà vu l'addition et la soustraction de 2 entiers. Il est aussi possible de multiplier :

```ocaml
3 * 14
```

On peut effectuer la division **entière** de 2 entiers :

```ocaml
3 / 2 (* division entière *)
```

La division entière de $x$ par $y$ est, par définition, la partie entière de $\frac{x}{y}$.  
Dans l'exemple ci-dessus, `3 / 2` est donc la partie entière de $\frac{3}{2} = 1.5$, c'est à dire $1$. 


En plus des entiers (`int`), OCaml permet de définir des nombres à virgules (`float`, pour flottant) :

```ocaml
let pi = 3.141592
```

Attention : c'est le point (.) et non pas la virgule qui est utilisé pour les flottants.


Il est possible de calculer $x^y$, où $x$ et $y$ sont des **flottants** avec `**` :

```ocaml
2.718**3.14 (* x puissance y *)
```

Il n'est pas possible d'utiliser `**` sur des entiers. Pour calculer la puissance d'un entier par un autre, on verra plus tard un algorithme appelé **exponentiation rapide**.


**Exercice 1**
1. Stocker la valeur $42^2$ dans une variable $a$, en utilisant `*`.
2. En déduire la valeur de $42^4$.
3. Calculer la valeur de $2^{10}$ en utilisant le moins de multiplications possibles.


**Exercice 2**

1. Stocker dans 3 variables $a$, $b$, $c$ les valeurs 2, 5 et 3. On pourra utiliser let a, b, c = ..., ..., ... pour définir 3 variable simultanément. 
2. Stocker dans une variable $delta$ le discriminant de l'équation $ax^2 + bx + c = 0$.
3. Calculer toutes les solutions de l'équation précédente.


## Présentation du code

Contrairement à Python, l'indentation du code n'a pas d'importance en OCaml. En effet les espaces et sauts de lignes sont ignorés :

```ocaml
let a 
  =
3
```

 Il est cependant très important d'avoir un code lisible et aéré, et ce sera pris en compte dans la notation (même si ça n'apparaît pas toujours explicitement).



Pour séparer deux instructions consécutives (ce qui arrivera rarement, on aurait plus souvent des instructions imbriquées avec `in`), on utilisera `;`.
