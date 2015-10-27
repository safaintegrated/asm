<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LantikanAJKPenyiasat.Index" %>

<%@ Register Src="~/Stor/LantikanAJKPenyiasat/LantikanAJKPenyiasat_Controller.ascx" TagPrefix="uc1" TagName="LantikanAJKPenyiasat_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lantikan AJK Penyiasat</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:LantikanAJKPenyiasat_Controller runat="server" id="LantikanAJKPenyiasat_Controller" />
    </div>
    </form>
</body>
</html>
