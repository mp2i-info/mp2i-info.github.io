let namespace = joint.shapes;

let graph = new joint.dia.Graph({}, { cellNamespace: namespace });

new joint.dia.Paper({
    el: document.getElementById('graph'),
    model: graph,
    width: 600,
    height: 400,
    // (to ensure that opening the link is not prevented on touch devices)
    elementView: joint.dia.ElementView.extend({
        events: {
            'touchstart a': 'onAnchorTouchStart'
        },
        onAnchorTouchStart: function (evt) {
            evt.stopPropagation();
        }
    })
});

joint.shapes.standard.Rectangle.define('HyperlinkLabelRectangle', {
    attrs: {
        body: {
            fill: '#ffffff',
            stroke: '#000000'
        },
        link: {
            xlinkShow: 'new',
            cursor: 'pointer'
        },
    }
}, {
    markup: [{
        tagName: 'rect',
        selector: 'body',
    }, {
        // `link` envelops only `label`
        tagName: 'a',
        selector: 'link',
        children: [{
            tagName: 'text',
            selector: 'label'
        }]
    }]
});

function node(x, y, label, link) {
    return new joint.shapes.HyperlinkLabelRectangle({
        position: { x: x, y: y },
        // size: { width: 40 + 5*label.length, height: 30 },
        size: { width: 120, height: 30 },
        attrs: {
            label: { text: label },
            link: { xlinkHref: link },
        }
    }).addTo(graph);
}

const dx = 210, dy1 = 140, dy2 = dy1/4, dy3 = dy2/1.5;

function right(n) {
    let box = n.getBBox();
    return box.x + box.width + dx;
}

function getY(n) {
    let box = n.getBBox();
    return box.y;
}

function link(n1, n2) {
    new joint.shapes.standard.Link().source(n1).target(n2).addTo(graph);
}

let linkedlist = node(0, dy1/4, 'Liste chaînée', 'http://en.wikipedia.org/wiki/Array_data_structure');
let tree = node(0, dy1/4 + dy1, 'Arbre', 'http://www.google.com');
let array = node(0, dy1/4 + 2*dy1, 'Tableau', 'http://en.wikipedia.org/wiki/Array_data_structure');

let queue = node(dx, getY(linkedlist) - dy2, 'Queue', 'http://en.wikipedia.org/wiki/Queue_(data_structure)');
let stack = node(dx, getY(linkedlist) + dy2, 'Stack', 'http://en.wikipedia.org/wiki/Queue_(data_structure)');
let bst = node(dx, getY(tree), 'ABR', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let heap = node(dx, .5*(getY(array) + getY(tree)), 'Tas', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let hash = node(dx, getY(array), 'Table de hachage', 'http://en.wikipedia.org/wiki/Breadth-first_search');
link(linkedlist, queue);
link(linkedlist, stack);
link(tree, bst);
link(tree, heap);
link(array, heap);
link(array, hash);

let bfs = node(2*dx, getY(queue), 'BFS', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let dfs = node(2*dx, getY(stack), 'DFS', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let huffman = node(2*dx, .5*(getY(stack) + getY(tree)), 'Huffman', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let priority = node(2*dx, .5*(getY(bst) + getY(heap)), 'File de priorité', 'http://en.wikipedia.org/wiki/Breadth-first_search');
let dict = node(2*dx, .5*(getY(heap) + getY(hash)), 'Dictionnaire', 'http://en.wikipedia.org/wiki/Breadth-first_search');
link(queue, bfs);
link(stack, dfs);
link(stack, huffman);
link(tree, huffman);
link(bst, priority);
link(heap, priority);
link(bst, dict);
link(hash, dict);

