# Installation

Pour utiliser OCaml, C, SQL... vous avez plusieurs solutions :

## [Jupyter avec Binder (serveur distant)](https://mybinder.org/v2/gh/fortierq/mp2i-binder/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Ffortierq%252Fmp2i-2021%26urlpath%3Dlab%252Ftree%252Fmp2i-2021%252F%26branch%3Dmain)
Tout est en ligne, aucune installation nécessaire.  
**Attention : les données ne sont pas sauvegardées sur Binder. Pensez à télécharger (File -> Download) votre travail quand vous avez terminé.**  
Pour contourner le blocage du wifi au lycée, vous pouvez utiliser [ProtonVPN](https://protonvpn.com/fr/) (qui a une version gratuite et a l'air sûr).

## Machine virtuelle

Une machine virtuelle simule un système d'exploitation entier.  
1. [Télécharger VirtualBox](https://www.virtualbox.org/)  
2. [Télécharger cette image pour machine virtuelle (contenant Debian, OCaml, C, Jupyter, Visual Code)](https://filesender.renater.fr/?s=download&token=8a94fa81-1948-43cc-9173-e253eb54e648)  
3. Lancer l'image avec VirtualBox.  
4. Une fenêtre avec Debian se lance. Vous pouvez taper Ctrl droit + F pour la mettre en plein écran (et la même combinaison de touche pour en sortir.  
5. Se connecter avec l'utilisateur user et le mot de passe mp2i.  
6. Ouvrir un terminal (Ctrl gauche + Alt + T ou cliquer sur l'icone).  
7. Taper `passwd` puis changer votre mot de passe.  
![](https://user-images.githubusercontent.com/49362475/143782665-97645a54-2018-4a5e-bd62-4f94ea38d743.png)

## Jupyter avec Docker (en local)
Docker est une virtualisation d'application, qui permet d'obtenir Jupyter avec toutes les dépendances nécessaires.  
0. Si vous utilisez Windows, vous devez installer WSL2 (permettant d'avoir Linux sous Windows, ce qui est utilisé par Docker) : https://docs.microsoft.com/fr-fr/windows/wsl/install
1. Télécharger Docker desktop : https://www.docker.com/get-started (download for Windows si vous êtes sous Windows).  
2. Installer Docker desktop.  
3. Lancer Docker desktop.  
4. Ouvrez un terminal (sous Windows : Windows+R, taper "cmd" puis entrée.  
5. Tapez `docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "/chemin/vers/dossier":/home/jovyan/work qfortier/mp2i:2.0.0`.  
Remplacez /chemin/vers/dossier par le chemin vers votre dossier de travail.  
7. Si tout se passe bien, l'image Docker contenant Jupyter se télécharge (~ 5Go, ça prend du temps).  
8. Quand l'image est lancée, un message devrait apparaître avec une url : copier-coller la dernière adresse URL pour utiliser Jupyter.
```
To access the server, open this file in a browser:
    file:///home/jovyan/.local/share/jupyter/runtime/jpserver-8-open.html
Or copy and paste one of these URLs:
    http://9e0e7a819898:8888/lab?token=3c2893614dbd1935d3b63fd06f6975c8641a52c7e51e0321
 or http://127.0.0.1:8888/lab?token=3c2893614dbd1935d3b63fd06f6975c8641a52c7e51e0321
```

## En ligne

- OCaml : https://betterocaml.ml/?version=4.13.1
- C : https://replit.com/languages/c (par exemple)
