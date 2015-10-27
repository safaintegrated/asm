<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanDanSijil.Index" %>

<%@ Register Src="~/Stor/LaporanDanSijil/LaporanDanSijil_Controller.ascx" TagPrefix="uc2" TagName="LaporanDanSijil_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelupusan Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc2:LaporanDanSijil_Controller runat="server" ID="LaporanDanSijil_Controller" />
    </div>
    </form>
</body>
</html>
