<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem.Index" %>

<%@ Register Src="~/PengurusanSistem/PenggunaSistem/PenggunaSistem_Controller.ascx" TagPrefix="uc1" TagName="PenggunaSistem_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pengguna Sistem</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:PenggunaSistem_Controller runat="server" id="PenggunaSistem_Controller" />
    </div>
    </form>
</body>
</html>
