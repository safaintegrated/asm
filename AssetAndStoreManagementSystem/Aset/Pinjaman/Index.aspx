<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Index" %>

<%@ Register Src="~/Aset/Pinjaman/Pinjaman_Controller.ascx" TagPrefix="uc1" TagName="Pinjaman_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Permohonan Pinjaman</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div  class="MainDivCenteredLarge">
        <uc1:Pinjaman_Controller runat="server" id="Pinjaman_Controller" />
    </div>
    </form>
</body>
</html>
