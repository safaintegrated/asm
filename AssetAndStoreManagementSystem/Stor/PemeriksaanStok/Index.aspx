<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PemeriksaanStok.Index" %>

<%@ Register Src="~/Stor/PemeriksaanStok/PemeriksaanStok_Controller.ascx" TagPrefix="uc1" TagName="PemeriksaanStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pemeriksaan Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PemeriksaanStok_Controller runat="server" ID="PemeriksaanStok_Controller" />
    </div>
    </form>
</body>
</html>
