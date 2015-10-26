<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Smp.Index" %>

<%@ Register Src="~/PengurusanSistem/Smp/Smp_Controller.ascx" TagPrefix="uc1" TagName="Smp_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMP</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Smp_Controller runat="server" id="Smp_Controller" />
    </div>
    </form>
</body>
</html>
