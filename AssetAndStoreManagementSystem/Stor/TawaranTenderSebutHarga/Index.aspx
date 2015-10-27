<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.TawaranTenderSebutHarga.Index" %>

<%@ Register Src="~/Stor/TawaranTenderSebutHarga/TawaranTenderSebutHarga_Controller.ascx" TagPrefix="uc1" TagName="TawaranTenderSebutHarga_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tawaran Tender SebutHarga</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:TawaranTenderSebutHarga_Controller runat="server" ID="TawaranTenderSebutHarga_Controller" />
    </div>
    </form>
</body>
</html>
