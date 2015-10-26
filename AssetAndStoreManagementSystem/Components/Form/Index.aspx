<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Components.Form.Index" %>

<%@ Register Src="~/Components/Form/Form_Controller.ascx" TagPrefix="uc1" TagName="Form_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Form_Controller runat="server" id="Form_Controller" />
    </div>
    </form>
</body>
</html>
