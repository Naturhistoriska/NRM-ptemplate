# ptemplate - A project template

- Last modified: tor jan 25, 2024  11:46
- Sign: JN

Inspired by [A Quick Guide to Organizing Computational Biology
Projects](http://dx.doi.org/10.1371/journal.pcbi.1000424)

To initialize a new `project`, run these three steps:

    $ git clone https://github.com/nylander/ptemplate.git project
    $ cd project
    $ sh bin/init.sh

This will create the following file structure:

    ptemplate/
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
    ├──.editorconfig
    ├──.gitignore
    ├──.git/
    ├── old/
    ├── raw-data
    │   └── README.md
    ├── README.md
    ├── results
    │   └── README.md
    ├── src
    │   ├── fasta_parser.pl
    │   ├── fasta_parser.py
    │   └── README.md
    └── tmp/

Files are set under verion control (git), except folders `raw-data/`, `old/`
and `tmp/`.  This can be changed by editing the `.gitignore` file.

Furthermore, project-specific file-formatting settings for editors can
be set using the `.editorconfig` file. See more: <https://editorconfig.org/>.
