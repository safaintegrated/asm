<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PelupusanStok.Index" %>

<%@ Register Src="~/Stor/PelupusanStok/PelupusanStok_Controller.ascx" TagPrefix="uc1" TagName="PelupusanStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelupusan Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PelupusanStok_Controller runat="server" ID="PelupusanStok_Controller" /> </div>
    </form>
</body>
</html>
