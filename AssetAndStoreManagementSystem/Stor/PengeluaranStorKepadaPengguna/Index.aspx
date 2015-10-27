<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PengeluaranStorKepadaPengguna.Index" %>

<%@ Register Src="~/Stor/PengeluaranStorKepadaPengguna/PengeluaranStorKepadaPengguna_Controller.ascx" TagPrefix="uc1" TagName="PengeluaranStorKepadaPengguna_Controller" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <title>Pengeluaran Stor Kepada Pengguna</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
         <uc1:PengeluaranStorKepadaPengguna_Controller runat="server" ID="PengeluaranStorKepadaPengguna_Controller" />
    </div>
    </form>
</body>
</html>
