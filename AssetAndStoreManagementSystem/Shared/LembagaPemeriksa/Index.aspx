<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Shared.LembagaPemeriksa.Index" %>

<%@ Register Src="~/Shared/LembagaPemeriksa/LembagaPemeriksa_Controller.ascx" TagPrefix="uc1" TagName="LembagaPemeriksa_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lembaga Pemeriksa</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:LembagaPemeriksa_Controller runat="server" id="LembagaPemeriksa_Controller" />
    </div>
    </form>
</body>
</html>
