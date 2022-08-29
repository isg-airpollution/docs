---
title: "HPC Cluster"
---

ISGlobal provides a High Performance Computing (HPC) cluster named `isgcluster` where researchers can launch resource-intensive jobs. The cluster resources are managed by a job scheduler system called SLURM.

You may want to work on the cluster if:

* you need more computing power than your laptop can provide,

* your code takes a very long time to run.

## Cluster Architecture

| Node name | Node type | CPUs (cores) | RAM (GB) |
|-----------|-----------|--------------|----------|
| yamabuki  | Login     | 32           | 256      |
| isgws07   | Computing | 72           | 512      |
| isgws08   | Computing | 72           | 512      |
| isgws09   | Computing | 72           | 512      |

## Partitions

The SLURM system provides different partitions (or job queues) which are intended to manage resource allocation according to different time and resource needs.

| Partition name | Max. Time | Max. CPUs/Node | Max. RAM/Node   | Node parallelization |
|----------------|-----------|----------------|-----------------|----------------------|
| debug          | 6h        | 4              | 8Gb (2Gb/CPU)   | Not allowed          |
| short          | 12h       | 16             | 64Gb (4Gb/CPU)  | Not allowed          |
| long           | 72h       | 48             | 128Gb (4Gb/CPU) | Not allowed          |
| no_limits      | No limit  | 72             | 432Gb (6Gb/CPU) | Not allowed          |

The `debug` partition is well suited for interactive sessions and debugging. It is the default partition, i.e. jobs will be submitted to this partition unless a different partition is specified.

The `short` partition is well suited for short jobs with low resource requirements, while the `long` partition should be used for jobs with high resource requirements.

The `no_limits` partition should only be used for very specific jobs that require an extemely high amount of resources and/or have very high priority. Access to this partition must be requested to the IT team.

## User Accounts

All users belong by default to the `generic` account, which allows the user to use all non-restricted partitions. All jobs are submited to the debug partition by default, unless a different partition is specified.

An `unlimited` account allows users to use the `no_limits` partition and can be granted by IT for very specific jobs that cannot be accomodated by the other partitions.

| Account     | Partition                | Max concurrent jobs | Max total CPUs |
|-------------|--------------------------|---------------------|----------------|
| `generic`   | `debug`, `short`, `long` | 4                   | 48             |
| `unlimited` | `no_limits`              | 1                   | 48             |

## Requirements

### Access

You will need to ask IT for access to the cluster `isgcluster` by reporting an IT incidence in the Intranet or sending an email to `sri.tic@isglobal.org`.

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

## Connecting to `yamabuki`

You can connect to the login node (`yamabuki`) by SSH using your ISGlobal credentials. Refer to the HPC guide provided by IT for the DNS or IP address information.

## Software

### Modules

There are a large number of software applications, libraries, tools and compilers preinstalled on the cluster. All installed software is not directly available in the login node. Any software must be loaded as an "environment module" before it can be used.

You can list all modules available with:

```bash
module avail
```

And you can search for specific modules by passing a partial name to `module spider`.

Only the module Conda is available on the login node. All other software must be loaded and run in one of the computing nodes.

Any software module can be loaded with `module load`. For instance, you can load a pre-installed R version by typing:

```bash
module load lang/R/4.0.3-foss-2020a
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
## r-base, r-tidyverse, ...
conda install -c conda-forge software-name=x.x.x
```

R packages can also be installed through Conda but not all CRAN packages are available.

### R packages

R packages can also be installed in your home directory in the cluster by running R in one of the computing nodes and using the familiar `install.packages()` function.

One way to do this is first run an interactive terminal in one of the computing nodes:

```bash
srun --pty bash
```

Once logged in one of the computing nodes, load the R module:

```bash
module load lang/R/4.0.3-foss-2020a
```


And finally install the packages:

```bash
Rscript -e "install.packages('tidyverse')"
```

Or running an interactive R sessions with the `R` command and calling `install.packages()` in the command line interactively.

::: {.callout-note appearance="simple"}

You may want to add shortcuts for commonly typed commands by adding them to your `.bashrc` file.

Some useful shortcuts can be (add these lines to the end of your `~/.bashrc` file):

```bash
alias cdp="cd /PROJECTES/AIRPOLLUTION"
alias loadr="module load lang/R/4.0.3-foss-2020a"
```

:::

## SLURM

The `isgcluster` is managed by the scheduler system SLURM. In order to submit a job to the queueing system or run an interactive session in one of the computing nodes a specific set of commands must be used.

### `sbatch`

To submit a job to the queue system in the cluster you need pass a shell script to the command `sbatch`. This shell script must have the following format:

```bash
#! /bin/bash

# Set a Job name
#SBATCH --job-name=my_job

# Set a partition or queue to submit to
#SBATCH --partition=short

# Set a user account to submit as
#SBATCH --account=generic

# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-type=BEGIN,END,FAIL

# Where to send mail events
#SBATCH --mail-user=my-email@isglobal.org

# Run a single tasks
#SBATCH --ntasks=1

# Use 4 cpus for each task
#SBATCH --cpus-per-task=4

# Job memory request
#SBATCH --mem=16gb

# Standard output and error log
#SBATCH --output=output.log

# Clear the environment from any previously loaded modules
module purge > /dev/null 2>&1

# Load the module environment suitable for the job. In this case, R version 4.0.3
module load lang/R/4.0.3-foss-2020a

# And finally run the job calling R as you wold do using system R installation
Rscript my_script.R
```

Let's say that this shell script is named `run.sh`, then, with working directory in the same folder as the script, we can submit it to SLURM with:

```bash
sbatch run.sh
```

You can quickly print the log file that you specified in the `--output` option in the sbatch file using the command `cat`. In this case, it would be:

```bash
cat output.log
```

### `srun`

You can also launch an interactive shell in one of the computing nodes with the command `srun`. For an interactive session with the default options just type:

```bash
srun --pty bash
```

Once logged in, you may load any software that you wish and even run interactive R sessions for quick debugging.

::: {.callout-note appearance="simple"}

Please remember to always exit interactive sessions once finished by typing `exit` in the interactive shell.

:::

### Useful commands

| Command   | Description                                       |
|-----------|---------------------------------------------------|
| `squeue`  | List all currently scheduled jobs                 |
| `sstat`   | List resources being used                         |
| `scancel` | Cancel a scheduled job                            |
| `sinfo`   | View information about Slurm nodes and partitions |
