use kutuphane
/* Distinct, order by,insert into, update, delete ,truncate*/

/* 1- ��renci tablosunda olan s�n�flar� tekrar olmadan getir */
select * from ogrenci
select distinct sinif from ogrenci 

/* 2- ��renci tablosunda olan isimleri tekrar olmadan getir */
select distinct ad from ogrenci

/* 3- ��renci tablosunu puana g�re ARTAN s�rada listeleyiniz */
select * from ogrenci order by puan asc

/* 4- ��renci tablosunu puana g�re AZALAN s�rada listeleyiniz */
select * from ogrenci order by puan desc

/* 5- ��renci tablosunda ad'a g�re artan puan'a g�re azalan s�rada listeleyin */
select * from ogrenci order by ad asc , puan desc

/* 6- t�r tablosuna kay�t ekleyiniz */
select * from tur
insert into tur(ad) values('Ara�t�rma 5')
set identity_insert tur off


/* 7- t�r tablosuna ayn� anda 2 tane kay�t ekleyin */
insert into tur (ad) values('Ara�t�rma 6'),('Ara�t�rma 7')

/* 8- kitap2 tablosundaki t�m kay�tlar� silin ve tablo yeni olu�turulmu� gibi olsun */
delete from kitap2
truncate table kitap2
select * from kitap2

/* 9- kitap tablosundaki kay�tlar� kitap2 tablosuna aktar */
select * from kitap
select * from kitap2
insert into kitap2(id,ad,yazarno,sayi) select kitapno,ad,yazarno,sayfasayisi from kitap
set identity_insert kitap2 off

/* 10- kitap2 tablosundan yazarno = 45 olan kayd� silin */
select * from kitap2 
delete from kitap2 where yazarno = 45

/* 11- Kitap2 tablosundan ad� a ile ba�layan kay�tlar� silin */
select * from kitap2 where ad like 'a%'
delete from kitap2 where ad like 'a%'
select * from kitap2 order by ad

/* 12- ��renci tablosundan ogrno = 49 olan kayd�n s�n�f�n� 9f olarak g�ncelleyin */
select * from ogrenci where ogrno = 49
update ogrenci set sinif = '9F' where ogrno = 49

/* 13- ��renci tablosundan ogrno = 125 olan kayd�n� ad�n� ve soyad�n� g�ncelleyin */
select * from ogrenci where ogrno = 125
update ogrenci set ad = 'Ay�e', soyad = 'aaaa' where ogrno = 125










