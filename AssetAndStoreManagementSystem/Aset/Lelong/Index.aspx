<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Lelong.Index" %>

<%@ Register Src="~/Aset/Lelong/Lelong_Controller.ascx" TagPrefix="uc1" TagName="Lelong_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kenyataan Lelong</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:Lelong_Controller runat="server" id="Lelong_Controller" />
    </div>
    </form>
</body>
</html>
