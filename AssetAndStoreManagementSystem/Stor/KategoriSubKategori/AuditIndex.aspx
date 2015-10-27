<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditIndex.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.KategoriSubKategori.AuditIndex" %>

<%@ Register Src="~/Stor/KategoriSubKategori/AuditTrail_Controller.ascx" TagPrefix="uc1" TagName="AuditTrail_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:AuditTrail_Controller runat="server" id="AuditTrail_Controller" />
    </div>
    </form>
</body>
</html>
