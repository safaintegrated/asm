<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Buletin.Index" %>

<%@ Register Src="~/PengurusanSistem/Buletin/Buletin_Controller.ascx" TagPrefix="uc1" TagName="Buletin_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buletin</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Buletin_Controller runat="server" id="Buletin_Controller" />
    </div>
    </form>
</body>
</html>
