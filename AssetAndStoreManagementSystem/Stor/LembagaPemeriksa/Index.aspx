<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LembagaPemeriksa.Index" %>

<%@ Register Src="~/Stor/LembagaPemeriksa/LembagaPemeriksa_Controller.ascx" TagPrefix="uc1" TagName="LembagaPemeriksa_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AJK Pemeriksaan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <script src="Js_LembagaPemeriksa.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:LembagaPemeriksa_Controller runat="server" id="LembagaPemeriksa_Controller" />
    </div>
    </form>
</body>
</html>
