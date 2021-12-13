# Version Control

Use of Git and GitHub for version control in data analysis projects is strongly encouraged. This allows to track all changes in the code and revert to a previous state in case of trouble. More importantly, it can make sharing and collaborating with others much easier.

Although it is possible to use a Git client with a General User Interface (GUI) such as RStudio or GitKraken for normal use, you may need to use the UNIX shell at some point. Some familiarity with the shell can be helpful in those cases.

## GitHub Organization Site

A [GitHub Organization](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/about-organizations) has been created for our group, where all version controlled projects should be hosted. The purpose of this site is to easily find, navigate and collaborate on largely source code based projects.

The Organization site is private, meaning that only allowed GitHub users can see its contents. You must have a GitHub account and contact Sergio Olmos (`sergio.olmos@isglobal.org`) requesting access. You will shortly receive an invitation to join the organization at GitHub.

## Quickstart

Below you can find a quick guide to get up and running with Git and GitHub for your projects using the bash shell (Git Bash in Windows).

::: {.callout-note appearance="simple"}

If you are new to Git or you are having trouble setting it up, you should read the more detailed [Happy Git and GitHub for the useR](https://happygitwithr.com/), which also shows how to work with Git in RStudio.

:::

### Setup

* Get a [GitHub]() account.

* Download and install [Git]().

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

* Clone a remote GitHub repository into your local machine:

```bash
git clone git@github.com:user/repo.git
```

* Make your existing local project a Git repository:

```bash
git init
```

* Add a remote repository to your existing local Git repository (after creating an empty GitHub repo):

```bash
git remote add origin git@github.com:user/repo.git
```

* Push and cement the tracking relationship between your local default branch (`main` here) and GitHub:

```bash
git push --set-upstream origin main
```

* Add/stage specific files:

```bash
git add R/clean-data.R R/fit-models.R
```

* Commit staged modifications:

```bash
git commit -m "A short message explaining changes made"
```

* Push changes to the linked remote repo:

```bash
git push
```

## How often to commit?

It is better to do many small commits, each for a set of related changes:

* Think of a small part of the analysis that needs to be added or fixed.

* Do the work.

* Test that it works.

* Add and commit.

Look at others' projects on GitHub to see what they do and what sort of commit messages they write.

## What to commit?

In general, commit only plain-text files (i.e. source code).
