<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.SharedControls.LookupPegawaiAset.Index" %>

<%@ Register Src="~/SharedControls/LookupPegawaiAset/LookupPegawaiAset_Controller.ascx" TagPrefix="uc1" TagName="LookupPegawaiAset_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:LookupPegawaiAset_Controller runat="server" id="LookupPegawaiAset_Controller" />
    </div>
    </form>
</body>
</html>
