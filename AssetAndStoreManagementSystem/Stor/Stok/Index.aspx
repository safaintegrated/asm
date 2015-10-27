<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Stok.Index" %>

<%@ Register Src="~/Stor/Stok/JenisStok_Controller.ascx" TagPrefix="uc1" TagName="JenisStok_Controller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stok</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:JenisStok_Controller runat="server" id="JenisStok_Controller" />
    </div>
    </form>
</body>
</html>
