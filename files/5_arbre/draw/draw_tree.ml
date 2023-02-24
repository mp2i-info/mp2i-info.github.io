type 'a tree = E | N of 'a * 'a tree * 'a tree;;

let tree_to_tex ?(file_out="out") t =
    let open Printf in
    let tex = sprintf "%s.tex" file_out in
    let f = open_out tex in
    fprintf f "\\documentclass[convert={outfile=\\jobname.png}]{standalone}\n
\\usepackage{tikz}
\\usepackage{forest}\n
\\begin{document}\n
\\tikzset{every node/.style={draw, circle}}\n
\\begin{forest}\n";
    let rec dfs t = match t with
        | N(r, g, d) ->
            fprintf f "[ %i " r;
            dfs g; dfs d;
            fprintf f "]\n"
        | E -> () in
    dfs t;
    fprintf f ";\n\\end{forest}\n\\end{document}\n";
    close_out f;
    let _ = sprintf "lualatex -shell-escape %s > /dev/null 2>&1" tex 
    |> Sys.command in
    let _ = Format.sprintf "rm -f %s.aux %s.log %s.tex %s.pdf" file_out file_out file_out file_out 
    |> Sys.command in
    ();;
