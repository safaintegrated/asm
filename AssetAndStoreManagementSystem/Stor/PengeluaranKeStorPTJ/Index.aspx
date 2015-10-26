<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PengeluaranKeStorPTJ.Index" %>

<%@ Register Src="~/Stor/PengeluaranKeStorPTJ/PengeluaranKeStorPTJ_Controller.ascx" TagPrefix="uc1" TagName="PengeluaranKeStorPTJ_Controller" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
    <title>Pengeluaran Ke Stor PTJ</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
         <uc1:PengeluaranKeStorPTJ_Controller runat="server" ID="PengeluaranKeStorPTJ_Controller" />
    </div>
    </form>
</body>
</html>
