<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.AJKPemeriksaanPelupusan.Index" %>

<%@ Register Src="~/Stor/AJKPemeriksaanPelupusan/AJKPemeriksaanPelupusan_Controller.ascx" TagPrefix="uc1" TagName="AJKPemeriksaanPelupusan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lembaga Pemeriksa Pelupusan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:AJKPemeriksaanPelupusan_Controller runat="server" id="AJKPemeriksaanPelupusan_Controller" />
    </div>
    </form>
</body>
</html>
