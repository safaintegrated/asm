<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanTahunan.Index" %>

<%@ Register Src="~/Stor/LaporanTahunan/LaporanTahunan_Controller.ascx" TagPrefix="uc1" TagName="LaporanTahunan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:LaporanTahunan_Controller runat="server" ID="LaporanTahunan_Controller" />
    </div>
    </form>
</body>
</html>
