drop table notes;
create table notes (
  id serial8 primary key,
  title varchar(140),
  task text,
  done varchar(1)
);