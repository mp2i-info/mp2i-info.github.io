type 'a avl = V | N of 'a * 'a avl * 'a avl * int;;

let avl_to_tex ?(file_out="out") t =
    let open Printf in
    let file_out = sprintf "%s.tex" file_out in
    let f = open_out file_out in
    fprintf f "\\documentclass[convert={outfile=\\jobname.png}]{standalone}\n
\\usepackage{tikz}
\\usepackage{forest}\n
\\begin{document}\n
\\tikzset{every node/.style={draw, circle}}\n
\\begin{forest}\n";
    let rec dfs t = match t with
        | N(r, g, d, h)->
            fprintf f "[ %i " r;
            dfs g; dfs d;
            fprintf f "]\n"
        | V -> () in
    dfs t;
    fprintf f ";\n\\end{forest}\n\\end{document}\n";
    close_out f;
    let _ = sprintf "lualatex %s 1> /dev/null; rm -f *.aux *.log *.tex" file_out
    |> Sys.command in ();;
