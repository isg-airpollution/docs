---
title: "HPC Cluster"
---

ISGlobal provides a High Performance Computing (HPC) cluster named `isgcluster` where researchers can launch resource-intensive jobs. The cluster resources are managed by a job scheduler system called SLURM.

You may want to work on the cluster if:

* you need more computing power than your laptop can provide,

* your code takes a very long time to run,

* you need to run scripts on a schedule.


## Cluster Architecture

| Node name | Node type | CPUs (cores) | RAM (GB) |
|-----------|-----------|--------------|----------|
| yamabuki  | Login     | 32           | 256      |
| isgws07   | Computing | 72           | 512      |
| isgws08   | Computing | 72           | 512      |

## Partitions

The SLURM system provides different partitions (or job queues) which are intended to manage resource allocation according to different time and resource needs.

| Partition name | Max. Time | Max. CPUs/Node | Max. RAM/Node | Node parallelization |
|----------------|-----------|----------------|---------------|----------------------|
| debug          | 2h        | 8              | 32Gb (8x4)    | Not allowed          |
| short          | 2h        | 24             | 96Gb (24x4)   | Allowed              |
| long           | 30h       | 48             | 192Gb (48x4)  | Allowed              |
| no_limits      | No limit  | 72             | 432Gb (72x6)  | Allowed              |

The `debug` partition is well suited for interactive sessions and debugging. It is the default partition, i.e. jobs will be submitted to this partition unless a different partition is specified.

The `short` partition is well suited for short jobs with low resource requirements, while the `long` partition should be used for jobs with high resource requirements.

The `no_limits` partition should only be used for very specific jobs that require an extemely high amount of resources and/or have very high priority. Access to this partition must be requested to the IT team.

## Requirements

### UNIX shell

You should be familiar with basic UNIX shell commands.

File system navigation:

```bash
## Get current working directory
pwd
## Change working directory
cd path/to/directory
## Change to parent directory of current working directory
cd ..
## List folders and files of current working directory
ls
## Make new directory
mkdir path/to/new/directory
## Create new file
touch path/to/new/file.txt
```

R:

```bash
## Start an interactive R session
R
## Run R script non-interactively
R CMD BATCH path/to/my-script.R
## Run R script non-interactively
Rscript path/to/my-script.R
## Evaluate R commands
RScript -e "install.packages('tidyverse')"
```

### Miniconda

Miniconda allows you to install specific software (R, Emacs, etc.) from the Conda repositories inside isolated environments in the cluster. Miniconda is already installed in the cluster. Some useful commands are:

```bash
## Create a new environment
conda create my-environment
## Activate a specific environment
conda activate my-environment
## Deactivate the active environment
conda deactivate
## List all available environments
conda env list
## Search software packages
conda search software-name
## Install a softaware package from the conda-forge channel in the current env
conda install -c conda-forge software-name=x.x.x
```

## Getting Access

You will need to ask IT for access to the cluster `isgcluster` by reporting an IT incidence in the Intranet or sending an email to `sri.tic@isglobal.org`.

### Connecting

Once connected to the ISGlobal VPN, you can connect to the login node (`yamabuki`) by SSH using your ISGlobal credentials.

#### Linux/MacOS

On a bash terminal:

```bash
## By DNS
ssh username@yamabuki.isglobal.lan
## Or by IP address
ssh username@172.20.10.115
```

#### Windows

Using Putty or MobaXterm connect through SSH to `yamabuki.isglobal.lan` or `172.20.10.115` in port 22.
