<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.Index" %>

<%@ Register Src="~/Stor/PermohonanStok/PermohonanStok_Controller.ascx" TagPrefix="uc1" TagName="PermohonanStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Permohonan Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <script src="Js_StorPermohonanStok.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PermohonanStok_Controller runat="server" ID="PermohonanStok_Controller" />
    </div>
    </form>
</body>
</html>
