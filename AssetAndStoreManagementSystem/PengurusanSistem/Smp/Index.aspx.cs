using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace AssetAndStoreManagementSystem.PengurusanSistem.Smp
{
    public partial class Index : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            // Define an Literal control.
            HtmlGenericControl css = new HtmlGenericControl();
            css.TagName = "style";
            css.Attributes.Add("type", "text/css");

            string imageURL = "../../Public/Images/Backdrop/StartBackground.jpg";

            //Logic to determin imageURL goes here

            //Update Tag
            css.InnerHtml = @"body{background-image: url(" + imageURL + "); background-repeat:no-repeat; background-size:cover;}";


            // Add the Tag to the Head section of the page.
            Page.Header.Controls.Add(css);

            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}