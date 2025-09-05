# NRM-ptemplate - A project template for sequencing projects at NRM

tl;dr

    $ git clone https://github.com/Naturhistoriska/NRM-ptemplate.git proj
    $ cd proj && sh bin/init.sh

## Description

This repository provides a file hierachy for sequencing projects at NRM.

By cloning this repository (see [Setup](#setup)), a folder structure is set up,
and a subset of these files are set under version control.

Furthermore, if necessary steps are checked (see
[Checklist](doc/Checklist.md)), the file structure and content is suitable for
raw data submission to the [European Nucleotide
Archive](https://www.ebi.ac.uk/ena/browser/home).

## Steps

- [ ] Clone and initialize this repository (see [Setup, Local project
  folder](#local-project-folder))
- [ ] Create a private repo at <https://github.com/Naturhistoriska> (see
  [Remote project folder](#remote-project-folder)).
- [ ] Gather necessary metadata from client (see
  [Checklist](doc/Checklist.md)).
- [ ] Continue to follow the [Checklist](doc/Checklist.md) (where applicable).

## Setup

Here we will clone the NRM-ptemplate repo under a new name sutiable for our
project (It is recommended to use an informative name for the project, e.g.,
`john-doe-fishes`). Thereafter we will manually create a repository with the
same name on [github.com/Naturhistoriska](https://github.com/Naturhistoriska).
After that, we will "push" all our local files to github.

### Local project folder

To initialize a new local project folder, run these three commands below. It
is recommended to use an informative name for the project, such as, e.g.,
`john-doe-fishes`.

    $ git clone https://github.com/Naturhistoriska/NRM-ptemplate.git john-doe-fishes
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

### Remote project folder

1. Open a web browser
2. Create a new project
(<https://github.com/organizations/Naturhistoriska/repositories/new>)
    - Add a name, preferably with PI name and project name. E.g.
      `john-doe-fishes`
    - Add a short description
    - Make sure the **Private** checkbox is ticked
    - Click on **Create repository**
3. Add the DNA-lab Team to the repository:
    - On the top panel, click on **Settings**
    - Left panel, click **Access Collaborators and teams**
    - Under Manage access: click on **Add teams**
    - Search for `Naturhistoriska/nrm-dna-lab` and continue
    - Choose a role: **Maintain** (or consider *Write* or *Admin*)
    - Click on **Add Naturhistoriska/nrm-dna-lab to this repository**
4. Return to your local repository and "push" your files to github

        $ git remote add origin git@github.com:Naturhistoriska/john-d-fishes.git
        $ git branch -M main
        $ git push -u origin main

## Notes

Inspired by [A Quick Guide to Organizing Computational Biology
Projects](http://dx.doi.org/10.1371/journal.pcbi.1000424)

