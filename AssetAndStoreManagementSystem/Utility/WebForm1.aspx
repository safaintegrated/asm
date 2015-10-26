<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AssetAndStoreManagementSystem.Utility.WebForm1" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" DisplayFormatString="n" Number="0">
            <SpinButtons ShowIncrementButtons="False">
            </SpinButtons>
        </dx:ASPxSpinEdit>
        <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="ASPxButton">
        </dx:ASPxButton>
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="800%">
        </dx:ASPxTextBox>
    
    </div>
    </form>
</body>
</html>
