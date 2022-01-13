use test5
/* Birden Fazla Tablodan veri getirirken doðru sonuç alabilmek için foreign key baðlantýsý olmalýdýr. */

/* 1- klasik eþleþtirme ile iki tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,n.vize,n.final,n.harf_notu from ogrenci o, notlar n where o.ogrno = n.ogrno
select * from ogrenci
select * from notlar

/* 2- klasik eþleþtirme ile üç tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,d.aciklama,n.vize,n.final,n.harf_notu 
	from ogrenci o,notlar n,dersler d 
		where o.ogrno = n.ogrno and n.ders_id = d.ders_id


/* 3- (inner) join ile 2 tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,n.vize,n.final,n.harf_notu from ogrenci o join notlar n on o.ogrno = n.ogrno


/* 4- (inner) join ile üç tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,d.aciklama,n.vize,n.final,n.harf_notu from ogrenci o 
	join notlar n on o.ogrno = n.ogrno 
		join dersler d on d.ders_id = n.ders_id
select * from ogrenci
select * from notlar
/* 5- left join ile 2 tablodan veri getir */ 
select o.ogrno,o.adi,o.soyadi,n.vize,n.final,n.harf_notu 
	from ogrenci o 
		left join notlar n on o.ogrno = n.ogrno

select * from notlar
/* 6- right join kullanarak 2 tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,n.vize,n.final,n.harf_notu 
	from ogrenci o right join notlar n 
		on o.ogrno = n.ogrno
 
/* 7- full OUTER join ile  tablodan veri getir */
select o.ogrno,o.adi,o.soyadi,n.vize,n.final,n.harf_notu from ogrenci o 
	full OUTER join notlar n on o.ogrno = n.ogrno
 


