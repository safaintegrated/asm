﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.IO;
using System.Diagnostics;
using System.Drawing.Imaging;
using DevExpress.XtraPrinting.BarCode;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using DevExpress.XtraEditors;
using DevExpress.Web;
using System.Web;

namespace Core.QRCode
{
    public class QrCodeMethods
    {
        public static string GenerateBarcode(string CodeString, string ImagePath)
        {
            try
            {
                QRcode_Report report = new QRcode_Report();
                report.xrBarCode1.Text = CodeString;
                System.Drawing.Image im = report.xrBarCode1.ToImage();

                if (File.Exists(ImagePath))
                {
                    File.Delete(ImagePath);
                }

                im.Save(ImagePath);
                return string.Empty;
            }
            catch (Exception err)
            { return err.Message; }
        }
    }
}
