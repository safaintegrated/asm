<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.KategoriSubKategori.Index" %>

<%@ Register Src="~/Stor/KategoriSubKategori/KategoriSubKategori_Controller.ascx" TagPrefix="uc1" TagName="KategoriSubKategori_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelupusan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:KategoriSubKategori_Controller runat="server" id="KategoriSubKategori_Controller" />
    </div>
    </form>
</body>
</html>
