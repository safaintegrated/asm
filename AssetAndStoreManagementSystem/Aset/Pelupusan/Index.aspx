<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pelupusan.Index" %>

<%@ Register Src="~/Aset/Pelupusan/Pelupusan_Controller.ascx" TagPrefix="uc1" TagName="Pelupusan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelupusan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:Pelupusan_Controller runat="server" id="Pelupusan_Controller" />
    </div>
    </form>
</body>
</html>
