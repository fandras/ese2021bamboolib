FROM jupyter/scipy-notebook:latest

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root

COPY data_for_container ${HOME}
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}

RUN pip install 'bamboolib>=1.26.0'
RUN python -m bamboolib install_nbextensions
RUN python -m bamboolib install_labextensions

RUN pip install keplergl 
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1
RUN jupyter labextension install keplergl-jupyter
