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

## Variables

### Définition

Une variable possède 3 propriétés:
- un nom (exemple : `x`)
- une valeur (exemple : 42)
- un type (exemple : entier)

La ligne suivante définie une variable `x` en OCaml :

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

## Variable local

Il est possible de définir une variable locale en utilisant la forme `let y = in ...`. `y` est alors seulement accessible dans `...`. 

```ocaml
let y = -1 in y (* y est accessible dans le in *)
```

```ocaml
y (* y n'est pas accessible hors du in *)
```

```ocaml

```
