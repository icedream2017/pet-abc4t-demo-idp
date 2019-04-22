CREATE TABLE `idp_users` (
  u_id varchar(20) primary key,
  u_name varchar(20) not null ,
  u_pass varchar(80) not null ,
  u_secpass varchar(80) ,
  u_type int default 0,
  u_activeflag int default 0,
  u_banflag int default 0
);

CREATE TABLE `idp_persons` (
  u_id varchar(20) references idp_users,
  p_id varchar(20) primary key ,
  p_title varchar(20) ,
  p_surname varchar(20) not null ,
  p_firstname varchar(40) not null ,
  p_gender int default 0,
  p_birthdate datetime,
  p_address varchar(80),
  p_email varchar(40),
  p_phone varchar(20),
  p_description varchar(100)
);

CREATE TABLE `idp_identities` (
  u_id varchar(20) references idp_users,
  i_id varchar(20) primary key ,
  i_hash varchar(80) not null ,
  i_purpose varchar(40),
  i_pubkey varchar(100) not null ,
  i_privkey varchar(100) not null
);

CREATE TABLE `idp_enterprises` (
  u_id varchar(20) references idp_users,
  e_id varchar(20) primary key ,
  e_name varchar(40) not null ,
  e_address varchar(80),
  e_email varchar(40),
  e_phone varchar(20),
  e_description varchar(100)
);
