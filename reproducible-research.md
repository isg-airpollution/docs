# Reproducible Research

Here we present some general best practices for open and reproducible science. Researchers in the group are strongly encouraged to adhere to these practices for all their data analysis projects.

## Project-Oriented Workflow

### Working directory intentionality

When working on a self-contained project as the one described [before](project-structure.md), the working directory must be set to the project's root folder. Moreover, every time you open a project, it should start in a fresh R session to avoid any interactions with code you might have run beforehand.

::: {.callout-note appearance="simple"}
Note that `rm(list = ls())` does not make a fresh R session since this will not detach packages.
:::

Ideally, this is achieved via development workflow and tooling, not by placing calls to `setwd()` with absolute paths into the code. I strongly recommend using an Integrated Development Environment (IDE) that supports a project-based workflow. This eliminates the tension between your development convenience and the portability of the code. More details in the next section.

A consequence of this approach is that you should never save your workspace to .RData on exit. This can be disabled by default in RStudio's Global Options.

![](global-options.jpeg)

### File path discipline

In general, no absolute paths should appear in your scripts. Absolute paths are specific to your machine. That is why setting your working directory by baking `setwd("C:\Users\sergio\path\that\only\I\have")` into your scripts will not work in other computer. If you change computers or someone else tries to run your analysis on her machine, the code will not work.

All paths must be relative to the project's root folder. That is why we need to include all the necessary files inside our project's folder. With this setup, we can move the project folder to different folders in our computer, or even to different computers entirely.

One last issue to note regarding file paths is that the syntax will be different in different operating systems, even for relative paths. The {[here](https://github.com/jennybc/here_here)} package provides a simple way to wrap file paths so that they work across any operating system and integrates very smoothly into this project-oriented workflow.

## Master Script

A master script should be provided at the root of the project which produces the final results of the analysis. The name of this master script should be indicated in the README file of the project.

Instead of runing the code in each script "manually" and saving the results, you should have a single master script that orchestrates the whole process, thus making sure that all the results are in-sync. Moreover, a master script can help a colleague looking at your analysis understand how to reproduce your results.

There are a few options but a bare-bones approach can be to create a separate script that sources each of your analysis scripts in the right order.

```r
## master-script.R at the root of your project
library(tidyverse)
library(mgcv)

source("R/read-data.R")
source("R/fit-models.R")
source("R/create-tables.R")
source("R/create-figures.R")
```

There are more sophisticated and helpful ways to provide a master script. Check the [targets]() R package and [GNU Make]().

## Package Version Management

You can use the renv R package to document and reproduce the package versions you used in your analysis. 

The general workflow is:

1. Develop your analysis as normal, installing and removing R packages as they are needed for the project.

2. Call `renv::snapshot()` to save the state of the project library to the lockfile (called `renv.lock`) once you think the analysis is done.

3. Call `renv::restore()` to restore the state of the project library.

For further details check [renv's documentation](https://rstudio.github.io/renv/articles/renv.html).

