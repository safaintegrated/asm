<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PenggunaSistem.Manual.Index" %>

<%@ Register Src="~/PenggunaSistem/Manual/Manual_Controller.ascx" TagPrefix="uc1" TagName="Manual_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manual</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Manual_Controller runat="server" id="Manual_Controller" />
    </div>
    </form>
</body>
</html>
