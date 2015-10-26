<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PegawaiAset.Index" %>

<%@ Register Src="~/PengurusanSistem/PegawaiAset/PegawaiAset_Controller.ascx" TagPrefix="uc1" TagName="PegawaiAset_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pegawai Aset</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PegawaiAset_Controller runat="server" id="PegawaiAset_Controller" />
    </div>
    </form>
</body>
</html>
