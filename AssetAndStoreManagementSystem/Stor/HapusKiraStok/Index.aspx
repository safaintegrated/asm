<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.HapusKiraStok.Index" %>

<%@ Register Src="~/Stor/HapusKiraStok/HapusKiraStok_Controller.ascx" TagPrefix="uc1" TagName="HapusKiraStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:HapusKiraStok_Controller runat="server" ID="HapusKiraStok_Controller" />
    </div>
    </form>
</body>
</html>
