ALTER SESSION SET "_ORACLE_SCRIPT" = true;

Create user AAA identified by aaa
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT connect, resource, create session, create view to AAA;

ALTER USER AAA default tablespace users quota unlimited on users;
