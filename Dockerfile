FROM --platform=linux/amd64 continuumio/miniconda3

ARG env_name

COPY ./${env_name}.yml ./${env_name}.yml
RUN conda env create -f ${env_name}.yml

RUN conda install conda-pack -c conda-forge -y
RUN conda-pack --name ${env_name} -o /${env_name}.tar.gz