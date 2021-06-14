FROM akabe/ocaml-jupyter-datascience:centos_ocaml4.05.0

RUN sudo pip install --no-cache --upgrade pip && \
    sudo pip install --no-cache notebook

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN sudo adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
