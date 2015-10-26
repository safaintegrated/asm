<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Report.Viewer.Index" %>

<%@ Register Src="~/Report/Viewer/Viewer_Controller.ascx" TagPrefix="uc1" TagName="Viewer_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paparan Laporan</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Viewer_Controller runat="server" id="Viewer_Controller" />
    </div>
    </form>
</body>
</html>
