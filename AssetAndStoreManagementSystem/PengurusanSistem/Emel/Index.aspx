<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Emel.Index" %>

<%@ Register Src="~/PengurusanSistem/Emel/Emel_Controller.ascx" TagPrefix="uc1" TagName="Emel_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emel</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Emel_Controller runat="server" id="Emel_Controller" />
    </div>
    </form>
</body>
</html>
