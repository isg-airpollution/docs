## Package Version Management

You can use the renv R package to document and reproduce the package versions you used in your analysis. 

The general workflow is:

1. Develop your analysis as normal, installing and removing R packages as they are needed for the project.

2. Call `renv::snapshot()` to save the state of the project library to the lockfile (called `renv.lock`) once you think the analysis is done.

3. Call `renv::restore()` to restore the state of the project library.

For further details check [renv's documentation](https://rstudio.github.io/renv/articles/renv.html).

::: {.callout-note appearance="simple"}
Working with renv in mounted network folders can not 
:::
