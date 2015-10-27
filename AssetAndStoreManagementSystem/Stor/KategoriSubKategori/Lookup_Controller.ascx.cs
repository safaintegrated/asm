using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssetAndStoreManagementSystem.Stor.KategoriSubKategori
{
    public partial class Lookup_Controller : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridSearchSystemUserGroup_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void GridSearchCatSubCat_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            GridSearchCatSubCat.DataBind();
        }

        protected void GridSearchCatSubCat_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "CatName")
            {
                ASPxHyperLink link = (ASPxHyperLink)GridSearchCatSubCat.FindRowCellTemplateControl(e.VisibleIndex, GridSearchCatSubCat.DataColumns["CatName"] as GridViewDataColumn, "CatName");

                if (link != null)
                {
                    string CatId = GridSearchCatSubCat.GetRowValues(e.VisibleIndex, "CatId").ToString();

                    link.ClientInstanceName = "CatName_" + e.VisibleIndex.ToString();
                    link.Text = e.CellValue.ToString();
                    link.NavigateUrl = "javascript: CatSubCatSelected(" + CatId + ");";
                }
            }
        }
    }
}