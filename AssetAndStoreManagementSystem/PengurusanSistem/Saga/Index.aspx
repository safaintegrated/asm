<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Saga.Index" %>

<%@ Register Src="~/PengurusanSistem/Saga/Saga_Controller.ascx" TagPrefix="uc1" TagName="Saga_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SAGA</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered940px">
        <uc1:Saga_Controller runat="server" id="Saga_Controller" />
    </div>
    </form>
</body>
</html>
