# Variables

## Définition d'une variable

!!! note "test"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

!!! note

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

- un **nom** (exemple : `x`)  
- une **valeur** (exemple : 42)  
- un **type** (exemple : entier)

En OCaml, on définit une variable de la façon suivante :
```ocaml
let variable = valeur
```

Par exemple, pour définir une variable `x` valant 42 :


```OCaml
let x = 42
```




    val x : int = 42




OCaml nous répond que `x` a pour valeur 42 et est de type `int` (*integer*, c'est à dire entier).
La variable `x` est ici définie globalement, c'est à dire accessible partout dans ce notebook.

On peut alors faire des calculs avec la valeur de `x` :


```OCaml
3*x - 2 (* OCaml remplace x par 42 et fait le calcul *)
```




    - : int = 124




Il est possible d'avoir une expression (un calcul) à droite d'une définition :


```OCaml
let a = 1 + 2 + 3 + 4 (* la valeur à droite de = est calculée puis mise dans a *)
```




    val a : int = 10




**Exercice** : définissez une variable $a$ égale à 752. Puis définissez une variable $b$ égale à $54a$.    
Rappel : vous pouvez appuyer sur la touche B pour faire apparaître une case de code et répondre dedans. Ici vous pouvez utiliser deux cases, ou séparer les deux instructions avec ` ;;`.


```OCaml
let a = 752;;
let b = 54*a;;
```




    val a : int = 752







    val b : int = 40608




## Variables locales

Il est possible de définir une **variable locale** en utilisant la forme `let y = ... in ...`  
`y` existe est alors seulement dans le in (`...`)


```OCaml
let y = -1 in y (* y est accessible dans le in *)
```




    - : int = -1





```OCaml
y (* utiliser y ici donne une erreur  *)
```


    File "[5]", line 1, characters 0-1:
    1 | y (* utiliser y ici donne une erreur  *)
        ^
    Error: Unbound value y



**Exercice** : en utilisant `let ... in ... `, définissez une variable $a$ égale à $752$, puis définissez une variable $b$ égale à $54a$.    


```OCaml
let a = 752 in
let b = 54*a in
b
```




    - : int = 40608




**Remarque** Il est possible d'utiliser des parenthèses ou `begin ... end` pour délimiter le in :
```ocaml
let a = 3 in
(
...
)
```


## Opérations numériques

Nous avons déjà vu l'addition et la soustraction de 2 entiers. Il est aussi possible de multiplier :


```OCaml
3 * 14
```




    - : int = 42




On peut effectuer la division **entière** (ou encore : [quotient de la division euclidienne](https://fr.wikipedia.org/wiki/Division_euclidienne)) de 2 entiers :


```OCaml
3 / 2 (* division entière *)
```




    - : int = 1




La division entière de $x$ par $y$ est, par définition, la partie entière de $\frac{x}{y}$.  
Dans l'exemple ci-dessus, `3 / 2` est donc la partie entière de $\frac{3}{2} = 1.5$, c'est à dire $1$. 

**Attention** : la division entière ` 3 / 2`  en OCaml correspond à ` 3 // 2 ` en Python.

En plus des entiers (`int`), OCaml permet de définir des nombres à virgules (`float`, pour flottant) :


```OCaml
let pi = 3.141592
```




    val pi : float = 3.141592




Les opérateurs d'addition, soustraction, multiplication, division doivent s'utiliser avec un `.` (point). Par exemple :


```OCaml
pi +. 2.618 (* noter le . après + *)
```




    - : float = 5.759592




**Attention** : c'est le point (.) et non pas la virgule qui est utilisé pour les flottants.

Il est possible de calculer $x^y$, où $x$ et $y$ sont des **flottants** avec `**` :


```OCaml
2.718 ** 3.14 (* x puissance y *)
```




    - : float = 23.0963461891915607




Il n'est pas possible d'utiliser `**` sur des `int`. Par contre on peut utiliser 4.0 ou 4. au lieu de 4 pour avoir des flottants et utiliser `**` : 


```OCaml
2. ** 10.
```




    - : float = 1024.




**Exercice**
1. Stocker la valeur $42^2$ dans une variable $a$, en utilisant `*`.
2. En déduire la valeur de $42^4$.
3. Calculer la valeur de $2^{10}$ en utilisant le moins de multiplications possibles.


```OCaml
(* 1. *) 
let a = 42*42;;


(* 2. *)
a*a;;

(* 3. *)
let deux_puiss_2 = 2*2 in
let deux_puiss_4 = deux_puiss_2*deux_puiss_2 in
let deux_puiss_8 = deux_puiss_4*deux_puiss_4 in
deux_puiss_8 * deux_puiss_2;; (* calcul de 2 puissance 10 en 4 multiplications *)
```




    val a : int = 1764







    - : int = 3111696







    - : int = 1024




**Exercice**

1. Stocker dans 3 variables $a$, $b$, $c$ les valeurs 2, 5 et 3. On pourra utiliser let a, b, c = ..., ..., ... pour définir 3 variable simultanément. 
2. Stocker dans une variable $delta$ le discriminant de l'équation $ax^2 + bx + c = 0$.
3. Calculer toutes les solutions de l'équation précédente.


```OCaml
(* 1. *)
let a, b, c = 2., 6., 3.;;
```




    val a : float = 2.
    val b : float = 6.
    val c : float = 3.





```OCaml
(* 2. *)
let delta = b**2. -. 4.*.a*.c;;
```




    val delta : float = 12.





```OCaml
(* 3. Le discriminant étant positif, il y a deux solutions égales à : *)
(-.b -. sqrt delta)/.(2.*.a);;
(-.b +. sqrt delta)/.(2.*.a);;
```




    - : float = -2.36602540378443837







    - : float = -0.633974596215561403




Une autre opération importante est le **modulo** (ou : [reste de la division euclidienne](https://fr.wikipedia.org/wiki/Division_euclidienne)) de 2 entiers `a` et `b`, notée `a mod b` en OCaml. Mathématiquement, il s'agit de l'entier $r$ vérifiant :
$$a = bq + r$$
$$0 \leq r < b$$

($q$ est le quotient, égal à `a / b` en OCaml)  
Cette opération `mod` sert notamment à tester la divisibilité : `a` est divisible par `b` si et seulement si `a mod b = 0`.

**Exercice** : Est-ce que 527 est divisible par 17?


```OCaml
527 mod 17 (* c'est égal à 0 donc 17 divise bien 527 *)
```




    - : int = 0




## Overflow

L'ordinateur stocke toutes les variables dans la mémoire RAM de l'ordinateur, en binaire (suite de 0 et de 1). Comme la mémoire RAM sur un ordinateur n'est pas infinie, on ne peut pas stocker des nombres de taille arbitraire.  
`max_int` est le plus grand entier que l'on peut stocker dans une variable :


```OCaml
max_int
```




    - : int = 4611686018427387903




Si on dépasse cet entier (ce qu'on appelle **integer overflow**), on tombe sur le plus petit entier représentable :


```OCaml
max_int + 1
```




    - : int = -4611686018427387904




Le dépassement d'entier est une source fréquente de bug, qui a causé par exemple le [crash de la fusée Ariane 5](https://fr.wikipedia.org/wiki/Vol_501_d%27Ariane_5).

Les float sont également limités :


```OCaml
max_float
```




    - : float = 1.79769313486231571e+308




Les flottants sont codées suivant la norme [IEEE754](https://fr.wikipedia.org/wiki/IEEE_754) sous la forme scientifique en utilisant 64 bits (sur un processeur 64 bits) dont 52 bits pour les chiffres après la virgule.  
La précision des flottants est donc limitée : par exemple, on ne peut pas stocker $\sqrt{2}$ ou $\pi$ de façon exacte sur l'ordinateur puisqu'il s'agit de nombres irrationnels (c'est à dire avec une infinité de décimales, qui ne se répètent pas).  


```OCaml
2.**0.5 (* seulement une partie des décimales est stockée *)
```




    - : float = 1.41421356237309515





```OCaml
(2.**0.5)**2.0  (* ne donne pas 2.0 à cause des erreurs d'arrondis *)
```




    - : float = 2.00000000000000044




Le calcul de $\sqrt 2$ par OCaml s'arrête à la 16ème décimale (ce qui correspond à 52 bits après la virgules, puisque $2^{-52}$ est du même ordre de grandeur que $10^{-16}$). Ce nombre $2^{-52}$ est appelé **epsilon machine**.

Autre exemple :


```OCaml
0.1 +. 0.2  (* ne donne pas 0.3 *)
```




    - : float = 0.300000000000000044




`O.1` n'étant pas représentable de façon exacte en base 2, il est tronqué et engendre des erreurs d'arrondis.

La plus grande valeur de l'exposant est 1023 :


```OCaml
2.**1023.
```




    - : float = 8.98846567431158e+307





```OCaml
2.**1024.
```




    - : float = infinity




## Unit

Il existe une valeur spéciale `()` qui signifie "rien" (un peu comme le None de Python). Le type de `()` est `unit`. Par exemple, afficher un entier avec `print_int` fait un effet de bord (affichage sur l'écran) mais ne renvoie pas de valeur :


```OCaml
print_int 42
```




    - : unit = ()




Pour que le résultat s'affiche, il faut revenir à la ligne avec `print_newline` :


```OCaml
print_newline ()
```

    42





    - : unit = ()




On verra dans un prochain cours le fonctionnement plus détaillé de `print_newline`.

Il aurait été possible de combiner ces deux instructions avec `;`, qui permet d'exécuter consécutivement plusieurs instructions :


```OCaml
print_int 31;
print_newline ()
```

    31





    - : unit = ()




`;;` est similaire à `;`, mais permet de séparer complètement plusieurs instructions, ce qui signifie que les variables définies avec `in` ne sont plus accessibles :


```OCaml
let a = 3 in
print_int a;
a (* a reste accessible : il est toujours dans le in *)
```




    - : int = 3





```OCaml
let a = 3 in
print_int a;;
a;; (* a n'est pas accessible ici *)
```




    - : unit = ()







    - : int = 6




## Présentation du code

Contrairement à Python, l'indentation du code n'a pas d'importance en OCaml. En effet les espaces et sauts de lignes sont ignorés :


```OCaml
let a 
  = 
      6 (* indentation n'importe comment *)
```




    val a : int = 6




On veillera toutefois à écrire du code aussi clair et lisible que possible.

## Réferences

Contrairement à ce que son nom l'indique, une variable définie comme on l'a fait jusqu'à maintenant est en fait... **constante** :


```OCaml
let x = 3;;
x = 4;; (* ceci ne MODIFIE pas x, mais teste si la valeur de x est 4 *)
x;; (* x vaut toujours 3 : il ne peut pas être modifié *)
```




    val x : int = 3







    - : bool = false







    - : int = 3




Pour pouvoir modifier une variable, on peut utiliser une **référence**.
Pour définir une référence on utilise `ref` :
```ocaml
let variable = ref valeur (* définition d'une référence *)
```
Pour modifier une référence on utilise `:=` :
```ocaml
variable := valeur (* modification d'une référence *)
```
Pour obtenir la valeur d'une référence on utilise `!` :
```ocaml
!variable (* donne la valeur d'une référence *)
```


```OCaml
let x = ref 3;; (* définie une variable x qui "pointe" vers un emplacement mémoire contenant 3 *)
x := 4;; (* modifie la valeur pointé par x avec := *)
!x;; (* la valeur a bien été modifiée *)
```




    val x : int ref = {contents = 3}







    - : unit = ()







    - : int = 4




On remarque que l'instruction `x := 4` a pour valeur de retour `()` : c'est un effet de bord qui modifie `x` mais ne renvoie pas de résultat.

Une référence `a` stocke en fait une adresse mémoire. La valeur de `a` est stockée dans cette adresse mémoire (et c'est cette valeur qui est modifiée avec `a := ...`).  
**Remarque** : on reverra cette idée avec les pointeurs en C.

<center><img src=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZEAAABbCAYAAACyJbgxAAAAAXNSR0IArs4c6QAABJp0RVh0bXhmaWxlACUzQ214ZmlsZSUyMGhvc3QlM0QlMjJhcHAuZGlhZ3JhbXMubmV0JTIyJTIwbW9kaWZpZWQlM0QlMjIyMDIxLTA5LTA5VDEyJTNBMDElM0E1NC42NDdaJTIyJTIwYWdlbnQlM0QlMjI1LjAlMjAoWDExJTNCJTIwTGludXglMjB4ODZfNjQpJTIwQXBwbGVXZWJLaXQlMkY1MzcuMzYlMjAoS0hUTUwlMkMlMjBsaWtlJTIwR2Vja28pJTIwQ2hyb21lJTJGOTIuMC40NTE1LjE1OSUyMFNhZmFyaSUyRjUzNy4zNiUyMiUyMGV0YWclM0QlMjJ6dkloS3ZDa1R4bnhRUDZTaTEyMSUyMiUyMHZlcnNpb24lM0QlMjIxNS4xLjIlMjIlMjB0eXBlJTNEJTIyZ2l0aHViJTIyJTNFJTNDZGlhZ3JhbSUyMGlkJTNEJTIybGVfM0d4dEhlbzBkQjVrdXh6a0clMjIlMjBuYW1lJTNEJTIyUGFnZS0xJTIyJTNFM1ZaTmo5TXdFUDB0SENMQkFTa2ZUZWtlMiUyQnhTaEFRQ0NvS3JGVThUYTUyNGNweW01ZGRqNDhtSDY2RHVTaXdnTGszOFpteG4zbnVqYVpCazFXa3J5YUY4Snlqd0lBN3BLVWh1Z3ppT2tqVFVENE9jTGJJS2x4WW9KS09ZTkFJNzloMFF4SDFGeXlnMFRxSVNnaXQyY01GYzFEWGt5c0dJbEtKejAlMkZhQ3U3Y2VTQUVlc01zSjk5R3ZqS29TcSUyQmpMTXZnYllFWFozeHlGR0tsSW40eEFVeElxdWdtVTNBVkpKb1ZROXEwNlpjQU5lVDB2ZHQlMkZyWDBTSEQ1TlFxNGRzV0glMkY4Y245THV1Mzc3bnlUdmwyUnolMkJ6VHQ1ZXhQZVZJZUlzRkV5cWhhY0JJWm40NHNXRm9aUThSckVlZGU1S2thR3NLNXA0b1NEWmR5UlRzRGlRMzBVN2JRbU9scWppRyUyRmUlMkZHVW80Z0Zad21FTmF4QlZHQmttZWRNdGdLT1VWVEpTdGNkNk5FVWM5N09aRm5pUmhCVnhURDBTTnglMkJnVzVld1NQaWNlakRMSWtXTiUyRnM3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 width=300></center>

**Exercice** : Que valent `!x` et `!y` après avoir exécuté le bout de code suivant? À quoi sert ce code?
```ocaml
let x = ref 5;;
let y = ref 27;;
x := !x + !y;
y := !x - !y;
x := !x - !y
```


```OCaml
let x = ref 5 in
let y = ref 27 in
x := !x + !y;
y := !x - !y;
x := !x - !y;
!x, !y;; (* x vaut 27, y vaut 5 : ce bout de code échange les valeurs de x et y *)
```




    - : int * int = (27, 5)




**Remarque** : utiliser des `ref` rend souvent le code plus compliqué, on n'en utilisera que lorsque c'est nécessaire.
