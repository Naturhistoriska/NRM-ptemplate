#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2024 nylander <johan.nylander@nrm.se>
#
# Distributed under terms of the MIT license.

"""
Query https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/+taxon
Return taxId

"""

import requests
import sys
import re
import json

def ask_ena(taxon):
    taxon = re.sub(' ', '%20', taxon)
    #url = f'https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/{taxon}?binomialOnly=false'
    url = f'https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/{taxon}?binomialOnly=false'
    response = requests.get(url)
    if response.status_code == 200:
        response = json.loads(response.text)
        if response == []:
            return 'NoTaxID'
        else:
            return response[0]['taxId']

if __name__ == '__main__':
    taxon = sys.argv[1]
    print(ask_ena(taxon))
