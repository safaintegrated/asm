<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PelarasanStok.Index" %>

<%@ Register Src="~/Stor/PelarasanStok/PelarasanStok_Controller.ascx" TagPrefix="uc1" TagName="PelarasanStok_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="MainDivCentered80Percent">
       <uc1:PelarasanStok_Controller runat="server" ID="PelarasanStok_Controller" />
    </div>
    </form>
</body>
</html>
