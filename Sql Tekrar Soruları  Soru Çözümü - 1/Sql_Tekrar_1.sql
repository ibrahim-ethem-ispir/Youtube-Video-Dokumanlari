use kutuphane

/* as, > , upper, lower, len, concat, reverse, rtrim, ltrim, trim, between, where , like,*/

/* 1- ��renci tablosunun t�m kay�tlar�n� se�in.*/
select * from ogrenci

/* 2- ��renci tablosunun ogrno,ad, soyad sutunundaki t�m kay�tlar�n� se�in.*/
select ogrno,ad,soyad from ogrenci

/* 3- Takma Ad kullanma */
select ogrno '��renci Numaras�' , ad,soyad from ogrenci

/* 4- ogrenci tablasundan ad ve soyad alanlar�n� al ve ad b�y�k olsun soyad k���k harf olarak getirin */
select UPPER(ad) 'isim',lower(soyad) 'soyisim' from ogrenci

/* 5- Takma Ad� tablo isminde kullanma */
select o.ogrno,o.ad,o.soyad from ogrenci o

/* 6- Ad alan�nda 2 karakterden ba�la 2 karakter yaz */
select SUBSTRING(ad,2,3),ad from ogrenci

/* 7- Ad alan�ndan karakter uzunlu�unu verir */
select len(ad),ad from ogrenci

/* 8- String Alanlar� Birle�tirme */
select CONCAT(ad,' ',soyad) 'ad ve soyad' from ogrenci

/* 9- String Alanlar� de�erini ters yaz */
select REVERSE(ad) as 'tersten ad alan�' , ad from ogrenci 

/* 10- Ltrim Soldan Bo�luk Silme RTRIM ise sa�dan siler TRIM t�m bo�luklar� Siler */
select * from ogrenci
update ogrenci set ad= '       E�ref       ' where ogrno = 1
select CONCAT(LTRIM(ad),soyad) 'ad ve soyad' from ogrenci
select CONCAT(RTRIM(ad),soyad) 'ad ve soyad' from ogrenci
select CONCAT(TRIM(ad),soyad) 'ad ve soyad' from ogrenci
update ogrenci set ad=trim(ad) where ogrno = 1

/* 11- Verilen bir string i�inde baz� karakteri ba�ka bir karaktere d�n��t�r */
select REPLACE('Minare Yaz�l�m','Yaz�l�m','Teknoloji')

/* 12- ��renci tablosunda puan� 50,60,70 olan kay�tlar� listeleyiniz */
select * from ogrenci where puan = 50 or puan = 60 or puan = 70

/* Sql Operat�r Kullan�mlar� */
/* 13-��renci tablosunda puan� 50,60,70 olan kay�tlar� listeleyiniz SQL Operat�r ile yap�n */
select * from ogrenci where puan in(50,60,70)

/* 14- ��renci tablosundan cinsiyeti K olan kay�tlar� se�iniz */
select * from ogrenci where cinsiyet = 'K'

/* 15- ��renci tablosundan puan� 70 ten b�y�k olan kay�tlar� se�en SQL c�mlesini yaz�n�z */
select * from ogrenci where puan > 70


/* 16- ��renci tablosundan 9F s�n�f�nda olmayan ��rencilerin kay�tlar�n� g�r�nt�leyiniz */
select * from ogrenci where not sinif = '9F'

/* 17- ��renci tablosundan puan� 70 olan ali leri listeleyiniz*/
select * from ogrenci where ad = 'ali' and puan = 70

/* 18- ��renci tablosunda puan� 40 ile 70 aras�nda olan ��rencileri listeleyiniz    SQL Opr. ile */
select * from ogrenci where puan between 40 and 70

/* 19- ��renci tablosunda puan� 40 ile 70 d���nda olan ��rencileri listeleyiniz		 SQL Opr. ile */
select * from ogrenci where puan not between 40 and 70

/* 20- Ad� A ile ba�layan ��rencileri listeleyiniz */
select * from ogrenci where ad like '%na'

/* 21- Ad� 'Ay' ile ba�layan ��rencileri listeleyiniz */
select * from ogrenci where ad like 'Ay%'

/* 22- soyad�n�n ikinci karakteri y olan ��rencileri listeleyiniz */
select * from ogrenci where soyad like '_y%'

/* 23- ad� 'a' ile ba�lamayan ��rencileri listeleyiniz */
select * from ogrenci where ad not like 'a%'
