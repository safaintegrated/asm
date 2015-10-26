<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.SharedControls.EmployeeLookup_SingleRecord.Index" %>

<%@ Register Src="~/SharedControls/EmployeeLookup_SingleRecord/EmployeeLookup_SingleRecord_Controller.ascx" TagPrefix="uc1" TagName="EmployeeLookup_SingleRecord_Controller" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:EmployeeLookup_SingleRecord_Controller runat="server" id="EmployeeLookup_SingleRecord_Controller" />
    </div>
    </form>
</body>
</html>
