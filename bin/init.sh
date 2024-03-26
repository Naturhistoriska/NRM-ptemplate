#!/bin/bash

TIMESTAMP=$(date '+%Y-%m-%d')

## Set wd
SCRIPTPATH="$( cd "$(dirname "$0")" || exit ; pwd -P )"
PROJPATH=$(dirname "$SCRIPTPATH")
PROJNAME=$(basename "$PROJPATH")

echo "* Project name:" "$PROJNAME"

## Create doc/README.md
if true ; then
  cat << EOF > doc/README.md
# Project $PROJNAME

**Version:** $TIMESTAMP

**Sign:** $USER

## Description

Text here.

More documentation in the \`doc\` folder.

## Tools

$(find bin -type f -executable ! -iname "init.sh" -printf "* %p\n")

## Data

Data in the \`data\` folder, raw data in the \`raw-data\` folder.

## Analyses

Analyses in \`analyses\` folder.


Text here.

---

## Results

Results in \`results\` folder.

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
private/*
old/
tmp/
raw-data/*
!raw-data/README.md
EOF
  cat << EOF >> doc/README.md
Version Control

To track changes (after creating and editing files)

    git add --all
    git commit -m "first commit"

EOF
fi

## Create other README.md files
if true ; then
  for d in bin data raw-data analyses metadata results src ; do
  cat << EOF > "$d"/README.md
# $PROJNAME -- $d

**Version:** $TIMESTAMP

**Sign:** $USER

## Description

Text here.

EOF
  done
fi

## Create Notebook.md file
if true ; then
  cat << EOF > Notebook.md
# $PROJNAME -- Notebook

**Version:** $TIMESTAMP

**Sign:** $USER

## Description

Text here.

## TODO

- [ ] Secure metadata from user
- [ ] Data backup
- [ ] Clone repo on compute resource
- [ ]

EOF

fi

## List files and folders
echo "* Path, files and folders:"

if command -v tree >/dev/null 2>&1; then
  tree -I init.sh "$PROJPATH"
else
  ls -I init.sh -F "$PROJPATH"
fi

echo "* Start with file doc/README.md"

## Move init.sh to old/
mv "$0" "$PROJPATH"/old/

