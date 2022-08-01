const namespace = joint.shapes;
const graph = new joint.dia.Graph({}, { cellNamespace: namespace });

new joint.dia.Paper({
    el: document.getElementById('graph'),
    model: graph,
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

const concrete = joint.shapes.standard.Rectangle.define('Concrete', {
    attrs: {
        body: {
            fill: '#ffffff',
            stroke: '#000000',
            strokeWidth: 1
        },
    }
}, {
    markup: [{
        tagName: 'rect',
        selector: 'body',
    }, {
        tagName: 'a',
        selector: 'link',
        children: [{
            tagName: 'text',
            selector: 'label'
        }]
    }]
});

const abstract = joint.shapes.Concrete.define('Abstract', {
    attrs: {
        body: {
            strokeDasharray: '10,2'
        }
    }
});

const algo = joint.shapes.Concrete.define('Algo', {
    attrs: {
        body: {
            rx: 5,
            ry: 5,
        }
    }
});

function node(x, y, label, shape) {
    return new shape({
        position: { x: x, y: y },
        // size: { width: 40 + 5*label.length, height: 30 },
        size: { width: 120, height: 30 },
        attrs: {
            label: { text: label },
        }
    }).addTo(graph);
}

const dx = 210, dy1 = 140, dy2 = dy1/4, dy3 = dy2/1.5;

function getY(n) {
    const box = n.getBBox();
    return box.y;
}

function link(n1, n2) {
    new joint.shapes.standard.Link().source(n1).target(n2).addTo(graph);
}

const linkedlist = node(0, dy1/4, 'Liste chaînée', concrete);
const tree = node(0, dy1/4 + dy1, 'Arbre', concrete);
const array = node(0, dy1/4 + 2*dy1, 'Tableau', concrete);

const queue = node(dx, getY(linkedlist) - dy2, 'File', abstract);
const stack = node(dx, getY(linkedlist) + dy2, 'Pile', abstract);
const bst = node(dx, getY(tree), 'ABR', concrete);
const heap = node(dx, .5*(getY(array) + getY(tree)), 'Tas', concrete);
const hash = node(dx, getY(array), 'Table de hachage', concrete);
link(linkedlist, queue);
link(linkedlist, stack);
link(tree, bst);
link(tree, heap);
link(array, heap);
link(array, hash);

const bfs = node(2*dx, getY(queue), 'BFS', algo);
const dfs = node(2*dx, getY(stack), 'DFS', algo);
const huffman = node(2*dx, .5*(getY(stack) + getY(tree)), 'Huffman', algo);
const priority = node(2*dx, .5*(getY(bst) + getY(heap)), 'File de priorité', abstract);
const dict = node(2*dx, .5*(getY(heap) + getY(hash)), 'Dictionnaire', abstract);
link(queue, bfs);
link(stack, dfs);
link(stack, huffman);
link(tree, huffman);
link(bst, priority);
link(heap, priority);
link(bst, dict);
link(hash, dict);

const dijkstra = node(3*dx, getY(priority), 'Dijkstra', algo);
const boyermoore = node(3*dx, getY(dict), 'Boyer-Moore', algo);
link(priority, dijkstra);
link(dict, boyermoore);

node(dx/2, getY(array) + .7*dy1, 'Type concret', concrete);
node(3*dx/2, getY(array) + .7*dy1, 'Type abstrait', abstract);
node(5*dx/2 , getY(array) + .7*dy1, 'Algorithme', algo);