#!/bin/bash

TIMESTAMP=$(date '+%Y-%m-%d')

## Set wd
SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"
PROJPATH=$(dirname "$SCRIPTPATH")
PROJNAME=$(basename "$PROJPATH")

echo "* Project name:" "$PROJNAME"

## Copy bins to bin

find src -type f -executable ! -iname "init.sh" -exec cp {} bin/. \;

## Create doc/README.md
if true ; then
  cat << EOF > doc/README.md
# Project $PROJNAME

**Version:** $TIMESTAMP

**Sign:** $USER

**PI**: PI Name, <PI.Name@nrm.se> (add PI contact information here)

**Data release date**: YYYY-MM-DD (add data release date here. See [metadata/README.md](../metadata/README.md))

## Description

Add text here.

## Documentation

Documentation in the \`doc\` folder.

## Notebook

Project [\`Notebook.md\`](../Notebook.md)

## Checklist

Project [\`Checklist.md\`](Checklist.md)

## Binaries and scripts

$(find -L bin -type f -executable ! -iname "init.sh" -printf "* [\`%p\`](../%p)\n")

To add project bin folder to PATH:

    export PATH="${PROJPATH}/bin:\$PATH"

## Metadata

Metadata in the [\`metadata\`](../metadata) folder.

## Data

Data in the [\`data\`](../data) folder, raw data in the [\`rawdata\`](../rawdata) folder.

## Analyses

Analyses in [\`analyses\`](../analyses) folder.

## Wet-lab

Wet-lab documents in [\`wetlab\`](../wetlab) folder.

## Results

Results in [\`results\`](../results) folder.

---

EOF
fi

## Reinit git, create .gitignore, and append to doc/README.md
if command -v git >/dev/null 2>&1; then
  cd "$PROJPATH" || exit
  if [ -e ".git" ] ; then
      rm -rf .git
  fi
  echo -n "* "
  git init
  cat << EOF > .gitignore
*.swp
private/*
old/*
tmp/
rawdata/*
!rawdata/README.md
EOF
  cat << EOF >> doc/README.md

EOF
fi

## Create other README.md files
if true ; then
  for d in bin data rawdata analyses metadata private results src wetlab wetlab/img ; do
  cat << EOF > "$d"/README.md
# $PROJNAME -- $d

**Version:** $TIMESTAMP

**Sign:** $USER

## Description

Add text here.

EOF
  done
fi

## Create Notebook.md file
if true ; then
  cat << EOF > Notebook.md
# $PROJNAME -- Notebook

**Version:** $TIMESTAMP

**Sign:** $USER

**PI:** PI Name<PI.Name@mail.com> (add contact information to PI here)

**Data release date:** YYYY-MM-DD (add data release date here)

## Description

Add text here.

## TODO

- [ ] Set up remote github repo
- [ ] Secure metadata from user
- [ ] Lab work
- [ ] Create sequencing order for NGI
- [ ] Download data
- [ ] Data backup
- [ ] Clone repo on compute resource
- [ ] ...

EOF

fi

## List files and folders
echo "* Path, files and folders:"

if command -v tree >/dev/null 2>&1; then
  tree -I init.sh "$PROJPATH"
else
  ls -I init.sh -F "$PROJPATH"
fi

echo "* Provided that you read the repo root README.md, start with file doc/README.md"

## Move init.sh to old/
mv "$0" "$PROJPATH"/old/

