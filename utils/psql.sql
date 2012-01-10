
create table if not exists users (
  id serial not null primary key,
  name varchar(255),
  email varchar(255),
  password_hash varchar(255),
  auth_token varchar(255)
);
