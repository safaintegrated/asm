using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AssetAndStoreManagementSystem.Aset.Pendaftaran
{
    public partial class Pendaftaran_MainInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Slider.DataSource = LoadDummyImagesForSlider();
                Slider.ImageUrlField = "ImageUrl";
                Slider.TextField = "ImageText";
                Slider.NameField = "ImageName";
                Slider.DataBind();
            }
        }

        DataTable LoadDummyImagesForSlider()
        {
            DataTable Dt = new DataTable();
            DataColumn ImageName = Dt.Columns.Add("ImageName", typeof(String));
            DataColumn ImageUrl = Dt.Columns.Add("ImageUrl", typeof(String));
            DataColumn ImageText = Dt.Columns.Add("ImageText", typeof(String));
            Dt.AcceptChanges();

            DataRow Dr0 = Dt.NewRow();
            Dr0["ImageName"] = "Pandangan Hadapan";
            Dr0["ImageUrl"] = "../../Aset/Images/1.jpg";
            Dr0["ImageText"] = "Komputer riba pada pandangan hadapan";
            Dt.Rows.Add(Dr0);

            DataRow Dr1 = Dt.NewRow();
            Dr1["ImageName"] = "Pandangan Atas";
            Dr1["ImageUrl"] = "../../Aset/Images/2.jpg";
            Dr1["ImageText"] = "Komputer riba pada pandangan Atas";
            Dt.Rows.Add(Dr1);

            DataRow Dr2 = Dt.NewRow();
            Dr2["ImageName"] = "Pandangan Atas";
            Dr2["ImageUrl"] = "../../Aset/Images/3.jpeg";
            Dr2["ImageText"] = "Komputer riba pada pandangan atas (ditutup)";
            Dt.Rows.Add(Dr2);

            DataRow Dr3 = Dt.NewRow();
            Dr3["ImageName"] = "Papan Kekunci";
            Dr3["ImageUrl"] = "../../Aset/Images/4.jpg";
            Dr3["ImageText"] = "Papan Kekunci Komputer Riba";
            Dt.Rows.Add(Dr3);

            //D:\Images

            return Dt;
        }
    }
}