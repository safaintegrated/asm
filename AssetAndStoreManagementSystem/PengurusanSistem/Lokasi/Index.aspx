<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.Index" %>

<%@ Register Src="~/PengurusanSistem/Lokasi/Lokasi_Controller.ascx" TagPrefix="uc1" TagName="Lokasi_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lokasi</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Lokasi_Controller runat="server" id="Lokasi_Controller" />
    </div>
    </form>
</body>
</html>
