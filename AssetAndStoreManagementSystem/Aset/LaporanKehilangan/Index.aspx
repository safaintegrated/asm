<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.Index" %>

<%@ Register Src="~/Aset/LaporanKehilangan/LaporanKehilangan_Controller.ascx" TagPrefix="uc1" TagName="LaporanKehilangan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laporan Kehilangan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:LaporanKehilangan_Controller runat="server" id="LaporanKehilangan_Controller" />
    </div>
    </form>
</body>
</html>
