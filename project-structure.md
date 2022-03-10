---
title: "Data Analysis Projects"
---

Data analyses that involve source code should be placed inside a self-contained directory in one of the network folders.

A self-contained project must contain all the files, data and code necessary to obtain the final results of the analysis.  It creates everything it needs, in its own workspace or folder, and it touches nothing it did not create. This convention guarantees that the project can be moved around on your computer or onto other computers and will still work. See [Reproducible Research](reproducible-research.md) for more details on why this is important.

The names of these project folders should start with your name initials in capital letters followed by an underscore and a short informative name:

`XX_project-name`


## Basic Structure

Different projects will require different folder structures but some common minimal rules should be set to facilitate file navigation across projects among all team members.

* A `README.md` file describing the project.

* A `data/` folder containing all data files.

* An `R/` or `src/` folder containing all scripts in the analysis.

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

All R scripts should be placed inside a folder named `R/`. If you are using a programming language other than R, name this folder `src/`. The code underlying the analysis should be divided into several scripts of a few hundred lines grouped by specific tasks, i.e. `read-data.R`, `fit-models.R`, etc.

## Example

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

Other common folders inside of projects are `output/` for the final output of the project, `documents/` for relevant papers or `reports/` for exploratory data analysis reports.

::: {.callout-note appearance="simple"}

## Master script

Note that there is a file called `master-script.R` in the root of the project. This file orchestrates all the scripts in the `R/` folder to produce the results of the analysis. See the [Reproducible Research](reproducible-research.md) section for more details.

:::

