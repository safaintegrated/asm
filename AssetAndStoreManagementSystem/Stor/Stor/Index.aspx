<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Stor.Index" %>

<%@ Register Src="~/Stor/Stor/Stor_Controller.ascx" TagPrefix="uc1" TagName="Stor_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stor</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Stor_Controller runat="server" id="Stor_Controller" />
    </div>
    </form>
</body>
</html>
