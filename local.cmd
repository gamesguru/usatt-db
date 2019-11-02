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


:; # Note: Must create db usatt from /postgres
:; # Note: On Windows, must create superuser "Shane" or %USERNAME% from php my pg admin
:; # - cmd.exe - #
pg_ctl initdb -D %PSQL_USATT_LOCAL_DB_DIR% -l %PSQL_USATT_LOCAL_DB_DIR%/postgreslogfile
pg_ctl -D %PSQL_USATT_LOCAL_DB_DIR% -l %PSQL_USATT_LOCAL_DB_DIR%/postgreslogfile start
psql postgresql://%USERNAME%:password@localhost:5432/usatt
