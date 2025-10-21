---
title: "Data Analysis Projects"
---

Data analyses that involve source code should be placed inside a self-contained directory in one of the network folders.

A self-contained project must contain all the files and code necessary to obtain the final results of the analysis.  It creates everything it needs, in its own workspace or folder, and it touches nothing it did not create. This convention guarantees that the project can be moved around on your computer or onto other computers and will still work. See [Reproducible Research](reproducible-research.md) for more details on why this is important.

The names of these project folders should start with your name initials in capital letters followed by an underscore and a short informative name:

`XX_project-name`


## Basic Structure

Different projects will require different folder structures but some common minimal rules should be set to facilitate file navigation across projects among all team members. 

We will implement a two-step approach to reduce duplicated data. The process will involve two types of analysis:

Data Management – focused on preparing, cleaning, and standardizing the data to ensure consistency and accuracy.

Data Analysis – performed after the data has been properly managed, aimed at extracting insights and validating the quality of the treatment applied.

The results of these two steps will be dependent on each other. In other words, we must first complete the data management stage before moving on to the data analysis stage. The analysis will not only highlight the outcomes of the data treatment but also allow us to compare our results with those of our colleagues.

By following this structured process, we minimize the risk of:

- Repeating the same tasks unnecessarily,

- Using different or outdated versions of the data, and

- Creating inconsistencies across analyses.

This ensures that everyone works with a single, reliable version of the dataset.

* A `README.md` file describing the project.

* An `R/` or `src/` folder containing all scripts in the analysis.

All these files/folders should be at the root of the project.

### `README.md`

All data analysis projects should contain a README file that helps collaborators, as well as future you, understand what the project does and how it does it. The use of [Markdown](https://www.markdownguide.org/) for these files is strongly encouraged.

The README file should contain at least the following information:

* Author/s: Who is involved in the analysis.

* Objectives: A paragraph or two explaining the main objectives of the analysis.

* Project structure: How files are organized inside the project.

* Reproducibility: Instructions on how to independently obtain the results.

::: {.callout-warning}

When using Git and GitHub for version control, add this folder to the .gitignore file from the start so that possibly sensitive data is not tracked by Git and accidentally uploaded to GitHub.

:::

### `R/`

All R scripts should be placed inside a folder named `R/`. If you are using a programming language other than R, name this folder `src/`. The code underlying the analysis should be divided into several scripts of a few hundred lines grouped by specific tasks, i.e. `read-data.R`, `modelling-data.R`, etc.

## Example

A common project structure could be:

(I) DATA-MANAGEMENT

```
.
├── master-script.R
├── README.md
├── R
│   ├── read-data.R
│   └── process-data.R
│   └── write-data.R
├── outputs
│   └── XXXX
├── documentation
│   └── documentation, labelling and more
├── scratch
│   └── scratch-testing_XXXX.R
```

(II) DATA-ANALYSIS

```
.
├── master-script.R
├── README.md
├── R
│   ├── read-data.R
│   ├── process-data.R
│   ├── modelling-data.R
│   ├── report-functions.R
│   └── write-data.R
├── outputs
│   ├── plot1.png
│   └── plot2.png
├── reports
│   ├── report-templates
│   └── report-results
├── scratch
│   └── scratch-testing_XXXX.R
```

Other common folders inside of projects are `output/` for the final output of the project, `documents/` for relevant papers or `reports/` for exploratory data analysis reports.

---

### (I) **DATA-MANAGEMENT**

* A `README.md` file describing the purpose of the data management stage, instructions for running the scripts, and explanations of the input/output files.

* A `master-script.R` that serves as the entry point to execute the entire data management workflow in sequence.

* An `R/` folder containing all R scripts used in this stage:

  * `read-data.R` → scripts for importing raw datasets from various formats.
  * `process-data.R` → scripts for cleaning, transforming, and standardizing the data. and joining.
  * `write-data.R` → scripts for exporting the processed datasets into a consistent format for downstream use.

* An `outputs/` folder containing processed data files (ready for analysis).

* A `documentation/` folder for data dictionaries, variable labelling, metadata, and methodological notes.

* A `scratch/` folder for experimental or ad-hoc scripts (e.g., `scratch-testing_XXXX.R`). This space is not part of the production workflow but useful for prototyping.

---

### (II) **DATA-ANALYSIS**

* A `README.md` file describing the analysis stage, including instructions for running models, generating outputs, and producing reports.

* A `master-script.R` that orchestrates the full analysis pipeline from data import to reporting.

* An `R/` folder containing the analysis scripts:

  * `read-data.R` → imports the cleaned/processed datasets produced during the data management stage.
  * `process-data.R` → applies any additional transformations required for modelling.
  * `modelling-data.R` → scripts implementing statistical models, machine learning, or hypothesis testing.
  * `report-functions.R` → helper functions for visualization, summaries, and report generation.
  * `write-data.R` → exports analysis results (e.g., model outputs, summary tables).

* An `outputs/` folder storing generated outputs such as plots, tables, and figures (`plot1.png`, `plot2.png`, etc.).

* A `reports/` folder for:

  * `report-templates/` → markdown, LaTeX, or RMarkdown templates for standardized reports.
  * `report-results/` → final reports generated from the analysis stage.

* A `scratch/` folder for exploratory analysis scripts (`scratch-testing_XXXX.R`).

---

⚖️ This way, **DATA-MANAGEMENT** ensures all data is standardized and well-documented before being used, and **DATA-ANALYSIS** focuses only on insights, reproducibility, and reporting, with clear separation of responsibilities.

---

::: {.callout-note appearance="simple"}

## Master script

Note that there is a file called `master-script.R` in the root of the project. This file orchestrates all the scripts in the `R/` folder to produce the results of the analysis. See the [Reproducible Research](reproducible-research.md) section for more details.

:::

