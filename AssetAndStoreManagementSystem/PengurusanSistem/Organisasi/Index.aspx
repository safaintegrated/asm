<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Organisasi.Index" %>
<%@ Register Src="~/PengurusanSistem/Organisasi/Organisasi_Controller.ascx" TagPrefix="uc1" TagName="Organisasi_Controller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maklumat Organisasi</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Organisasi_Controller runat="server" ID="Organisasi_Controller" />
    </div>
    </form>
</body>
</html>
