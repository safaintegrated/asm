<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem.Index" %>

<%@ Register Src="~/PengurusanSistem/KumpulanPenggunaSistem/KumpulanPengguna_Controller.ascx" TagPrefix="uc1" TagName="KumpulanPengguna_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumpulan Pengguna Sistem</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:KumpulanPengguna_Controller runat="server" id="KumpulanPengguna_Controller" />
    </div>
    </form>
</body>
</html>
