use kutuphane
/* Distinct, order by,insert into, update, delete ,truncate*/

/* 1- Öðrenci tablosunda olan sýnýflarý tekrar olmadan getir */
select * from ogrenci
select distinct sinif from ogrenci 

/* 2- Öðrenci tablosunda olan isimleri tekrar olmadan getir */
select distinct ad from ogrenci

/* 3- Öðrenci tablosunu puana göre ARTAN sýrada listeleyiniz */
select * from ogrenci order by puan asc

/* 4- Öðrenci tablosunu puana göre AZALAN sýrada listeleyiniz */
select * from ogrenci order by puan desc

/* 5- Öðrenci tablosunda ad'a göre artan puan'a göre azalan sýrada listeleyin */
select * from ogrenci order by ad asc , puan desc

/* 6- tür tablosuna kayýt ekleyiniz */
select * from tur
insert into tur(ad) values('Araþtýrma 5')
set identity_insert tur off


/* 7- tür tablosuna ayný anda 2 tane kayýt ekleyin */
insert into tur (ad) values('Araþtýrma 6'),('Araþtýrma 7')

/* 8- kitap2 tablosundaki tüm kayýtlarý silin ve tablo yeni oluþturulmuþ gibi olsun */
delete from kitap2
truncate table kitap2
select * from kitap2

/* 9- kitap tablosundaki kayýtlarý kitap2 tablosuna aktar */
select * from kitap
select * from kitap2
insert into kitap2(id,ad,yazarno,sayi) select kitapno,ad,yazarno,sayfasayisi from kitap
set identity_insert kitap2 off

/* 10- kitap2 tablosundan yazarno = 45 olan kaydý silin */
select * from kitap2 
delete from kitap2 where yazarno = 45

/* 11- Kitap2 tablosundan adý a ile baþlayan kayýtlarý silin */
select * from kitap2 where ad like 'a%'
delete from kitap2 where ad like 'a%'
select * from kitap2 order by ad

/* 12- öðrenci tablosundan ogrno = 49 olan kaydýn sýnýfýný 9f olarak güncelleyin */
select * from ogrenci where ogrno = 49
update ogrenci set sinif = '9F' where ogrno = 49

/* 13- öðrenci tablosundan ogrno = 125 olan kaydýný adýný ve soyadýný güncelleyin */
select * from ogrenci where ogrno = 125
update ogrenci set ad = 'Ayþe', soyad = 'aaaa' where ogrno = 125










