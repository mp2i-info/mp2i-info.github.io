FROM ubuntu

ARG NB_USER=student
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN apt-get update && apt install -y software-properties-common && add-apt-repository ppa:avsm/ppa \
    && apt install -y --no-install-recommends zlib1g-dev libffi-dev libgmp-dev libzmq5-dev pkg-config \
    build-essential curl sudo  ocaml opam python3-pip \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && pip3 install notebook sos-notebook \
    && python3 -m sos_notebook.install \
    && conda install -c conda-forge xeus-cling
    
RUN opam init -a -y --disable-sandboxing \
    && opam update \
    && opam upgrade -y \
    && opam install -y jupyter \
    && eval $(opam env) \
    && opam exec -- ocaml-jupyter-opam-genspec \
    && jupyter kernelspec install --name ocaml-jupyter "$(opam config var share)/jupyter"

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
WORKDIR ${HOME}
