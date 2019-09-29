:;
:;
:; # A script to start the PostgreSQL server locally
:; # Set env var:   PSQL_USATT_LOCAL_DB_DIR
:;


:; # -- BASH -- #
:; sudo chown -R $LOGNAME:$LOGNAME /var/run/postgresql
:; pg_ctl initdb -D $PSQL_USATT_LOCAL_DB_DIR -l $PSQL_USATT_LOCAL_DB_DIR/postgreslogfile
:; pg_ctl -D $PSQL_USATT_LOCAL_DB_DIR -l $PSQL_USATT_LOCAL_DB_DIR/postgreslogfile start
:; psql postgresql://$LOGNAME@localhost:5432/usatt
:; exit

:; # - cmd.exe - #
pg_ctl initdb -D %PSQL_USATT_LOCAL_DB_DIR% -l %PSQL_USATT_LOCAL_DB_DIR%/postgreslogfile
pg_ctl -D %PSQL_USATT_LOCAL_DB_DIR% -l %PSQL_USATT_LOCAL_DB_DIR%/postgreslogfile start
psql postgresql://%USERNAME%@localhost:5432/usatt
