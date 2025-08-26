#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2024 nylander <johan.nylander@nrm.se>
#
# Distributed under terms of the MIT license.

"""
Check date format in ENA sample sheet.

"""

from sys import stderr
import re
import argparse
import pandas as pd

VERSION = '0.1'

def get_args():
    """
    Get arguments
    """
    parser = argparse.ArgumentParser(description='Check date format in ENA table')
    parser.add_argument('url', type=str, help='URL to ENA table (xlsx)')
    parser.add_argument('-v', '--version', dest='version', action='version',
                        version=VERSION, help='print version and exit.')
    return parser.parse_args()

def check_date_format(date):
    """
    Check if date is in format YYYY, YYYY-MM, or YYYY-MM-DD
    """
    if re.match(r'^\d{4}$', date):
        return True
    if re.match(r'^\d{4}-\d{2}$', date):
        return True
    if re.match(r'^\d{4}-\d{2}-\d{2}$', date):
        return True
    return False

def main(url):
    """
    Main function
    """
    data_frame = pd.read_excel(url, header=None)
    for i, row in data_frame.iterrows():
        if i < 3:
            continue
        date = str(row[8])
        date = re.sub(' 00:00:00$', '', date) # Remove seconds at the end (added by nextcloud/xlsx?)
        if not check_date_format(date):
            print(row[2], row[3], row[8], sep='\t')

    print('\nCorrect the entries above.', file=stderr)
    print('Allowed formats: YYYY, YYYY-MM, YYYY-MM-DD, missing: not collected', file=stderr)

if __name__ == '__main__':
    args = get_args()
    main(args.url)
