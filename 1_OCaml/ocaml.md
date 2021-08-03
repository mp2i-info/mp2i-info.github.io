---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.11.4
  kernelspec:
    display_name: OCaml default
    language: OCaml
    name: ocaml-jupyter
---

# Introduction au langage OCaml

## Variables

### Définition

Une variable possède 3 propriétés:
- un nom (exemple : `x`)
- une valeur (exemple : 42)
- un type (exemple : entier)

La ligne suivante définie une variable `x` en OCaml :

```ocaml
let f x = x * 3;;
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
y (* y n'est pas accessible hors du in *)
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

```ocaml
sqrt
```

En plus des entiers (`int`), OCaml permet de définir des nombres à virgules (`float`, pour flottant) :

```ocaml
let pi = 3.141592
```

Attention : c'est le point (.) et non pas la virgule qui est utilisé pour les flottants.

```ocaml

```
