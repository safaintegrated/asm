<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Pemeriksaan.Index" %>
<%@ Register Src="~/Stor/Pemeriksaan/Pemeriksaan_Controller.ascx" TagPrefix="uc1" TagName="Pemeriksaan_Controller" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pemeriksaan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <script src="Js_StorPemeriksaanStok.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:Pemeriksaan_Controller runat="server" id="Pemeriksaan_Controller" />
    </div>
    </form>
</body>
</html>
