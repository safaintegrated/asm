<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PenggunaSistem.Kalendar.Index" %>

<%@ Register Src="~/PenggunaSistem/Kalendar/Kalendar_Controller.ascx" TagPrefix="uc1" TagName="Kalendar_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kalendar</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Kalendar_Controller runat="server" id="Kalendar_Controller" />
    </div>
    </form>
</body>
</html>
