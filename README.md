# Cours d'informatique en MP2I

Programmer : [Binder](https://mybinder.org/v2/gh/fortierq/mp2i-binder/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Ffortierq%252Fmp2i-2021%26urlpath%3Dlab%252Ftree%252Fmp2i-2021%252F%26branch%3Dmain) | [Basthon](https://notebook.basthon.fr/ocaml) | [repl.it](https://replit.com/languages/c)

Librairie des algorithmes de MP2I : [en OCaml](https://github.com/fortierq/mp2i-library-ocaml) | [en C](https://github.com/fortierq/mp2i-library-c)  

Concours MPI : [ENS](https://diplome.di.ens.fr/informatique-ens) | [Mines Pont](https://www.concoursminesponts.fr/resources/pre%CC%81-Notice-MPI-2023-V1.0.pdf) | [CCP](https://www.concours-commun-inp.fr/fr/epreuves/les-epreuves-ecrites.html)

[Programme officiel](https://prepas.org/index.php?document=73)

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.4.4/joint.css" />
</head>
<body>
    <!-- content -->
    <div id="myholder"></div>

    <!-- dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.4.0/backbone.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.4.4/joint.js"></script>

    <!-- code -->
    <script type="text/javascript">

        var namespace = joint.shapes;

        var graph = new joint.dia.Graph({}, { cellNamespace: namespace });

        var paper = new joint.dia.Paper({
            el: document.getElementById('myholder'),
            model: graph,
            width: 600,
            height: 100,
            gridSize: 1,
            cellViewNamespace: namespace
        });

        var rect = new joint.shapes.standard.Rectangle();
        rect.position(100, 30);
        rect.resize(100, 40);
        rect.attr({
            body: {
                fill: 'blue'
            },
            label: {
                text: 'Hello',
                fill: 'white'
            }
        });
        rect.addTo(graph);

        var rect2 = rect.clone();
        rect2.translate(300, 0);
        rect2.attr('label/text', 'World!');
        rect2.addTo(graph);

        var link = new joint.shapes.standard.Link();
        link.source(rect);
        link.target(rect2);
        link.addTo(graph);

    </script>
</body>
</html>
