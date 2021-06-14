FROM ocaml/opam:ubuntu-20.10-ocaml-4.08

RUN sudo -E apt-get -y install pkg-config m4 zlib1g-dev python3-pip libcairo2-dev libgmp-dev libzmq3-dev
RUN sudo -E pip3 install --upgrade pip
# Install jupyter
RUN sudo -E pip3 install notebook nbgitpuller

# Install the OCaml jupyter kernel and packages
RUN opam install -y jupyter cairo2 graphics archimedes jupyter-archimedes

RUN eval $(opam env) && ocaml-jupyter-opam-genspec
RUN sudo jupyter kernelspec install --name ocaml-jupyter "$(sudo -E -u opam opam var share)/jupyter"

RUN echo '#use "topfind";;' > /home/opam/.ocamlinit

COPY --chown=opam . /home/opam
