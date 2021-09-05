# maj
sudo apt update

# jupyter
sudo apt install jupyter

# opam
sudo apt install opam

# lib ocaml-jupyter
sudo apt install m4
sudo apt install libzmq3-dev
sudo apt install libgmp-dev
sudo apt install pkg-config
sudo apt install zlib1g-dev
sudo apt install libcairo2-dev


# (indispensable) initialise opam
# A la fin, répondre y pour modification fichiers profile et ocamlinit
opam init --disable-sandboxing

# ocaml-jupyter
opam install jupyter
opam install ocaml-lsp-server

# hack
mkdir .local
mkdir .local/share
mkdir .local/share/jupyter
mkdir ~/.opam/default/share/jupyter

# kernel
sudo jupyter kernelspec install --name ocaml-jupyter "$(opam config var share)/jupyter"
