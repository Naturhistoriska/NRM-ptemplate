# Fill NGI Submit Sheet

- Last modified: ons nov 20, 2024  03:46
- Sign: JN

## Description

Automatically fill NGI sequencing submit sheet.

The script will populate an input file, e.g. [`NGI.xlsx`](dat/NGI.xlsx), with
short sample names from [`ENA.tsv`](dat/ENA.tsv), and corresponding dual
indices from the [`Illumina.xlsx`](dat/Illumina.xlsx), and save the output to
file `NGI.filled.xlsx`.

The ENA and Illumina input can be files or URL:s, and the ENA can be .tsv
(tab-separated) or .xlsx. If URLs, they are assumed to be xlsx.

Important: manually review the output before submitting the file to NGI.

## Usage

    $ fill_ngi_submit_sheet.py -e ENA.tsv NGI.xlsx

## Options

    -h, --help
      Show this help message and exit

    -e, --ena-file ENA_file
      ENA sample sheet. Can be a file path (.tsv or .xlsx) or an URL (to .xlsx).

    -i, --illumina-file ILLUMINA_file
      Illumina barcode sample sheet. Can be a file path (.xlsx) or an URL (to .xlsx).
      (default: https://nrmcloud.nrm.se/s/T3GgxSJyKeyxSwo/download)

    -w, --well WELL
      Well. (default: A1)

    -t, --sample-type {Finished library,Amplicon with adapters (low diversity)}
      Sample type. (default: Finished library)

    -p, --sequencing-platform {NovaSeq,MiSeq,NextSeq}
      Sequencing platform. (default: NovaSeq)

    -v, --version
      Print version and exit.
