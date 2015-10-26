<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Report.Index" %>

<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxDocumentViewer ID="DocumentViewer" runat="server">
        </dx:ASPxDocumentViewer>
    
    </div>
    </form>
</body>
</html>
