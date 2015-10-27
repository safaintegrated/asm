<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.TawaranTender.Index" %>

<%@ Register Src="~/Stor/TawaranTender/TawaranTender_Controller.ascx" TagPrefix="uc1" TagName="TawaranTender_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TawaranTender</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:TawaranTender_Controller runat="server" ID="TawaranTender_Controller" />
    </div>
    </form>
</body>
</html>
