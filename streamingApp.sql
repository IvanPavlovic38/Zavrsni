use master;
go

create database streamingApp;
go

use streamingApp;

create table korisnici(
sifra int not null primary key identity(1,1),
korisnickoime varchar(50) not null,
lozinka varchar(100) not null,
email varchar(100) not null,
jezik varchar(20)
);

create table serije(
sifra int not null primary key identity(1,1),
naziv varchar(50),
opis text
);

create table sezone(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
serija int
);

create table epizode(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
trajanje int not null,
opis text not null,
pogledano bit,
datumizdavanja datetime,
sezona int
);

create table zanrovi(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
);

create table zanrserije(
serija int not null,
zanr int not null
);

create table pogledanaepizoda(
korisnik int not null,
epizoda int not null
);

alter table sezone add foreign key (serija) references serije(sifra);
alter table epizode add foreign key (sezona) references sezone(sifra);
alter table zanrserije add foreign key (serija) references serije(sifra);
alter table zanrserije add foreign key (zanr) references zanrovi(sifra);
alter table pogledanaepizoda add foreign key (korisnik) references korisnici(sifra);
alter table pogledanaepizoda add foreign key (epizoda) references epizode(sifra);