<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Lookup.Index" %>

<%@ Register Src="~/Stor/PermohonanBelian_Stor/Lookup/Lookup_Controller.ascx" TagPrefix="uc1" TagName="Lookup_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Lookup_Controller runat="server" id="Lookup_Controller" />
    </div>
    </form>
</body>
</html>
