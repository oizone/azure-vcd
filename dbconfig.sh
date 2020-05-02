#!/bin/bash
        
psql "host=$DBNAME.postgres.database.azure.com port=5432 dbname=postgres user=$DBUSER@$DBNAME password=$DBPWD sslmode=require" -c "create user vcloud;"
psql "host=$DBNAME.postgres.database.azure.com port=5432 dbname=postgres user=$DBUSER@$DBNAME password=$DBPWD sslmode=require" -c "grant vcloud to $DBUSER;"
psql "host=$DBNAME.postgres.database.azure.com port=5432 dbname=postgres user=$DBUSER@$DBNAME password=$DBPWD sslmode=require" -c "create database vcloud owner vcloud;"
psql "host=$DBNAME.postgres.database.azure.com port=5432 dbname=postgres user=$DBUSER@$DBNAME password=$DBPWD sslmode=require" -c "alter user vcloud password '$DBPWD';"
psql "host=$DBNAME.postgres.database.azure.com port=5432 dbname=postgres user=$DBUSER@$DBNAME password=$DBPWD sslmode=require" -c "alter role vcloud with login;"

