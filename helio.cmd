:;
:;
:; # A script to connect to remote HelioHost postgreSQL server
:; # Set env vars:   PSQL_USATT_PASSWORD, PSQL_USATT_USER
:;


:; # -- BASH -- #
:; psql postgresql://$PSQL_USATT_USER:$PSQL_USATT_PASSWORD@usatt.heliohost.org:5432/usatt_usatt
:; exit

:; # - cmd.exe - #
psql postgresql://%PSQL_USATT_USER%:%PSQL_USATT_PASSWORD%@usatt.heliohost.org:5432/usatt_usatt
