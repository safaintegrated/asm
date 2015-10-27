function FillPemohon(values) {
    txtPemohonJawatan.SetText(values[1].toString());
    txtPemohonJabatan.SetText(values[2].toString());
    txtPemohonNoKakitangan.SetText(values[3].toString());
}


function OnPageLoadEvents() {
    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
}

function MainRibbon_CommandExecuted(s, e) {
   
    switch (e.item.name) {

        case 'Kemaskini': KemaskiniClicked(); break;
        case 'Lulus': LulusClicked(); break;
        case 'Kuiri': KuiriClicked(); break;
        case 'Tutup': TutupClicked(); break;
        case 'Tambah': TambahClicked(); break;
        case 'Simpan': SimpanClicked(); break;
        case 'Hantar': HantarClicked(); break;
        case 'Padam': PadamClicked(); break;
        case 'Batal': BatalCicked(); break;
        case 'CetakKewPs1': CetakKewPs1Clicked(); break;
        case 'CetakKewPs2': CetakKewPs2Clicked(); break;
        case 'CetakKewPs3A': CetakKewPs3AClicked(); break;
        case 'CetakKewPs3B': CetakKewPs3BClicked(); break;
        case 'CetakKewPs4': CetakKewPs4Clicked(); break;
        case 'CetakKewPs9': CetakKewPs9Clicked(); break;
        case 'CetakKewPs10': CetakKewPs10Clicked(); break;
        case 'CetakKewPs11': CetakKewPs11Clicked(); break;
        case 'CetakKewPs12': CetakKewPs12Clicked(); break;
        case 'Cetak': CetakClicked(); break;
        case 'Carian': CarianClicked(); break;
        case 'Audit': AuditClicked(); break;
        case 'Lampiran': LampiranClicked(); break;
        case 'Gambar': GambarClicked(); break;
        case 'Impot': ImpotClicked(); break;
        case 'CarianPengeluaran': CarianPengeluaran(); break;
        case 'CarianPermohonan': CarianPermohonan(); break;

    }
}

function CetakKewPs10Clicked() {
   
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-10');
}

function CetakKewPs9Clicked() {

    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-9');
}

function CetakKewPs1Clicked() {
 
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-1');
}


function CetakKewPs2Clicked() {
    
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-2');
}

function CetakKewPs3AClicked() {
  
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-3A');
}

//function CetakKewPs3BClicked() {
//    alert('kewPS-3B')
//    cbp_Report.PerformCallback('STOR-DAFTARSTOK-KEW.PS-3B');
//}

function CetakKewPs11Clicked() {
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-11');
}

function CetakKewPs12Clicked() {
 
    cbp_Report.PerformCallback('STOR-PENGELUARAN-KEW.PS-12');
}





function CetakClicked() {
    cbp_Report.PerformCallback();
}

function KemaskiniClicked() {
    
    ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
   
    formMain.SetEnabled(true);
 
}

function SimpanClicked() {
   
    if (CheckPengeluaranForm()) {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod pemeriksaan.  Sila tunggu..');
        LoadingPanel.Show();
        cbp.PerformCallback('SAVE');
    }

}

function BatalCicked() {
    cbp.PerformCallback('CANCEL');
}


function CarianPermohonan() {
    popupSearchPermohonan.SetWidth(screen.width * 0.85);
    popupSearchPermohonan.Show();
    gvPermohonan.PerformCallback();
}

function TambahClicked() {
    cbp.PerformCallback('ADD');
}

function CheckPengeluaranForm() {
    return true;
    if (txtPemohonNama.GetText() == '') {
        popupMsg_Label.SetText('Nama Pemohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glPtjDiPohon.GetText() == '') {
        popupMsg_Label.SetText('PTJ yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStorDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Stor yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (glStokDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Stok yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (txtKuantitiDiPohon.GetText() == '') {
        popupMsg_Label.SetText('Kuantiti yang dipohon perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (deTarikhDiperlukan.GetText() == '') {
        popupMsg_Label.SetText('Tarikh diperlukan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    if (mmTujuan.GetText() == '') {
        popupMsg_Label.SetText('Tujuan permohonan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
        popupMsg.Show();
        return false;
    }

    return true;
}

function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
    if (Kemaskini == 'true')
        MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

    if (Tambah == 'true')
        MainRibbon.GetItemByName("Tambah").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Tambah").SetEnabled(false);

    if (Simpan == 'true')
        MainRibbon.GetItemByName("Simpan").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Simpan").SetEnabled(false);

    if (Hantar == 'true')
        MainRibbon.GetItemByName("Hantar").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Hantar").SetEnabled(false);

    if (Padam == 'true')
        MainRibbon.GetItemByName("Padam").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Padam").SetEnabled(false);

    if (Batal == 'true')
        MainRibbon.GetItemByName("Batal").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Batal").SetEnabled(false);

    if (Cetak == 'true')
        MainRibbon.GetItemByName("Cetak").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Cetak").SetEnabled(false);

    if (Carian == 'true')
        MainRibbon.GetItemByName("Carian").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Carian").SetEnabled(false);

    if (Audit == 'true')
        MainRibbon.GetItemByName("Audit").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Audit").SetEnabled(false);

    if (Tutup == 'true')
        MainRibbon.GetItemByName("Tutup").SetEnabled(true);
    else
        MainRibbon.GetItemByName("Tutup").SetEnabled(false);
}

function KemaskiniPermohonan() {
    //cbp.PerformCallback('KEMASKINI');
}

function PilihPermohonanStok() {
    popupSearchPermohonan.SetWidth(screen.width * 0.85);
    popupSearchPermohonan.Show();
    gvPermohonan.PerformCallback();
}

function PermohonanSelected(pid) {
    txtNoPermohonan.SetText(pid.toString());
    LoadingPanel.SetText('Sistem sedang membuka maklumat permohonan yang dipilih.  Sila tunggu..');
    LoadingPanel.Show();
    cbp.PerformCallback('LOAD_PERMOHONAN');
    
}

function cbp_EndCallback(s, e) {
    LoadingPanel.Hide();

    if (s.cpErrMsg.toString() != '') {
        popupMsg_Label.SetText(s.cpErrMsg.toString());
        popupMsg.Show();
        popupMsg_BtnOk.Focus();
        return;
    }

    if (s.cpMode.toString() == 'LOAD_PERMOHONAN') {
        popupSearchPermohonan.Hide();
        ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'false', 'true');
        formMain.SetEnabled(true);
       return;
    }

    if (s.cpMode.toString() == 'CANCEL') {
        formMain.SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true');
        return;
    }

    if (s.cpMode.toString() == 'ADD') {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false');
        formMain.SetEnabled(true);
    }


}
