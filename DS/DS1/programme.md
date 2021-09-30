# Programme pour le DS 1

Voici une liste (non exhaustive) de points à bien connaître pour le DS 1. Je mettrai (au moins) un algorithme ou preuve (de complexité) du cours dans le DS.  

## Notions à connaître

- Variables : Différence entre valeur, type et nom de variable. Variables locales (avec `in`). Définition, utilisation d'une variable et d'une référence. int, float (erreur de calcul sur les flottants), unit. 
- Fonctions : Définition, utilisation. Renvoyer une valeur avec une fonction (valeur de la dernière instruction). Dans le cas d'une boucle `for`, utiliser une référence pour renvoyer une valeur. Fonctions récursives : cas de base et cas général. Les appels récursifs doivent rapprocher du cas du base (sinon il y a appels récursifs infinis).
- Conditions : `&&`, `||`, `if`. Plutôt que `if a = true then true else false`, écrire `a`.
- Tuples : création, décomposition.
- Listes : Créer une liste avec `[...; ...]`. `e::l` renvoie une nouvelle liste avec l'élément `e` rajouté au début. Différentes possibilités de faire un `match ... with` sur une liste. Impossibilité d'écrire ~~l.(i)~~.  
- Tableaux (array) :`[|...; ...|]` ou `Array.make n e` pour créer un tableau. Sur un tableau `t` : `Array.length t`, `t.(i)`, `t.(i) <- ...`
- Types : Reconnaître les différents types (tuples, fonctions, array ...). Être capable de trouver le type d'une fonction.
- Boucle for, while. Parcourir un tableau avec un for.
- **Complexité** : Notation O (définition mathématique et surtout, signification intuitive). Complexité d'un for, de 2 boucles for imbriquées, d'une fonction récursive/while en utilisant une équation de récurrence sur la complexité C(n). 

## Algorithmes à connaître

Il faut savoir refaire les algorithmes suivants. Pour cela, évitez de les apprendre par coeur mais lisez l'algorithme attentivement pour bien comprendre la méthode, puis essayez de le réécrire sans le regarder. Bien sûr vous pouvez avoir une version légèrement différente, tant que le résultat est correct et que la complexité en O(...) est la même.

- Échange de 2 références (`swap`).
- Calculer la taille d'une liste.
- Tester si un élément appartient à une liste, à un tableau.
- Concaténer deux listes (réécrire `@`).
- Inverser une liste (rev) avec un accumulateur.
- Trouver le minimum/maximum d'un tableau/d'une liste.
- Calculer la somme d'un tableau/d'une liste.
- Exponentiation rapide pour calculer a puissance n en complexité O(log(n)) (avec démonstration de la complexité).
- Recherche par dichotomie dans un tableau trié de taille n en complexité O(log(n)) (avec démonstration de la complexité).
- Tri fusion d'une liste de taille n en complexité O(nlog(n)) (avec démonstration de la complexité).
