<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PengeluaranStok.Index" %>
<%@ Register Src="~/Stor/PengeluaranStok/PengeluaranStokController.ascx" TagPrefix="uc1" TagName="PengeluaranStokController" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <script src="Js_StorPengeluaranStok.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainDivCentered80Percent">
            <uc1:PengeluaranStokController runat="server" ID="PengeluaranStokController" />
        </div>
    </form>
</body>
</html>

