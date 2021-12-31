import sys
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import *
from Urun_Ekle import *

uygulama = QApplication(sys.argv)
pencere = QMainWindow()
ui = Ui_MainWindow()
ui.setupUi(pencere)
pencere.show()


# Veritabanı işlemleri
import sqlite3

baglanti = sqlite3.connect("urunler.db")
islem = baglanti.cursor()
baglanti.commit()

table = islem.execute("create table if not exists urun (urunKodu int, urunAdi text, birimFiyat int, stokMiktari int, urunAciklaması text, marka text, kategori text)")
baglanti.commit()


def kayit_ekle():
    UrunKodu = int(ui.lneurunKodu.text())
    UrunAdi = ui.lneurunAdi.text()
    BirimFiyat = int(ui.lnebirimFiyat.text())
    StokMiktari = int(ui.lnestokMiktari.text())
    UrunAciklama = ui.lneurunAciklama.text()
    Marka = ui.cmbMarka.currentText()
    Kategori = ui.cmbKategori.currentText()

    try:
        ekle = "insert into urun (urunKodu,urunAdi,birimFiyat,stokMiktari,urunAciklaması,marka,kategori) values (?,?,?,?,?,?,?)"
        islem.execute(ekle,(UrunKodu,UrunAdi,BirimFiyat,StokMiktari,UrunAciklama,Marka,Kategori))
        baglanti.commit()
        kayit_listele()
        ui.statusbar.showMessage("Kayıt Ekleme İşlemi Başarılı",10000)
    except Exception as error:
        ui.statusbar.showMessage("Kayıt Eklenemedi Hata Çıktı === "+str(error))



def kayit_listele():
    ui.tblListele.clear()
    ui.tblListele.setHorizontalHeaderLabels(("Ürün Kodu","Ürün Adi","Birim Fiyatı","Stok Miktarı","Ürün Açıklama","Markası","Kategori"))
    ui.tblListele.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
    sorgu = "select * from urun"
    islem.execute(sorgu)

    for indexSatir, kayitNumarasi in enumerate(islem):
        for indexSutun, kayitSutun in enumerate(kayitNumarasi):
            ui.tblListele.setItem(indexSatir,indexSutun,QTableWidgetItem(str(kayitSutun)))

kayit_listele()  
def kategoriye_gore_listele():
    listelenecek_kategori = ui.cmbKategorListele.currentText()

    sorgu = "select * from urun where kategori = ?"
    islem.execute(sorgu,(listelenecek_kategori,))
    ui.tblListele.clear()
    for indexSatir, kayitNumarasi in enumerate(islem):
        for indexSutun, kayitSutun in enumerate(kayitNumarasi):
            ui.tblListele.setItem(indexSatir,indexSutun,QTableWidgetItem(str(kayitSutun)))


def kayit_sil():
    sil_mesaj = QMessageBox.question(pencere,"Silme Onayı","Silmek İstediğinizden Emin Misiniz ?",QMessageBox.Yes | QMessageBox.No)

    if sil_mesaj == QMessageBox.Yes:
        secilen_kayit = ui.tblListele.selectedItems()
        silinecek_kayit = secilen_kayit[0].text()

        sorgu = "delete from urun where urunKodu = ?"
        try:
            islem.execute(sorgu,(silinecek_kayit,))
            baglanti.commit()
            ui.statusbar.showMessage("Kayıt Başarıyla Silindi")
            kayit_listele()
        except Exception as error:
            ui.statusbar.showMessage("Kayıt Silinirken Hata Çıktı === "+str(error))
    
    else:
        ui.statusbar.showMessage("Silme İşlemi İptal Edildi")
    

def kayit_guncelle():
    guncelle_mesaj = QMessageBox.question(pencere,"Güncelleme Onayı","Bu kaydı Güncellemek istediğinizden Emin Misiniz ?",QMessageBox.Yes | QMessageBox.No)

    if guncelle_mesaj == QMessageBox.Yes:
        try:
            UrunKodu = ui.lneurunKodu.text()
            UrunAdi = ui.lneurunAdi.text()
            BirimFiyati = ui.lnebirimFiyat.text()
            StokMiktari = ui.lnestokMiktari.text()
            UrunAciklama = ui.lneurunAciklama.text()
            Marka = ui.cmbMarka.currentText()
            Kategori = ui.cmbKategori.currentText()

            if UrunAdi == "" and BirimFiyati == "" and StokMiktari == "" and UrunAciklama == "" and Marka == "":
                islem.execute("update urun set kategori = ? where urunKodu = ?",(Kategori,UrunKodu))

            elif UrunAdi == "" and BirimFiyati == "" and StokMiktari == "" and UrunAciklama == "" and Kategori == "":
                islem.execute("update urun set marka = ? where urunKodu = ?",(Marka,UrunKodu)) 

            elif UrunAdi == "" and BirimFiyati == "" and StokMiktari == "" and Marka == "" and Kategori == "":
                islem.execute("update urun set urunAciklaması = ? where urunKodu = ?",(UrunAciklama,UrunKodu))
            elif UrunAdi == "" and BirimFiyati == "" and UrunAciklama == "" and Marka == "" and Kategori == "":
                islem.execute("update urun set stokMiktari = ? where urunKodu = ?",(StokMiktari,UrunKodu))
            elif UrunAdi == "" and StokMiktari == "" and UrunAciklama == "" and Marka == "" and Kategori == "":
                islem.execute("update urun set birimFiyat = ? where urunKodu = ?",(BirimFiyati,UrunKodu))
            elif BirimFiyati == "" and StokMiktari == "" and UrunAciklama == "" and Marka == "" and Kategori == "":
                islem.execute("update urun set urunAdi = ? where urunKodu = ?",(UrunAdi,UrunKodu))
            else:
                islem.execute("update urun set urunAdi = ?, birimFiyat = ? , stokMiktari = ?, urunAciklaması = ?, marka = ?, kategori = ? where urunKodu = ?",(UrunAdi,BirimFiyati,StokMiktari,UrunAciklama,Marka, Kategori,UrunKodu))
            baglanti.commit()
            kayit_listele()
            ui.statusbar.showMessage("Kayıt Başarıyla Güncellendi")
        except Exception as error:
            ui.statusbar.showMessage("Kayıt Güncellemede Hata Çıktı === "+str(error))
    else:
        ui.statusbar.showMessage("Güncelleme İptal Edildi")


# butonlar
ui.btnEkle.clicked.connect(kayit_ekle)
ui.btnListele.clicked.connect(kayit_listele)
ui.btnKategoriyeGoreListele.clicked.connect(kategoriye_gore_listele)
ui.btnSil.clicked.connect(kayit_sil)
ui.btnGuncelle.clicked.connect(kayit_guncelle)
sys.exit(uygulama.exec_())