# README.md

- Last modified: tor nov 21, 2024  06:03
- Sign: nylander

## Description

Check date format in ENA sample sheet.

Allowed formats:

    2024
    2024-12
    2024-12-01
    missing: not collected

Note: pandas (or nextcloud? or??) may add " 00:00:00" to the end of the `collection_date`!


## Usage

    $ check_ena_table_date_format.py [-h] [-v] url

### Positional arguments

    url            URL to ENA table (xlsx)

### Options

    -h, --help     show this help message and exit
    -v, --version  print version and exit.
