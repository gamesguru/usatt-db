# usatt-db

Database for usatt ratings

## Connecting to database

Run this locally,
`./local.cmd`

For remote heliohost,
`./helio.cmd`

## Setup

Inside the SQL shell run either,

`\i sql/onboard/local.sql`, or `\i sql/onboard/helio.sql`

This will run the `players.sql` script among others, and create the main tables and functions.

## Other remarks

- To export and import the SQL image to and from csv files, use the `\i sql/__import.sql` && `\i sql/__export.sql` commands.

- To completely rebuild the SQL image (proceed with caution on PROD [helio]), run `\i sql/rebuild.sql`.

- To use the `python/legacy2csv.py` script, clone the `usatt-legacy` repo into the same folder as this one and rename it to `legacy`.  Run it from the root directory of this repo.

- See the `usatt-server` repo for environment variables that must be set for everything to work.
