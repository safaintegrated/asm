<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.DaftarStok.Index" %>

<%@ Register Src="~/Stor/DaftarStok/DaftarStok_Controller.ascx" TagPrefix="uc1" TagName="DaftarStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pendaftaran Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <div class="MainDivCentered940px">
           <uc1:DaftarStok_Controller runat="server" ID="DaftarStok_Controller" />
    </div>
    </form>
</body>
</html>
