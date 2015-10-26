<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.SebutHarga.Index" %>

<%@ Register Src="~/Aset/SebutHarga/SebutHarga_Controller.ascx" TagPrefix="uc1" TagName="SebutHarga_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tawaran Sebutharga</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:SebutHarga_Controller runat="server" id="SebutHarga_Controller" />
    </div>
    </form>
</body>
</html>
