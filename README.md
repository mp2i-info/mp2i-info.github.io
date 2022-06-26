# Cours d'informatique en MP2I

Programmer : [Binder](https://mybinder.org/v2/gh/fortierq/mp2i-binder/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Ffortierq%252Fmp2i-2021%26urlpath%3Dlab%252Ftree%252Fmp2i-2021%252F%26branch%3Dmain) | [Basthon](https://notebook.basthon.fr/ocaml) | [repl.it](https://replit.com/languages/c)

Librairie des algorithmes de MP2I : [en OCaml](https://github.com/fortierq/mp2i-library-ocaml) | [en C](https://github.com/fortierq/mp2i-library-c)  

Concours MPI : [ENS](https://diplome.di.ens.fr/informatique-ens) | [Mines Pont](https://www.concoursminesponts.fr/resources/pre%CC%81-Notice-MPI-2023-V1.0.pdf) | [CCP](https://www.concours-commun-inp.fr/fr/epreuves/les-epreuves-ecrites.html)

[Programme officiel](https://prepas.org/index.php?document=73)

<html>
 <head>
  <meta charset="utf-8"/>
  <script type="application/javascript">
    function draw() {
      var canvas = document.getElementById("canvas");
      if (canvas.getContext) {
        var ctx = canvas.getContext("2d");

        ctx.fillStyle = 'rgb(200, 0, 0)';
        ctx.fillRect(10, 10, 50, 50);

        ctx.fillStyle = 'rgba(0, 0, 200, 0.5)';
        ctx.fillRect(30, 30, 50, 50);
      }
    }
  </script>
 </head>
 <body onload="draw();">
   <canvas id="canvas" width="150" height="150"></canvas>
 </body>
</html>
