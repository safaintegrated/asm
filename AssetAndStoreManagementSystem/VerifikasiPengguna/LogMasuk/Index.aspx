<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.VerifikasiPengguna.LogMasuk.Index" %>

<%@ Register Src="~/VerifikasiPengguna/LogMasuk/LogMasuk_Controller.ascx" TagPrefix="uc1" TagName="LogMasuk_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:LogMasuk_Controller runat="server" id="LogMasuk_Controller" />
    </div>
    </form>
</body>
</html>
