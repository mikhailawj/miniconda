FROM --platform=linux/amd64 continuumio/miniconda3

COPY ./environment.yml ./environment.yml
RUN conda env create -f environment.yml

RUN conda install conda-pack -c conda-forge -y
RUN conda-pack --name ocr-server-cpu -o /ocr-server-cpu.tar.gz