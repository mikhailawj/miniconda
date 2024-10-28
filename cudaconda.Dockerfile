# Use nvidia/cuda image
FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu18.04

# set bash as current shell
RUN chsh -s /bin/bash
SHELL ["/bin/bash", "-c"]

# install anaconda
RUN apt-get update
RUN apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
        apt-get clean
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda.sh && \
        /bin/bash ~/anaconda.sh -b -p /opt/conda && \
        rm ~/anaconda.sh && \
        ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
        echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
        find /opt/conda/ -follow -type f -name '*.a' -delete && \
        find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
        /opt/conda/bin/conda clean -afy


ENV PATH=/opt/conda/bin:$PATH

RUN conda install --name base conda-pack -c conda-forge -y

ARG env_name
ENV PYTHONNOUSERSITE=True \
    CONDA_OVERRIDE_CUDA="11.7" \
    TORCH_CUDA_ARCH_LIST="7.5" \
    IABN_FORCE_CUDA=1 \
    PATH=/opt/conda/envs/${env_name}/bin:$PATH \
    CONDA_DEFAULT_ENV=${env_name}

COPY ./${env_name}.yml ./${env_name}.yml
RUN conda env create -f ${env_name}.yml

RUN conda-pack --name ${env_name} -o /${env_name}.tar.gz