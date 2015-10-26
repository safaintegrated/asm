using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetAndStoreManagementSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
             
            Category c = new Category
            {
                Code = ASPxTextBox1.Text,
                Name = ASPxTextBox1.Text

            };
            DataAccess.Models.CategoryModel.Add(c, "test");

            var list = DataAccess.Models.CategoryModel.FindAll();

            ASPxGridView1.DataBind();

        }
    }
}