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
naziv varchar(50) not null,
opis text not null
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
datumizdavanja datetime not null,
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

insert into korisnici(korisnickoime,lozinka,email) values
('crThrteen','dfj2331fdf&%','crThreen125@gmail.com'),
('annxec','sf52llk5(&','annxec723@gmail.com'),
('apodabi','dndn67msk%&','apodabi836@gmail.com');

insert into serije(naziv,opis) values
('zvjezdane staze: nova generacija','Desetljeæima nakon pustolovina
posade originalnog broda Enterprise,
kapetan Jean-Luc Picard vodi novi Enterprise na 
misiju istraživanja nepoznatih svjetova.'),
('ljubav, smrt i roboti','U ovoj provokativnoj antologiji 
animiranih prièa koje predstavljaju Tim Miller i David Fincher
spajaju se strašna stvorenja, opaka iznenaðenja i crni humor.');

insert into sezone(naziv) values
('1. sezona'),
('2. sezona'),
('3. sezona');

insert into epizode(naziv,trajanje,opis,datumizdavanja) values
('susret kod fairpointa:1. i 2. dio','91','Na prvom putovanju novog broda
Enterprisea posada istražuje misterij koji okružuje stvaranje postaje
Farpoint na planetu Deneb IV.',null),
('gola sadasnjost','46','Èlanovi posade Enterprisea zaraženi su virusom
zbog kojeg se ponašaju kao da su pijani.',null),
('kodeks casti','46','Voða izvanzemaljske civilizacije zaljubljuje se
u poruènicu Yar i želi je odvesti sa sobom, na zaprepaštenje svoje supruge.',null),
('posljednja postaja','46','Tijekom potrage za tajanstvenom rasom po nazivu
Ferengiji, Enterprise iznenada ostaje bez napajanja energijom.',null);

insert into zanrovi(naziv) values
('akcija'),
('avantura'),
('komedija'),
('drama'),
('fantazija'),
('glazba'),
('romanticni'),
('znanstvena fantastika'),
('triler'),
('sport');