<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanLembagaPemeriksa.Index" %>

<%@ Register Src="~/Stor/LaporanLembagaPemeriksa/LaporanLembagaPemeriksa_Controller.ascx" TagPrefix="uc1" TagName="LaporanLembagaPemeriksa_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laporan Lembaga Pemeriksa</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:LaporanLembagaPemeriksa_Controller runat="server" id="LaporanLembagaPemeriksa_Controller" />
    </div>
    </form>
</body>
</html>
