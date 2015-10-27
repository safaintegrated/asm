<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Verifikasi.Index" %>
<%@ Register Src="~/Stor/Verifikasi/Verifikasi_Controller.ascx" TagPrefix="uc1" TagName="Verifikasi_Controller" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verifikasi</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:Verifikasi_Controller runat="server" id="Verifikasi_Controller" />
    </div>
    </form>
</body>
</html>
