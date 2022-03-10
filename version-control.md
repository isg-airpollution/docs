# Version Control

Use of Git and GitHub for version control in data analysis projects is strongly encouraged. This allows to track all changes in the code and revert to a previous state in case of trouble. More importantly, it can make sharing and collaborating with others much easier.

Although it is possible to use a Git client with a General User Interface (GUI) such as RStudio or GitKraken for normal use, you may need to use the UNIX shell at some point. Some familiarity with the shell can be helpful in those cases.

## GitHub Organization Site

A GitHub Organization has been created for our group at:

[https://github.com/isg-airpollution](https://github.com/isg-airpollution)

All version controlled projects should be hosted in this site to facilitate all group members to find, navigate and collaborate on largely source code based projects.

If you are not already a member of the Organization, please contact Sergio Olmos and provide your GitHub user name.

## Quickstart

Below you can find a quick guide to get up and running with Git and GitHub for your projects using the bash shell (Git Bash in Windows).

::: {.callout-note appearance="simple"}

If you are new to Git or you are having trouble setting it up, you should read the more detailed [Happy Git and GitHub for the useR](https://happygitwithr.com/), which also shows how to work with Git in RStudio.

:::

### Setup

* Get a [GitHub](https://github.com/) account.

* Download and install [Git](https://git-scm.com/downloads).

* Set up Git with your user name and email:

    ```bash
    git config --global user.name "Your name here"
    git config --global user.email "your_email@example.com"
    ```

* Set up SSH on your computer.

    * Look to see if you have files `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub` or similar.

    * If not, create such public/private keys:

    ```bash
    ssh-keygen -t ed25519 -C "Descriptive-comment"
    ```

    * Add key to ssh-agent, substituting the correct name for your key:

    ```bash
    ssh-add ~/.ssh/id_ed25519
    ```

* Provide public key to GitHub:

    * Copy your public key.

    * Paste it in GitHub: *`Account Settings > SSH Keys > Add SSH Key`*.
    
    * Test it:
    
    ```bash
    ssh -T git@github.com
    ```

### Typical use

Clone a remote GitHub repository into your local machine:

```bash
git clone git@github.com:user/repo.git
```

Make your existing local project a Git repository:

```bash
git init
```

Add a remote repository to your existing local Git repository (after creating an empty GitHub repo):

```bash
git remote add origin git@github.com:user/repo.git
```

Push and cement the tracking relationship between your local default branch (`main` here) and GitHub:

```bash
git push --set-upstream origin main
```

Add/stage specific files:

```bash
git add R/clean-data.R R/fit-models.R
```

Commit staged modifications:

```bash
git commit -m "A short message explaining changes made"
```

Push changes to the linked remote repo:

```bash
git push
```

## How often to commit?

It is better to do many small commits, each for a set of related changes:

* Think of a small part of the analysis that needs to be added or fixed.

* Do the work.

* Test that it works.

* Stage and commit.

Commit messages should be short and informative. Look at others' projects on GitHub to see what they do and what sort of commit messages they write.

## What to commit?

In general, commit only plain-text files (i.e. source code). You can exclude any file or folder from being version controlled by including them in the project's `.gitignore` file. This is specially important for files containing sensitive data. Moreover, binary files and HTML files should generally be ignored as well in most data analysis projects.

The [`repo-template`](https://github.com/isg-airpollution/repo-template) in the isg-airpollution site provides a repository template with an initial `.gitignore` file containing a set of files and folders that should not be tracked by Git in most cases. If you are starting a new project, consider creating first a GitHub repository using this template and then cloning this remote repo to the appropriate network folder path in your local machine.
