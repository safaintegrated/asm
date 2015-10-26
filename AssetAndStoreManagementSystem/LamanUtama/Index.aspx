<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.Index" %>

<%@ Register Src="~/LamanUtama/Index_Controller.ascx" TagPrefix="uc1" TagName="Index_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laman Utama</title>
    <link href="../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Index_Controller runat="server" ID="Index_Controller" />
    </div>
    </form>
</body>
</html>
