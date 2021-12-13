# Network Folders

All projects should be stored at all times in one of the network folders assigned to the group:

| Network folder name | Description                             |
|---------------------|-----------------------------------------|
| `airpollution`      | Main folder                             |
| `hpc_airpollution`  | Folder mounted in the SLURM HPC cluster |

The `airpollution` network folder is where all projects should be stored at some point. In some circumstances, the folder `hpc_airpollution` may be better suited to store projects that will require the use of the institution's High Performance Computing (HPC) cluster. In these cases, the project folder should be moved from `hpc_airpollution` to `airpollution` when the project is finished.

If you will be using the HPC or need access to some projects inside `hpc_airpollution`, ask IT to give you access and mount the network folder in your file system.

## Structure

### `airpollution`

The organization inside of the main `airpollution` folder should have the following basic structure to facilitate navigation:

```
.
├── CHAI
│   ├── analyses
│   │   ├── OR_atherosclerosis
│   │   └── SO_physical-activity
│   ├── documents
│   │   └── atherosclerosis-proposal.docx
│   ├── manuscripts
│   │   └── physical-activity.docx
│   └── README_CHAI.md
└── EXPANSE
    ├── analyses
    │   ├── AC_air-pollution
    │   └── NO_movers
    ├── documents
    │   └── request_form.xlsx
    ├── manuscripts
    │   └── movers.pdf
    └── README_EXPANSE.md
```

The root of the `airpollution` network folder should contain directories with the name of the different broad research projects from which papers are meant to be produced. Inside these general folders there should be only three sub-folders:

* `analysis/` contains the different projects that involve data analyses. See the [Project Structure section](project-structure.md) for how to structure data analysis projects.

* `documents/` contains all documents relevant to the general research projects (i.e. proposals, relevant papers, data request forms, etc.) and can be further divided into as many sub-folders as needed.

* `manuscripts/` contains the final written manuscripts of all the papers that are preoduced.

A README file should also be placed in the research project's root folder. Ideally, this file should be a [Markdown](https://www.markdownguide.org/) document named `README.md`. The document should contain an overview of the given research project, including:

* Individuals involved and corresponding responsabilities.

* Objectives.

* General structure of the project.

### `hpc_airpollution`

The organization of the group network folder `hpc_airpollution` mounted in the HPC cluster can be more flexible. One simple way to organize the different projects inside this network folder is creating a directory named as your user, and store all your projects inside this directory.

::: {.callout-note appearance="simple"}
As mentioned before, all projects in `hpc_airpollution` should be moved to the appropriate path inside the `airpollution` network folder once the project is done.
:::