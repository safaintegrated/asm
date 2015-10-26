<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Penempatan.Index" %>

<%@ Register Src="~/Aset/Penempatan/Penempatan_Controller.ascx" TagPrefix="uc1" TagName="Penempatan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Penempatan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainDivCenteredLarge">
            <uc1:Penempatan_Controller runat="server" id="Penempatan_Controller" />
        </div>
    </form>
</body>
</html>
