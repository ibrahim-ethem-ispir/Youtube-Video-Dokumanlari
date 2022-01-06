use kutuphane

/* as, > , upper, lower, len, concat, reverse, rtrim, ltrim, trim, between, where , like,*/

/* 1- Öðrenci tablosunun tüm kayýtlarýný seçin.*/
select * from ogrenci

/* 2- Öðrenci tablosunun ogrno,ad, soyad sutunundaki tüm kayýtlarýný seçin.*/
select ogrno,ad,soyad from ogrenci

/* 3- Takma Ad kullanma */
select ogrno 'Öðrenci Numarasý' , ad,soyad from ogrenci

/* 4- ogrenci tablasundan ad ve soyad alanlarýný al ve ad büyük olsun soyad küçük harf olarak getirin */
select UPPER(ad) 'isim',lower(soyad) 'soyisim' from ogrenci

/* 5- Takma Adý tablo isminde kullanma */
select o.ogrno,o.ad,o.soyad from ogrenci o

/* 6- Ad alanýnda 2 karakterden baþla 2 karakter yaz */
select SUBSTRING(ad,2,3),ad from ogrenci

/* 7- Ad alanýndan karakter uzunluðunu verir */
select len(ad),ad from ogrenci

/* 8- String Alanlarý Birleþtirme */
select CONCAT(ad,' ',soyad) 'ad ve soyad' from ogrenci

/* 9- String Alanlarý deðerini ters yaz */
select REVERSE(ad) as 'tersten ad alaný' , ad from ogrenci 

/* 10- Ltrim Soldan Boþluk Silme RTRIM ise saðdan siler TRIM tüm boþluklarý Siler */
select * from ogrenci
update ogrenci set ad= '       Eþref       ' where ogrno = 1
select CONCAT(LTRIM(ad),soyad) 'ad ve soyad' from ogrenci
select CONCAT(RTRIM(ad),soyad) 'ad ve soyad' from ogrenci
select CONCAT(TRIM(ad),soyad) 'ad ve soyad' from ogrenci
update ogrenci set ad=trim(ad) where ogrno = 1

/* 11- Verilen bir string içinde bazý karakteri baþka bir karaktere dönüþtür */
select REPLACE('Minare Yazýlým','Yazýlým','Teknoloji')

/* 12- öðrenci tablosunda puaný 50,60,70 olan kayýtlarý listeleyiniz */
select * from ogrenci where puan = 50 or puan = 60 or puan = 70

/* Sql Operatör Kullanýmlarý */
/* 13-öðrenci tablosunda puaný 50,60,70 olan kayýtlarý listeleyiniz SQL Operatör ile yapýn */
select * from ogrenci where puan in(50,60,70)

/* 14- Öðrenci tablosundan cinsiyeti K olan kayýtlarý seçiniz */
select * from ogrenci where cinsiyet = 'K'

/* 15- Öðrenci tablosundan puaný 70 ten büyük olan kayýtlarý seçen SQL cümlesini yazýnýz */
select * from ogrenci where puan > 70


/* 16- Öðrenci tablosundan 9F sýnýfýnda olmayan öðrencilerin kayýtlarýný görüntüleyiniz */
select * from ogrenci where not sinif = '9F'

/* 17- öðrenci tablosundan puaný 70 olan ali leri listeleyiniz*/
select * from ogrenci where ad = 'ali' and puan = 70

/* 18- öðrenci tablosunda puaný 40 ile 70 arasýnda olan öðrencileri listeleyiniz    SQL Opr. ile */
select * from ogrenci where puan between 40 and 70

/* 19- öðrenci tablosunda puaný 40 ile 70 dýþýnda olan öðrencileri listeleyiniz		 SQL Opr. ile */
select * from ogrenci where puan not between 40 and 70

/* 20- Adý A ile baþlayan öðrencileri listeleyiniz */
select * from ogrenci where ad like '%na'

/* 21- Adý 'Ay' ile baþlayan öðrencileri listeleyiniz */
select * from ogrenci where ad like 'Ay%'

/* 22- soyadýnýn ikinci karakteri y olan öðrencileri listeleyiniz */
select * from ogrenci where soyad like '_y%'

/* 23- adý 'a' ile baþlamayan öðrencileri listeleyiniz */
select * from ogrenci where ad not like 'a%'
