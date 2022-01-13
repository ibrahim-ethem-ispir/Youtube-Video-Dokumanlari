
/* Ýliþkisel Veritabaný ( RDMS ) */

create database universite
use universite

create table ogrenci (
	ogrno varchar(5) not null,
	adi varchar(25) not null,
	soyadi varchar(25) not null,
	tel varchar(11) null,
	dogum_tarih date null,
	bolum_id tinyint null,
	primary key (ogrno)
)

create table bolum(
	bolum_id tinyint not null,
	aciklama varchar(50) not null,
	primary key (bolum_id)
)

alter table ogrenci add constraint fk_ogrenci_bolum foreign key (bolum_id) references bolum(bolum_id)

insert into bolum(bolum_id,aciklama) values(1,'Bilgisayar'),(2,'Yazýlým'),(3,'Fen Edebiyat')
select * from bolum
insert into ogrenci (ogrno,adi,soyadi,tel,dogum_tarih,bolum_id) values('1001','ethem','ispir','1323446','1995-5-5',1)

select * from ogrenci

create table dersler(
	ders_id varchar(5) not null,
	aciklama varchar(50) null,
	ders_kredi tinyint null,
	bolum_id tinyint not null
	primary key (ders_id)
)
alter table dersler add constraint fk_dersler_bolum foreign key (bolum_id) references bolum(bolum_id)

insert into dersler(ders_id,aciklama,ders_kredi,bolum_id) values('50','Bilgisayar Donaným',3,1)
insert into dersler(ders_id,aciklama,ders_kredi,bolum_id) values('51','Veritabaý Dersi',4,1)

select * from dersler

create table notlar(
	ders_id varchar(5) not null,
	ogrno varchar(5) not null,
	vize tinyint not null,
	final tinyint not null,
	harf_notu varchar(2) not null,
	hoca_id tinyint null
)

create table hoca(
	hoca_id tinyint not null,
	adi varchar(25) not null,
	soyadi varchar(25) not null,
	tel varchar(11) null,
	primary key (hoca_id)
)

alter table notlar add constraint fk_notlar_hoca foreign key (hoca_id) references hoca(hoca_id)
alter table notlar add constraint fk_notlar_ogrenci foreign key(ogrno) references ogrenci(ogrno)
alter table notlar add constraint fk_notlar_dersler foreign key(ders_id) references dersler(ders_id)

insert into hoca(hoca_id,adi,soyadi,tel) values('10','Mehmet','aaa','55464415')
select * from hoca
insert into notlar(ders_id,ogrno,vize,final,harf_notu,hoca_id) values(50,'1001',50,60,'cc',10)

select * from notlar