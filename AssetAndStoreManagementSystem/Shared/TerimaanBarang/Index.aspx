<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.Index" %>

<%@ Register Src="~/Shared/TerimaanBarang/TerimaanBarang_Controller.ascx" TagPrefix="uc1" TagName="TerimaanBarang_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Terimaan Barang</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:TerimaanBarang_Controller runat="server" id="TerimaanBarang_Controller" />
    </div>
    </form>
</body>
</html>
