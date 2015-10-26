<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Pembekal.Index" %>

<%@ Register Src="~/PengurusanSistem/Pembekal/Pembekal_Controller.ascx" TagPrefix="uc1" TagName="Pembekal_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pembekal</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:Pembekal_Controller runat="server" id="Pembekal_Controller" />
    </div>
    </form>
</body>
</html>
