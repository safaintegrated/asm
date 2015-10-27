<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PelupusanOld.Index" %>

<%@ Register Src="~/Stor/PelupusanOld/PelupusanOld_Controller.ascx" TagPrefix="uc2" TagName="PelupusanOld_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelupusan Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc2:PelupusanOld_Controller runat="server" ID="PelupusanOld_Controller" />
    </div>
    </form>
</body>
</html>
