---
title: "Getting Started"
---

Our group has a main network folder assigned named `airpollution`. A second network folder named `hpc_airpollution` is available to the group, which can be accessed through the institutional High Performance Computing cluster `isgcluster`. All the contents of the different projects should be organized in these shared folders as defined in the [Network Folders](network-folders.md) page.

Projects involving data analyses should be developed following a set of best practices in order to facilitate collaboration and promote reproducible research, as explained in the following pages:

* [Project Structure](project-structure.md)

* [Reproducible Research](reproducible-research.md)

* [Style Guide](style-guide.md)

Note that data subject to confidentiality agreements should never leave the institutional network folders. This ensures the data is safe from external threats as well as reducing the risk of data loss since the folders are backed up every week. Moreover if all the files are always in these network folders, it is easy to share your work with other members of the group.

::: {.callout-note appearance="simple"}

## Sharing data

When data needs to be shared with people outside of ISGlobal, use the institutional Nextcloud server called [Namek](https://namek.isglobal.org) for medium sized data.

:::

## Getting Access

IT must grant you access before you can connect to the network folders. Send an email to `sri.tic@isglobal.org` asking for access to the `airpollution` and `hpc_airpollution` network folders. When you do, also ask them how you can mount the `airpollution` and `hpc_airpollution` network folders in your laptop's file system for easy access.

### Internal Access

The `airpollution` and `hpc_airpollution` folders belong to the internal ISGlobal network. If you have an institutional laptop you should be able to efficiently access these mounted network folders while connected to the internal network through Ethernet cable at Campus Mar.

### Remote Access

When you are not connected to the internal network at Campus Mar through Ethernet cable, you will need to be connected to the Campus Mar VPN. Ask IT to setup the VPN in your system for accessing the network remotely.

::: {.callout-note appearance="simple"}

## Slow connections

When working remotely through the VPN, some operations such as opening files or reading/writing data from/to the network folders will be slower, as the VPN will limit the bandwidth speed.

:::


