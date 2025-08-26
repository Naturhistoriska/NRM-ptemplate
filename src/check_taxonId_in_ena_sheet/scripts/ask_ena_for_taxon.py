#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2024 nylander <johan.nylander@nrm.se>
#
# Distributed under terms of the MIT license.

"""
Query https://www.ebi.ac.uk/ena/taxonomy/rest/tax-id/+taxid

Handle cases when response.status_code == 404

"""

import requests
import sys
import json

def ask_ena(taxid):
    url = f'https://www.ebi.ac.uk/ena/taxonomy/rest/tax-id/{taxid}'
    response = requests.get(url)
    if response.status_code == 404:
        print(response.status_code)
        return 'NoTaxon'
    elif response.status_code == 200:
        response = json.loads(response.text)
        return response['scientificName']

if __name__ == '__main__':
    taxid = sys.argv[1]
    print(ask_ena(taxid))
