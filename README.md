# Preparing conda environments to port to offline machine

## Prepare Dockerfile with Conda install instruction

The dockerfile contains instructions to:

1. Create conda env

```bash
# Example conda create command
conda create --name m-ws "python==3.11" "fastapi==0.109.0" "uvicorn-standard==0.27.0" "apscheduler==3.10.4" "httpx==0.26.0" "sqlalchemy==2.0.25" "psycopg2==2.9.9" "geoalchemy2==0.14.3" "shapely==2.0.2" "ipykernel==6.29.0" "tqdm==4.66.1" -c conda-forge -y
```

2. conda-pack the conda env

## Run build.sh and start.sh

start.sh will output the conda env into a .tar.gz file in local dir

## On the offline machine

1. unpack the file

```bash
# extracts X.tar.gz into folder named X
tar -xzf m-ws.tar.gz --one-top-level
```

2. Move this m-ws folder into the conda envs dir e.g. `/home/admin/miniconda3/envs`

3. conda activate then run `conda-unpack`

```bash
conda-unpack
```
