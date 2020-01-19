:;
:;
:; # A script to connect to remote HelioHost postgreSQL server
:; # Set env vars:   PSQL_USATT_PASSWORD, PSQL_USATT_USER, PSQL_USATT_DATABASE
:;


:; # -- BASH -- #
:; source .env 
:; psql postgresql://$PSQL_USATT_USER:$PSQL_USATT_PASSWORD@alephdog.heliohost.org:5432/$PSQL_USATT_DATABASE
:; exit

:; # - cmd.exe - #
psql postgresql://%PSQL_USATT_USER%:%PSQL_USATT_PASSWORD%@alephdog.heliohost.org:5432/%PSQL_USATT_DATABASE%
