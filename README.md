# NRM-ptemplate - A project template for sequencing projects at NRM

## TL;DR

    $ git clone https://github.com/Naturhistoriska/NRM-ptemplate.git new-proj
    $ cd new-proj && sh bin/init.sh

## Description

This repository provides a file hierachy for sequencing projects at NRM.

By cloning this repository (see [Setup](#setup)), a folder structure is set up,
and a subset of these files are set under version control. Importantly, if 
necessary steps are checked (see [Checklist](doc/Checklist.md)), the file 
structure and content is suitable for raw data submission to the [European
Nucleotide Archive](https://www.ebi.ac.uk/ena/browser/home).

After cloning and locally running the [init script](bin/init.sh), a remote
repository with the same name as the clone is created on
[github.com/Naturhistoriska](https://github.com/Naturhistoriska).

## Local requirements

To run the setup scripts, a local installation of [git](https://git-scm.com/)
and [gh](https://cli.github.com/) is needed. On Ubuntu Linux, one can do: `sudo
apt install git gh`.

## Steps

- [ ] Clone and initialize this repository (see [Setup, Local project
      folder](#local-project-folder))
- [ ] Initialize the new project and create a remote (github) repository
      (see [Initalize local project and create github repository](#initalize-local-project-and-create-github-repository))
- [ ] Make sure a private repo was created at
      <https://github.com/Naturhistoriska> (should have been automatically done in
      the step above. Else see [Remote project
      folder](#manual-creation-of-a-remote-project-folder)).
- [ ] Gather necessary metadata from client (see
      [Checklist](doc/Checklist.md)).
- [ ] Continue to follow the [Checklist](doc/Checklist.md) (where applicable).

## Setup

Here we will clone the NRM-ptemplate repository under a new name suitable for our
project (It is recommended to use a short and informative name for the project, e.g.,
`john-doe-fishes`). There after we will automatically create a repository with the
same name on [github.com/Naturhistoriska](https://github.com/Naturhistoriska).

### Local project folder

Make a local clone of the the NRM-ptemplate repository, and rename as we go

    $ git clone https://github.com/Naturhistoriska/NRM-ptemplate.git john-doe-fishes

### Initalize local project and create github repository

    $ cd john-doe-fishes
    $ sh bin/init.sh

This will create the following folder structure:

    john-doe-fishes
        ├── analyses/
        ├── bin/
        ├── data/
        ├── doc/
        ├── metadata/
        ├── old/
        ├── private/
        ├── rawdata/
        ├── results/
        ├── src/
        ├── tmp/
        ├── wetlab/
        ├── .git/
        ├── Notebook.md
        ├── README.md
        ├── .editorconfig
        └── .gitignore

Files are set under version control (git), except in folders `private/`,
`rawdata/`, `old/` and `tmp/`. This can be changed by editing the `.gitignore`
file (see <https://git-scm.com/docs/gitignore>).

Furthermore, project-specific file-formatting settings for editors can be set
using the `.editorconfig` file (see <https://editorconfig.org/>).

An empty remote repository with the same name as the local folder was also created
when running the `bin/init.sh` script. Please double check that this repository was
created (e.g. <https://github.com/Naturhistoriska/john-doe-fishes>) and that the team
"NRM-DNA-lab" can view it.

## Next steps

After initializing the local repository, take a look in the newly created files
[doc/README.md](doc/README.md) and [Notebook.md](Notebook.md).

Feel free to remove files and folders that you don't need for your particular project.

Add all relevant files with `git add`, then continue with `git commit`, and `git push`.

The content of this very README.md file could safely be replaced with your 
project-specific information.

### Manual creation of a remote project folder

If the init script ([`bin/init.sh`](bin/init.sh)) doesn't manage to create a 
repository on github, the following steps can be taken:

1. Open a web browser
2. Create a new project
(<https://github.com/organizations/Naturhistoriska/repositories/new>)
    - Add a name, preferably with **PI name** and **project name**. E.g.
      `john-doe-fishes`
    - Add a short **Description**
    - Make sure the **Private** checkbox is ticked
    - Click on **Create repository**
3. Add the DNA-lab Team to the repository:
    - On the top panel, click on **Settings**
    - Left panel, click **Access Collaborators and teams**
    - Under Manage access: click on **Add teams**
    - Search for `Naturhistoriska/nrm-dna-lab` and continue
    - Choose a role: **Maintain** (or consider *Write* or *Admin*)
    - Click on **Add Naturhistoriska/nrm-dna-lab to this repository**
4. Return to your local repository and "push" your files to github.
   **Important**: if your repository on GitHub is private, don't forget the
   `remote add origin` command below!  

        $ git remote add origin git@github.com:Naturhistoriska/john-d-fishes.git
        $ git branch -M main
        $ git push -u origin main

## Acknowledgements

File structure inspired by [A Quick Guide to Organizing Computational Biology
Projects](http://dx.doi.org/10.1371/journal.pcbi.1000424).
