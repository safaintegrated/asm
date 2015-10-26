<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PermohonanBelian.Index" %>

<%@ Register Src="~/Shared/PermohonanBelian/PermohonanBelian_Controller.ascx" TagPrefix="uc1" TagName="PermohonanBelian_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Permohonan Belian</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCenteredLarge">
        <uc1:PermohonanBelian_Controller runat="server" id="PermohonanBelian_Controller" />
    </div>
    </form>
</body>
</html>
