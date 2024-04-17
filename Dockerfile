FROM --platform=linux/amd64 continuumio/miniconda3

RUN conda create --name m-ws "python==3.11" "fastapi==0.109.0" "uvicorn-standard==0.27.0" "apscheduler==3.10.4" "httpx==0.26.0" "sqlalchemy==2.0.16" "psycopg2==2.9.9" "geoalchemy2==0.14.3" "shapely==2.0.2" "ipykernel==6.29.0" "tqdm==4.66.1" "ecs-logging==2.0.0" -c conda-forge -y

RUN conda install conda-pack -c conda-forge -y
RUN conda-pack --name m-ws -o /m-ws.tar.gz