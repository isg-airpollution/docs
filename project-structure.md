---
title: "Data Analysis Projects"
---

Data analyses that involve source code should be placed inside a self-contained directory in one of the network folders. The names of these project folders should start with your name initials in capital letters followed by an underscore and a short informative name (i.e. `SO_physical-activity`).

A self-contained project must contain all the files, data and code necessary to obtain the final results of the analysis.  It creates everything it needs, in its own workspace or folder, and it touches nothing it did not create. This convention guarantees that the project can be moved around on your computer or onto other computers and will still work. See [Reproducible Research](reproducible-research.md) for more details on why this is important.

::: {.callout-note appearance="simple"}
Any resident R script is written assuming that it will be run from a fresh R process with working directory set to the project's root directory.
:::

## Basic Structure

Different projects will require different folder structures but some common minimal rules should be set to facilitate file navigation across projects among all team members.

* A `README.md` file describing the project.

* A `data/` folder containing all data files.

* An `R/` or `src/` folder containing all scripts in the analysis.

* An `output/` folder with the output of the project.

All these files/folders should be at the root of the project.

### `README.md`

All data analysis projects should contain a README file that helps collaborators, as well as future you, understand what the project does and how it does it. The use of [Markdown](https://www.markdownguide.org/) for these files is strongly encouraged.

The README file should contain at least the following information:

* Author/s: Who is involved in the analysis.

* Objectives: A paragraph or two explaining the main objectives of the analysis.

* Project structure: How files are organized inside the project.

* Reproducibility: Instructions on how to independently obtain the results.

### `data/`

All raw data files (.csv, .xlsx, etc.) should be placed in a folder named `data/`. If appropriate, consider creating two sub-directories `data/raw/` and `data/processed/`.

::: {.callout-warning}

When using Git and GitHub for version control, add this folder to the .gitignore file from the start so that possibly sensitive data is not tracked by Git and accidentally uploaded to GitHub.

:::

### `R/`

All R scripts should be placed inside a folder named `R/`. If you are using a programming language other than R, name this folder `src/`.

The code underlying the analysis should be divided into several scripts of a few hundred lines grouped by specific tasks, i.e. `read-data.R`, `fit-models.R`, ...

Each script should be standalone. That is, you should be able to run a given script without having to run any other script beforehand. For instance, if you save the data frames that you created in `read-data.R` inside the `data/processed/` folder, you should then explicitly read these files from `data/processed/` in any other script that uses these data frames. Do not assume that the `read-data.R` script has been evaluated in any subsequent script.

::: {.callout-note appearance="simple"}
Also note that all file paths in your scripts should be relative to the root of the project. Do not use absolute file paths unless strictly necessary. See [Reproducible Research](reproducible-research.md) for more details.
:::

### `output/`

All output files created by code that are meant to be publicly shared should be stored inside the `output/` folder. These output files could include the manuscript of the paper associated with the analysis, the PNG files with the figures used in the paper, or any other output file meant to be shared with others.

## Projects in practice

A common project structure could be:

```
.
├── data
│   └── raw-data.csv
├── master-script.R
├── output
│   ├── manuscript.md
│   ├── plot1.png
│   └── plot2.png
├── R
│   ├── fit-models.R
│   └── read-data.R
├── README.md
├── reports
│   └── exploratory-report.Rmd
└── SO_my-analysis.Rproj
```

Other common folders inside of projects are `figs/` for figures meant to be shared, `documents/` for relevant papers, or `reports/` for exploratory data analysis reports.

::: {.callout-note appearance="simple"}

## Master script

Note that there is a file called `master-script.R` in the root of the project. This file orchestrates all the scripts in the `R/` folder to produce the results of the analysis. See the [Reproducible Research](reproducible-research.md) section for more details.

:::

### Using RStudio

To create a new project use the Create Project command (available on the Projects menu and on the global toolbar). You can create an RStudio project in a brand new directory or in an existing directory where you already have R code and data. This creates a project file (`.Rproj`) within the project directory that tells RStudio this is the root folder of your project.

There are several ways to open an existing project:

* Using the Open Project command (available from both the Projects menu and the Projects toolbar) to browse for and select an existing project file (e.g. MyProject.Rproj).

* Selecting a project from the list of most recently opened projects (also available from both the Projects menu and toolbar).

* Double-clicking on the project file within the system file explorer (e.g. Windows Explorer, OSX Finder, etc.).

::: {.callout-note appearance="simple"}
When opening an RStudio project, RStudio starts a fresh R session and sets the current working directory to the root of the project, so there is no need to call `setwd()` yourself. See why this is important in [Reproducible Research](reproducible-research.md).
:::

See [this RStudio tutorial](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) for more detailed instructions.

### Using other IDE

IDEs make it easy to work within this project-oriented workflow. You may prefer to use an IDE other than RStudio, such as [VScode](https://renkun.me/2019/12/11/writing-r-in-vscode-a-fresh-start/) or [Emacs + ESS](https://solmos.netlify.app/post/2020-07-06-emacs-for-statisticians/emacs-for-statisticians/), which come with their own project-related tools. In fact, these editors may be preferable when working on the remote cluster as they allow interacting with remote R sessions over SSH.

### Using the {usethis} package

The {[usethis](https://github.com/r-lib/usethis)} R package provides a set of functions to create and manage R projects interactively. They do not need to be RStudio projects.

Useful functions to be run interactively in the R command line:

* Create a new project with `usethis::create_project()` and the absolute path where you want to create the project as the argument.

* Open an existing project with `usethis::proj_activate()` and the absolute path of the project as argument.

