FROM --platform=linux/amd64 continuumio/miniconda3

ARG env_name

# REQUIRED ENV VAR
ENV PYTHONNOUSERSITE=True

# OPTIONAL ENV VARS
# ENV TORCH_CUDA_ARCH_LIST="7.5" \
#     IABN_FORCE_CUDA=1

# APT INSTALLS
# RUN apt clean && apt update && \
#     apt install --no-install-recommends -y build-essential git && \
#     apt clean && rm -rf /var/lib/apt/lists/*

RUN conda install --name base conda-pack -c conda-forge -y

COPY ./${env_name}.yml ./${env_name}.yml
RUN conda env create -f ${env_name}.yml

# PIP INSTALLS (IF NEEDED)
# ENV PATH=/opt/conda/envs/${env_name}/bin:$PATH \
#     CONDA_DEFAULT_ENV=${env_name}

# RUN pip install torch==1.13.0 torchvision==0.14.0 torchaudio==0.13.0 --extra-index-url https://download.pytorch.org/whl/cpu && \
#     pip install --no-cache-dir inplace-abn==1.1.0

# FINALLY CONDA-PACK
RUN conda-pack --name ${env_name} -o /${env_name}.tar.gz