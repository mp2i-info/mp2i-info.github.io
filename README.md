# Informatique de 1ère année en MP2I

Sur ce site, vous trouverez un cours et des exercices corrigés correspondant au nouveau programme d'informatique en MP2I.  
[Programme officiel](https://prepas.org/index.php?document=73)

[Poser des questions](https://github.com/mp2i-fsm/mp2i-2021/discussions)

[Rendu de TP](https://mp2i-fsm.github.io/mp2i-2021/0_intro/2_rendu_tp)

## Utiliser Jupyter

### [Binder (serveur distant)](https://mybinder.org/v2/gh/fortierq/mp2i-binder/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Ffortierq%252Fmp2i-2021%26urlpath%3Dlab%252Ftree%252Fmp2i-2021%252F%26branch%3Dmain)
**Attention : les données ne sont pas sauvegardées sur Binder. Pensez à télécharger (File -> Download) votre travail quand vous avez terminé.**

### Docker (local)
Avec Docker, vous pouvez lancer Jupyter avec tous les outils installés en local. Jupyter est alors plus rapide à lancer et n'a pas besoin d'Internet, mais l'installation est un peu compliquée.  
1. Télécharger Docker desktop : https://www.docker.com/get-started (download for Windows si vous êtes sous Windows).  
2. Installer Docker desktop.  
3. Lancer Docker desktop.  
4. Ouvrez un terminal (sous Windows : Windows+R, taper "cmd" puis entrée.  
5. Tapez `docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "${PWD}":/home/jovyan/work qfortier/mp2i:2.0.0`.  
6. Si tout se passe bien, l'image Docker contenant Jupyter se télécharge (~ 5Go, ça prend du temps).  
7. Quand l'image est lancée, un message devrait apparaître avec une url : copier-coller la dernière adresse URL pour utiliser Jupyter.
```
To access the server, open this file in a browser:
    file:///home/jovyan/.local/share/jupyter/runtime/jpserver-8-open.html
Or copy and paste one of these URLs:
    http://9e0e7a819898:8888/lab?token=3c2893614dbd1935d3b63fd06f6975c8641a52c7e51e0321
 or http://127.0.0.1:8888/lab?token=3c2893614dbd1935d3b63fd06f6975c8641a52c7e51e0321
```
