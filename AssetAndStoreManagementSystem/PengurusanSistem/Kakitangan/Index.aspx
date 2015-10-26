<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Kakitangan.Index" %>

<%@ Register Src="~/PengurusanSistem/Kakitangan/Kakitangan_Controller.ascx" TagPrefix="uc1" TagName="Kakitangan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kakitangan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:Kakitangan_Controller runat="server" id="Kakitangan_Controller" />
    </div>
    </form>
</body>
</html>
