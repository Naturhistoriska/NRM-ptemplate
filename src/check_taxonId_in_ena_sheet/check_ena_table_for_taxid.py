#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2024 nylander <johan.nylander@nrm.se>
#
# Distributed under terms of the MIT license.

"""

Read ENA sample list (xlsx) located at URL.
Check if taxon is present in ENA taxonomy database.
If present, return taxID, scientific name, sample alias and sample title.
If not present, return 'NoTaxID', 'NoTaxon', sample alias and sample title.

Test url: https://nrmcloud.nrm.se/s/CpAx9LkKqNdn6Tm/download

"""

import re
import json
import argparse
import requests
import pandas as pd

VERSION = '0.1'

def get_args():
    """
    Get arguments
    """
    parser = argparse.ArgumentParser(description='Check ENA table for taxID')
    parser.add_argument('url', type=str, help='URL to ENA table (xlsx)')
    parser.add_argument('-v', '--version', dest='version', action='version',
                        version=VERSION, help='print version and exit.')
    return parser.parse_args()

def ask_ena(taxon):
    """
    Query ENA taxonomy for taxid given string.
    """
    taxon = re.sub(' ', '%20', taxon)
    ena_url = f'https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/{taxon}?binomialOnly=false'
    response = requests.get(ena_url, timeout=10)
    if response.ok:
        response = json.loads(response.text)
        if response == []:
            return 'NoTaxID'
        return response[0]['taxId']
    return 1

def main(url):
    """
    Main
    """
    data_frame = pd.read_excel(url)
    for i in range(3, len(data_frame)):
        scientific_name = data_frame.iloc[i, 1]
        sample_alias = data_frame.iloc[i, 2]
        sample_title = data_frame.iloc[i, 3]
        sample_title = re.sub(' ', '_', sample_title)
        if pd.isna(scientific_name):
            print('NoTaxID', 'NoTaxon', sample_alias, sample_title, sep='\t')
        else:
            print(ask_ena(scientific_name), scientific_name, sample_alias, sample_title, sep='\t')

if __name__ == '__main__':
    args = get_args()
    main(args.url)
