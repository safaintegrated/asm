using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;

//Laporan Eksekutif
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.Kedudukan_Semasa_Aset_Alih;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.Laporan_Peruntukan;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.LaporanPengurusanAsetAlihUniversiti;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.Laporan_Pengurusan_Aset_Alih;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanLaporanKehilangan;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanLaporanKehilanganStok;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanPenyelenggaraan;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanPemeriksaanHMI;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanPelupusan;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanLaporanVerifikasi;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.Ringkasan_Laporan_Tahunan;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanLaporanStok;
using AssetAndStoreManagementSystem.Report.LaporanEksekutif.RingkasanLaporanPelupusanStok;

//Laporan Kew.Ps
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS22;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS21;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS20;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS19;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS18;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPA17;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS16;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS15;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS14;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS13;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS12;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS11;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS10;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS9;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS8;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS7;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS06;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS5;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS4;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS3;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS2;
using AssetAndStoreManagementSystem.Stor.LaporanKEWPS.KEWPS1;


//Laporan Kew.Pa
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA02;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA03;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA04;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA05;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA06;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA07;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA08;
using AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA09;


//label printing
using AssetAndStoreManagementSystem.Report.PrintLabel;


//Pengurusan Sistem
using AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem;
using AssetAndStoreManagementSystem.Report.PengurusanSistem.PenggunaSistem;
using AssetAndStoreManagementSystem.Report.PengurusanSistem.Buletin;
using AssetAndStoreManagementSystem.Report.PengurusanSistem.Lokasi;
using AssetAndStoreManagementSystem.Report.PengurusanSistem.PegawaiAset;

namespace AssetAndStoreManagementSystem.Report.Viewer
{
    public partial class Viewer_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ReportName = (string)(Session["ReportName"]);

            switch (ReportName)
            {
                case "QrLabel": PrintQrLabel(); break;

                case "KedudukanSemasaAsetAlih": Print_KedudukanSemasaAsetAlih(); break;
                case "KedudukanStokSukuTahun": Print_KedudukanStokSukuTahun(); break;
                case "LaporanPengurusanAsetAlihUniversiti": Print_LaporanPengurusanAsetAlihUniversiti(); break;
                case "LaporanPengurusanStorUniversiti": Print_LaporanPengurusanStorUniversiti(); break;
                case "LaporanPeruntukan": Print_LaporanPeruntukan(); break;
                case "RingkasanLaporanKehilanganAset": Print_RingkasanLaporanKehilanganAset(); break;
                case "RingkasanLaporanKehilanganStok": Print_RingkasanLaporanKehilanganStok(); break;
                case "RingkasanLaporanPelupusanStok": Print_RingkasanLaporanPelupusanStok(); break;
                case "RingkasanLaporanStok": Print_RingkasanLaporanStok(); break;
                case "RingkasanLaporanTahunanHMI": Print_RingkasanLaporanTahunanHMI(); break;
                case "RingkasanLaporanVerifikasi": Print_RingkasanLaporanVerifikasi(); break;
                case "RingkasanPelupusan": Print_RingkasanPelupusan(); break;
                case "RingkasanPemeriksaanHMI": Print_RingkasanPemeriksaanHMI(); break;
                case "RingkasanPenyelenggaraan": Print_RingkasanPenyelenggaraan(); break;

                case "KEW-PS1": Print_KEWPS1(); break;
                case "KEW-PS2": Print_KEWPS2(); break;
                case "KEW-PS3": Print_KEWPS3(); break;
                case "KEW-PS4": Print_KEWPS4(); break;
                case "KEW-PS5": Print_KEWPS5(); break;
                case "KEW-PS6": Print_KEWPS6(); break;
                case "KEW-PS7": Print_KEWPS7(); break;
                case "KEW-PS8": Print_KEWPS8(); break;
                case "KEW-PS9": Print_KEWPS9(); break;
                case "KEW-PS10": Print_KEWPS10(); break;
                case "KEW-PS11": Print_KEWPS11(); break;
                case "KEW-PS12": Print_KEWPS12(); break;
                case "KEW-PS13": Print_KEWPS13(); break;
                case "KEW-PS14": Print_KEWPS14(); break;
                case "KEW-PS15": Print_KEWPS15(); break;
                case "KEW-PS16": Print_KEWPS16(); break;
                case "KEW-PS17": Print_KEWPS17(); break;
                case "KEW-PS18": Print_KEWPS18(); break;
                case "KEW-PS19": Print_KEWPS19(); break;
                case "KEW-PS20": Print_KEWPS20(); break;
                case "KEW-PS21": Print_KEWPS21(); break;
                case "KEW-PS22": Print_KEWPS22(); break;

                //case "KEW-PA1": Print_KEWPA1(); break;
                case "KEW-PA2": Print_KEWPA2(); break;
                case "KEW-PA3": Print_KEWPA3(); break;
                case "KEW-PA4": Print_KEWPA4(); break;
                case "KEW-PA5": Print_KEWPA5(); break;
                case "KEW-PA6": Print_KEWPA6(); break;
                case "KEW-PA7": Print_KEWPA7(); break;
                case "KEW-PA8": Print_KEWPA8(); break;
                case "KEW-PA9": Print_KEWPA9(); break;


                //Pengurusan Sistem
                case "KUMPULAN-PENGGUNA-SISTEM": Print_KumpulanPenggunaSistem(); break;
                case "PENGGUNA-SISTEM": Print_PenggunaSistem(); break;
                case "BULETIN": Print_Buletin(); break;
                case "LIST-PTJ": Print_Location(1); break;
                case "LIST-DEPT": Print_Location(2); break;
                case "LIST-BUILD": Print_Location(3); break;
                case "LIST-FLOOR": Print_Location(4); break;
                case "LIST-SPACE": Print_Location(5); break;
                case "PEGAWAI-ASET": Print_PegawaiAset(); break;
            }
        }

        void PrintQrLabel()
        {
            string LabelText = Session["LabelText"].ToString();
            
            PrintLabel_Report rpt = new PrintLabel_Report();
            rpt.xrLabel1.Text = Session["LabelText"].ToString();

            rpt.xrPictureBox1.ImageUrl = Session["QrCodeImageURL"].ToString();
            rpt.xrPictureBox2.ImageUrl = Session["SystemLogoImageURL"].ToString();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();

            ImageExportOptions imageOptions = rpt.ExportOptions.Image;
            imageOptions.Format = ImageFormat.Png;
            rpt.ExportToImage(Session["LabelPath"].ToString());
        }

        #region LAPORAN EKSEKUTIF

        void Print_KedudukanSemasaAsetAlih()
        {
            KedudukanSemasaAsetAlih rpt = new KedudukanSemasaAsetAlih();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KedudukanStokSukuTahun()
        {
            LaporanKedudukanStokSukuTahun rpt = new LaporanKedudukanStokSukuTahun();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_LaporanPengurusanAsetAlihUniversiti()
        {
            LaporanPengurusanAsetAlihUniversiti rpt = new LaporanPengurusanAsetAlihUniversiti();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_LaporanPengurusanStorUniversiti()
        {
            LaporanPengurusanStorUni rpt = new LaporanPengurusanStorUni();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_LaporanPeruntukan()
        {
            LaporanPeruntukan rpt = new LaporanPeruntukan();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanKehilanganAset()
        {
            RingkasanLaporanKehilangan rpt = new RingkasanLaporanKehilangan();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanKehilanganStok()
        {
            RingkasanLaporanKehilanganStok rpt = new RingkasanLaporanKehilanganStok();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanPelupusanStok()
        {
            RingkasanLaporanPelupusanStok rpt = new RingkasanLaporanPelupusanStok();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanStok()
        {
            RingkasanLaporanKedudukanStok rpt = new RingkasanLaporanKedudukanStok();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanTahunanHMI()
        {
            RingkasanLaporanTahunanHMI rpt = new RingkasanLaporanTahunanHMI();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanLaporanVerifikasi()
        {
            RingkasanLaporanPemeriksaanStok rpt = new RingkasanLaporanPemeriksaanStok();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanPelupusan()
        {
            RingkasanPelupusanTahunan rpt = new RingkasanPelupusanTahunan();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanPemeriksaanHMI()
        {
            RingkasanPemeriksaanHMI rpt = new RingkasanPemeriksaanHMI();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_RingkasanPenyelenggaraan()
        {
            RingkasanPenyelenggaraan rpt = new RingkasanPenyelenggaraan();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        #endregion

        #region LAPORAN KEW.PS

        void Print_KEWPS1()
        {
            kewps1 rpt = new kewps1();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS2()
        {
            kewps2 rpt = new kewps2();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS3()
        {
            kewps3 rpt = new kewps3();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS4()
        {
            kewps4 rpt = new kewps4();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS5()
        {
            kewps5 rpt = new kewps5();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS6()
        {
            kewps6 rpt = new kewps6();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS7()
        {
            kewps7 rpt = new kewps7();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS8()
        {
            kewps8 rpt = new kewps8();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS9()
        {
            kewps9 rpt = new kewps9();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS10()
        {
            kewps10 rpt = new kewps10();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS11()
        {
            kewps11 rpt = new kewps11();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS12()
        {
            kewps12 rpt = new kewps12();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS13()
        {
            kewps13 rpt = new kewps13();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS14()
        {
            kewps14 rpt = new kewps14();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS15()
        {
            kewps15 rpt = new kewps15();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS16()
        {
            kewps16 rpt = new kewps16();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS17()
        {
            kewpa17 rpt = new kewpa17();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS18()
        {
            kewps18 rpt = new kewps18();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS19()
        {
            kewps19 rpt = new kewps19();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS20()
        {
            kewps20 rpt = new kewps20();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS21()
        {
            kewps21 rpt = new kewps21();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPS22()
        {
            kewps22 rpt = new kewps22();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }
        #endregion

        #region LAPORAN KEW.PA

        //void Print_KEWPA1()
        //{
        //    KEWPA01 rpt = new KEWPA01();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        void Print_KEWPA2()
        {
            Rpt_KEWPA02 rpt = new Rpt_KEWPA02();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA3()
        {
            Rpt_KEWPA03 rpt = new Rpt_KEWPA03();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA4()
        {
            N_KEWPA4 rpt = new N_KEWPA4();

            rpt.ReceiveYear.Value = Convert.ToInt32(Session["ReceiveYear"]);
            rpt.PtjSagaCode.Value = Session["PtjSagaCode"].ToString();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA5()
        {
            N_KEWPA5 rpt = new N_KEWPA5();

            rpt.ReceiveYear.Value = Convert.ToInt32(Session["ReceiveYear"]);
            rpt.PtjSagaCode.Value = Session["PtjSagaCode"].ToString();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA6()
        {
            Rpt_KEWPA06 rpt = new Rpt_KEWPA06();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA7()
        {
            Rpt_KEWPA07 rpt = new Rpt_KEWPA07();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA8()
        {
            Rpt_KEWPA08 rpt = new Rpt_KEWPA08();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_KEWPA9()
        {
            Rpt_KEWPA09 rpt = new Rpt_KEWPA09();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        //void Print_KEWPA10()
        //{
        //    KEWPA10 rpt = new KEWPA10();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}
        //void Print_KEWPA11()
        //{
        //    KEWPA11 rpt = new KEWPA11();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA12()
        //{
        //    KEWPA12 rpt = new KEWPA12();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA13()
        //{
        //    KEWPA13 rpt = new KEWPA13();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA14()
        //{
        //    KEWPA14 rpt = new KEWPA14();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA15()
        //{
        //    KEWPA15 rpt = new KEWPA15();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA16()
        //{
        //    KEWPA16 rpt = new KEWPA16();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA17()
        //{
        //    KEWPA17 rpt = new KEWPA17();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA18()
        //{
        //    KEWPA18 rpt = new KEWPA18();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA20()
        //{
        //    KEWPA20 rpt = new KEWPA20();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA24()
        //{
        //    KEWPA24 rpt = new KEWPA24();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA25()
        //{
        //    KEWPA25 rpt = new KEWPA25();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA26()
        //{
        //    KEWPA26 rpt = new KEWPA26();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        //void Print_KEWPA31()
        //{
        //    KEWPA31 rpt = new KEWPA31();
        //    ReportViewer.Report = rpt;
        //    ReportViewer.DataBind();
        //}

        #endregion

        #region LAPORAN PENGURUSAN SISTEM

        void Print_KumpulanPenggunaSistem()
        {
            Rpt_KumpulanPenggunaSistem rpt = new Rpt_KumpulanPenggunaSistem();
            rpt.RequestParameters = false;
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_PenggunaSistem()
        {
            PS_Header rpt = new PS_Header();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_Buletin()
        {
            Buletin rpt = new Buletin();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }

        void Print_Location(int Type)
        {
            if(Type == 1)
            {
                PTJ rpt = new PTJ();
                ReportViewer.Report = rpt;
            }
            else if (Type == 2)
            {
                Department rpt = new Department();
                ReportViewer.Report = rpt;
            }
            else if (Type == 3)
            {
                Building rpt = new Building();
                ReportViewer.Report = rpt;
            }
            else if (Type == 4)
            {
                Floor rpt = new Floor();
                ReportViewer.Report = rpt;
            }
            else if (Type == 5)
            {
                Space rpt = new Space();
                ReportViewer.Report = rpt;
            }
          
            ReportViewer.DataBind();
        }

        void Print_PegawaiAset()
        {
            PegawaiAset rpt = new PegawaiAset();
            ReportViewer.Report = rpt;
            ReportViewer.DataBind();
        }
        #endregion
    }
}