# Preparing conda environments to port to offline machine

## Prepare Dockerfile with Conda install instruction

The dockerfile contains instructions to create conda env and conda-pack the conda env

## Run build_and_start.sh with --build-arg=`some_env_name`

`build_and_start.sh` will output the conda env into a .tar.gz file in local dir

    - Python version needs to be 3.10 for compatibility with Triton Docker
    - pip installs via `requirements.txt` should be put into the `env.yml` file under the pip section

## On the offline machine

1. unpack the file

```bash
# extracts X.tar.gz into folder named X
tar -xzf m-ws.tar.gz --one-top-level
```

2. Move this m-ws folder into the conda envs dir e.g. `/home/admin/miniconda3/envs`

3. conda activate then run `conda-unpack`

```bash
conda activate <environment>
conda-unpack
```

## For use in Triton Server

Simply transfer the packed `.tar.gz` file into the model repo
