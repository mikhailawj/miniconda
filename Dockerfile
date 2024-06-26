FROM --platform=linux/amd64 continuumio/miniconda3

RUN conda create --name image-converter "python==3.11" fastapi uvicorn-standard jsonschema cairosvg pillow pytest requests -c conda-forge -y

# PIP Installs if needed
RUN conda run --name image-converter pip install pillow-heif==0.16.0

RUN conda install conda-pack -c conda-forge -y
RUN conda-pack --name image-converter -o /image-converter.tar.gz