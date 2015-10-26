<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Tender.Index" %>

<%@ Register Src="~/Aset/Tender/Tender_Controller.ascx" TagPrefix="uc1" TagName="Tender_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tender</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:Tender_Controller runat="server" id="Tender_Controller" />
    </div>
    </form>
</body>
</html>
