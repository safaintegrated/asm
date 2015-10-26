<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.KemaskiniAsetPelupusan.Index" %>

<%@ Register Src="~/Aset/KemaskiniAsetPelupusan/KemaskiniAsetPelupusan_Controller.ascx" TagPrefix="uc1" TagName="KemaskiniAsetPelupusan_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kemaskini Aset Pelupusan</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:KemaskiniAsetPelupusan_Controller runat="server" id="KemaskiniAsetPelupusan_Controller" />
    </div>
    </form>
</body>
</html>
