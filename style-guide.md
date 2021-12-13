# Style Guide


## File Names

Three principles for file names:

* Machine readable:
    * Avoid spaces, punctuation, accented characters
    * Case sensitive, i.e. `foo.csv != Foo.csv`

* Human readable:
    * Easy to figure out what something is, based on its name
    * Use `_` to separate fields
    * Use `-` to separate words of the same field

* Plays well with default ordering:
    * Left-pad numbers with 0, i.e. `01_read-data.R` instead of `1_read-data.R`
    * Use the ISO 8601 standard for dates, i.e. `YYYY-MM-DD_report.Rmd`

## Code Style

A common code style among all team members is important for collaboration. The following rules should be followed as strictly as possible:

* Strive to limit your code to 80 characters per line.

* Use two spaces for indentation.

* Use `camelCase` for user-defined functions.

* Use `snake_case` for anything else.

* Use verbs for user-defined function names.

* Always put a space after a comma, never before.

```r
# Good
x[, 1]

# Bad
x[,1]
x[ ,1]
x[ , 1]
```

* Place a space before and after `()`, when used with `if`, `for`, `while`.

```r
# Good
if (debug) {
  show(x)
}

# Bad
if(debug){
  show(x)
}
```

* Place a space after () used for function arguments.

```r
# Good
function(x) {}

# Bad
function (x) {}
function(x){}
```

* Most infix operators (`==`, `+`, `-`, `<-`, etc.) should always be surrounded by spaces.

```r
# Good
height <- (feet * 12) + inches
mean(x, na.rm = TRUE)

# Bad
height<-feet*12+inches
mean(x, na.rm=TRUE)
```

* Operators `$`, `@`, `^`, `::`, `:::`, and unary `:` should never be surrounded by spaces:

```r
# Good
sqrt(x^2 + y^2)
df$z
x <- 1:10

# Bad
sqrt(x ^ 2 + y ^ 2)
df $ z
x <- 1 : 10
```

* Use comments to explain the “why” not the “what” or “how”.

See the [Tidyverse](https://style.tidyverse.org/) or [Google](https://google.github.io/styleguide/Rguide.html) style guides for more details.
