<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PenggunaSistem.Tugasan.Index" %>

<%@ Register Src="~/PenggunaSistem/Tugasan/Tugasan_Controller.ascx" TagPrefix="uc1" TagName="Tugasan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tugasan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Tugasan_Controller runat="server" id="Tugasan_Controller" />
    </div>
    </form>
</body>
</html>
