using Data;
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
        private AsmContext db = new AsmContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //int i = 0;
        protected void Button1_Click(object sender, EventArgs e)
        {
            //i++;
            //PurchaseRequest pr = new PurchaseRequest
            //{
            //     PONumber = i.ToString(),
            //     Details = i.ToString()
            //};
            //db.PurchaseRequest.Add(pr);
            //db.SaveChanges();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
          //var pr =  db.PurchaseRequest.ToList();
          //GridView1.DataSource = pr;
          //GridView1.DataBind();
        }
    }
}