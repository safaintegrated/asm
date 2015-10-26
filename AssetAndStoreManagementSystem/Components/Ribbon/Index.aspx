<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Components.Ribbon.Index" %>

<%@ Register Src="~/Components/Ribbon/Ribbon_Controller.ascx" TagPrefix="uc1" TagName="Ribbon_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Susutnilai</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Ribbon_Controller runat="server" id="Ribbon_Controller" />
    </div>
    </form>
</body>
</html>
