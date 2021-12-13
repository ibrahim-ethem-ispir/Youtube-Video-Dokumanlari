import sqlite3

baglanti = sqlite3.connect("arabalar.db")
islem = baglanti.cursor()
baglanti.commit()

table = islem.execute("create table if not exists arabalar(Marka text,Model text,Renk text,Km int)")
baglanti.commit()

def veri_ekle(Marka,Model,Renk,Km):
    kayit = "insert into arabalar values (?,?,?,?)"
    islem.execute(kayit,(Marka,Model,Renk,Km))
    baglanti.commit()


def veri_ekle2():
    Marka = input("Marka : ")
    Model = input("Model : ")
    Renk = input("Renk : ")
    Km = int(input("Km : "))

    islem.execute("insert into arabalar values (?,?,?,?)",(Marka,Model,Renk,Km))
    baglanti.commit()


def veri_getir():
    sorgu = "select * from arabalar"
    islem.execute(sorgu)
    listeye_ekle = islem.fetchall()
    for i in listeye_ekle:
        print(i)

def tek_kayit_getir(Model):
    sorgu = "select * from arabalar where Model = ?"
    islem.execute(sorgu,(Model,))
    listeye_ekle = islem.fetchall()
    print(listeye_ekle)


def kayit_guncelle(eskiModel,YeniMarka,yeniModel,yeniRenk,yeniKm):
    sorgu = "update arabalar set Marka = ? , Model = ? , Renk = ? , Km  = ? where Model = ?"
    islem.execute(sorgu,(YeniMarka,yeniModel,yeniRenk,yeniKm,eskiModel))
    baglanti.commit()


def kayit_sil(Model):
    sorgu = "delete from arabalar where Model = ?"
    islem.execute(sorgu,(Model,))
    baglanti.commit()



#kayit_sil("astra")
#kayit_guncelle("mondeo","opel","astra","Siyah",1000)
#tek_kayit_getir("mondeo")
veri_getir()
#veri_ekle("Bwm","520i","Gri",5000)
#veri_ekle2()


baglanti.close()