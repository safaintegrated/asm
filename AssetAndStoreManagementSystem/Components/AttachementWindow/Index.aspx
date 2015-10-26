<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Components.AttachementWindow.Index" %>

<%@ Register Src="~/Components/AttachementWindow/AttachmentWindow_Controller.ascx" TagPrefix="uc1" TagName="AttachmentWindow_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:AttachmentWindow_Controller runat="server" id="AttachmentWindow_Controller" />
    </div>
    </form>
</body>
</html>
