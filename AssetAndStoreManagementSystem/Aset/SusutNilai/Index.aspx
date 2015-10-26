<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.SusutNilai.Index" %>

<%@ Register Src="~/Aset/SusutNilai/SusutNilai_Controller.ascx" TagPrefix="uc1" TagName="SusutNilai_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Susutnilai</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:SusutNilai_Controller runat="server" id="SusutNilai_Controller" />
    </div>
    </form>
</body>
</html>
