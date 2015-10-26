<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PerakaunAmbilAlih.Index" %>

<%@ Register Src="~/Stor/PerakuanAmbilAlih/PerakuanAmbilAlih_Controller.ascx" TagPrefix="uc1" TagName="PerakuanAmbilAlih_Controller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perakuan Ambil-Alih</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PerakuanAmbilAlih_Controller runat="server" ID="PerakuanAmbilAlih_Controller" />
    </div>
    </form>
</body>
</html>
