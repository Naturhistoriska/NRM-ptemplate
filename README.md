# NRM-ptemplate - A project template for sequencing projects at NRM

- Last modified: ons mar 27, 2024  10:27
- Sign: JN

Inspired by [A Quick Guide to Organizing Computational Biology
Projects](http://dx.doi.org/10.1371/journal.pcbi.1000424)

To initialize a new `project`, run these three steps:

    $ git clone https://github.com/nylander/NRM-ptemplate.git project
    $ cd project
    $ sh bin/init.sh

This will create the following file structure:

    project
    ├── analyses
    │   └── README.md
    ├── bin
    │   ├── fasta2tab
    │   ├── README.md
    │   └── tab2fasta
    ├── data
    │   └── README.md
    ├── doc
    │   └── README.md
    ├── metadata
    │   ├── ENA_sample_checklist.xlsx
    │   ├── ENA-study-checklist.md
    │   └── README.md
    ├── old
    ├── private
    │   └── README.md
    ├── raw-data
    │   └── README.md
    ├── README.md
    ├── results
    │   └── README.md
    ├── src
    │   ├── fasta_parser.pl
    │   ├── fasta_parser.py
    │   └── README.md
    ├── tmp
    └── wet-lab
        ├── img
        │   └── README.md
        └── README.md

Files are set under version control (git), except folders `private/`,
`raw-data/`, `old/` and `tmp/`. This can be changed by editing the `.gitignore`
file (see <https://git-scm.com/docs/gitignore>).

Furthermore, project-specific file-formatting settings for editors can be set
using the `.editorconfig` file (see <https://editorconfig.org/>).

