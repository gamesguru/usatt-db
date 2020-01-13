#!/bin/bash -e

export db=usatt

cd docs
mkdir -p $db
cd $db

# Generate docs, convert DOT --> EPS
postgresql_autodoc -d $db
dot -Tps $db.dot -o $db.eps

# Move up and convert to SVG
convert -flatten $db.eps $db.svg
mv $db.svg ..
