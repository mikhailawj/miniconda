# Preparing conda environments to port to offline machine

## Prepare Dockerfile with Conda install instruction

The dockerfile contains instructions to:

1. Create conda env

```bash
# Using environment.yml
conda env create -f environment.yml
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
