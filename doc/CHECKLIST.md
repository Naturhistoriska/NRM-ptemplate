# ptemplate -- checklist

Ease the process going from sample information to ENA-sequence submission.

## Proposed workflow

- [ ] **1.** Have PI fill out the short description of the project following ENA
   standards. Note that text can be altered later.
    - [ ] Short descriptive study title:
    - [ ] Data release date (can be as much as 2 years beyond the present date):
    - [ ] Detailed study abstract:

- [ ] **2.** Provide PI with the ENA-sample sheet
  ([xlsx](doc/ENA_sample_checklist.xlsx)) as a **shared document on
  [nrmcloud.nrm.se](https://nrmcloud.nrm.se)** (alt. Google or GitHub. If from
  a private GitHub repo, then one needs complicated authentication procedures.)
    - [ ] Add PI's short sample ids (e.g. "Sap301") as column `sample_alias`,
      and longer sample title (e.g. `Pouteria_atlantica_Sap301`) as column
      `sample_title`. Tip: If white spaces are replaced with underscores in
      `sample_title`, they can easily be used as tip labels in trees etc.
    - [ ] Add NCBI/ENA TaxID
    - [ ] Identify taxa *not* in NCBI
      (<https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/Homo%20sapiens>,
      <https://www.ebi.ac.uk/ena/taxonomy/rest/scientific-name/Apa%20bpa>). See
      script below.
    - [ ] Make sure date format is correct ("2024-11-28", "2024-11", "2024").
      See script below.
    - [ ] Make sure country is according to standard list
      (<https://www.insdc.org/submitting-standards/geo_loc_name-qualifier-vocabulary/>)
    - [ ] Use standardized vocabulary for missing data:
      <https://ena-docs.readthedocs.io/en/latest/submit/samples/missing-values.html#insdc-missing-value-reporting-terms>

- [ ] **3.** Receive ENA-sample sheet from PI, together with a list of taxon names not
   present in NCBI/ENA taxonomy db. If we get such a list, there are different
   ways of handling them. See
   <https://ena-docs.readthedocs.io/en/latest/faq/taxonomy_requests.html>.  To
   check the format in step 2. use
    - [ ] [`check_ena_table_date_format`](src/check_date_format_in_ena_sheet/README.md)
    - [ ] [`check_ena_table_for_taxid`](src/check_taxonId_in_ena_sheet/README.md).

- [ ] **4.** Fill in NGI sequencing sheet ([xlsx](doc/NGI.xlsx)). Do this
  programmatically (see Notes).  We are interested in column "NGI Sample ID"
  (e.g. `P28253_1001`) and "Your sample name". We wish to link "Your sample
  name" with `sample_alias` in the ENA sample sheet (e.g. "Sap301").
    - [ ] Use [`fill_ngi_submit_sheet`](src/fill_ngi_submit_sheet/README.md)

- [ ] **5.** Hand in NGI-sequencing sheet to [NGI](https://www.scilifelab.se/units/ngi/).

- [ ] **6.** Receive NGI sequencing report (*ADD TEXT*).

- [ ] **7.** Add info from NGI-sequencing report in to ENA-sample sheet (*ADD TEXT*).

- [ ] **8.** Download data using [dds](https://scilifelabdatacentre.github.io/dds_cli/)
   directly on backup server nrmdna01.nrm.se

- [ ] **9.** Perform any analysis using the data

- [ ] **10.** Based on the sequencing success and analysis, make a selection of samples
    to keep in the ENA-sample sheet.

- [ ] **11.** Submit ENA-sample sheet as .tsv(!) to ENA (through [ENA
   webin](https://www.ebi.ac.uk/ena/submit/webin/login))

- [ ] **12.** Calculate MD5 sums and locate fastq files. Populate the
    [`ENA_fastq2_template_xxxx.tsv`](doc/ENA_fastq2_template_xxxx.tsv) file.

- [ ] **13.** Upload fastq sequences using `lftp` to ENA (<webin2.ebi.ac.uk>)

- [ ] **14.** Upload ENA fastq sheet as .tsv(!) to ENA (through [ENA webin](https://www.ebi.ac.uk/ena/submit/webin/login))

## Notes

- "Data files must be uploaded into a submitter specific private Webin file
  upload area before they can be submitted."

### From NGI:

**Library Information Sheet**

Please make sure the library information sheet (attached) is updated with the
plate barcode (a combination of your project ID, see user agreement, and the
plate number: e.g. PxxxxxP1 for the first sample plate). Each plate that is
submitted to NGI needs to be accompanied by a separate filled-in document and
it is crucial that the plate barcode corresponds with the ID in each file.

    - Fill in each individual library in the table on the left, and indicate
      they are in the same pool by giving them the same well location (e.g. A1
      for the first pool). Here you also need to specify the sample index
      (refer to our guide here).
    - Pools will automatically be summarised in the table to the right where
      you also specify average fragment length and concentration of the pools.

Library information sheets, a full PDF report of the electropherograms for the
library pools and signed agreements need to be sent to us electronically prior
to sample delivery.

### NGI excel sheet

The NGI excel sheet ("NGI") need to be filled out with information from two
sources:

1. `ENA_default_sample_checklist.tsv` ("ENA")
2. Illumina index list ("ILL") [`Illumina_unique_dual_index_seqs_updated20240209.xlsx`](<https://drive.google.com/file/d/1liMi_K7MjPK-RUsMzQOF0Dok1Dq2pdlT/view>)

Then, to populate NGI:

- From ENA (.tsv), copy cells from third column, fourth row; insert in NGI: sheet "Sample information", col. Q, row 20
- From ILL, sheet "Illumina info", col. A, row 2, insert in NGI: sheet "Sample information", col. S, row 20
- From ILL, sheet "Illumina info", col. H (or G), row 2, insert in NGI: col. U, row 20
- Insert string "Custom" in NGI, col. R, row 20

**Important**: if one wish to run several libraries for the same sample, one
need to make manual adjustments in the NGI file at this stage. This will have
the consequence that there might not be unique strings in the (NGI) field "Your
sample name", but we will have unique strings in the auto-generated (NGI) field
"NGI Sample ID".

## Links

- Documentation on the ENA sequence submissions: <https://ena-docs.readthedocs.io/en/latest/submit/general-guide.html>
- ENA Webin portal: <https://www.ebi.ac.uk/ena/submit/webin/login>
- ENA default sample checklist: <https://github.com/ELIXIR-Belgium/ENA-metadata-templates/tree/main/templates/ERC000011>
- ena-upload-cli: <https://github.com/usegalaxy-eu/ena-upload-cli/tree/master>
- Configuring Your Firewall For ENA Upload: <https://ena-docs.readthedocs.io/en/latest/submit/fileprep/upload.html#appendix-configuring-your-firewall-for-ena-upload>
- NGI: <https://ngisweden.scilifelab.se/methods/illumina-user-provided/>
