﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem.LamanUtama
{
    public partial class LaporanEksekutif_Popup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbp_ExeRpt_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            switch (e.Parameter)
            {
                case "1": Session["ReportName"] = "KedudukanSemasaAsetAlih"; break;
                case "2": Session["ReportName"] = "KedudukanStokSukuTahun"; break;
                case "3": Session["ReportName"] = "LaporanPengurusanAsetAlihUniversiti"; break;
                case "4": Session["ReportName"] = "LaporanPengurusanStorUniversiti"; break;
                case "5": Session["ReportName"] = "LaporanPeruntukan"; break;
                case "6": Session["ReportName"] = "RingkasanLaporanKehilanganAset"; break;
                case "7": Session["ReportName"] = "RingkasanLaporanKehilanganStok"; break;
                case "8": Session["ReportName"] = "RingkasanLaporanPelupusanStok"; break;
                case "9": Session["ReportName"] = "RingkasanLaporanStok"; break;
                case "10": Session["ReportName"] = "RingkasanLaporanTahunanHMI"; break;
                case "11": Session["ReportName"] = "RingkasanLaporanVerifikasi"; break;
                case "12": Session["ReportName"] = "RingkasanPelupusan"; break;
                case "13": Session["ReportName"] = "RingkasanPemeriksaanHMI"; break;
                case "14": Session["ReportName"] = "RingkasanPenyelenggaraan"; break;
            }
            
        }
    }
}