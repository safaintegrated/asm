<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Index" %>

<%@ Register Src="~/Aset/Pendaftaran/Pendaftaran_Controller.ascx" TagPrefix="uc1" TagName="Pendaftaran_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pendaftaran</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered">
        <uc1:Pendaftaran_Controller runat="server" ID="Pendaftaran_Controller" />
    </div>
    </form>
</body>
</html>
