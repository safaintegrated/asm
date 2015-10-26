<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.AduanKerosakan.Index" %>

<%@ Register Src="~/Aset/AduanKerosakan/AduanKerosakan_Controller.ascx" TagPrefix="uc1" TagName="AduanKerosakan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aduan Kerosakan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:AduanKerosakan_Controller runat="server" id="AduanKerosakan_Controller" />
    </div>
    </form>
</body>
</html>
