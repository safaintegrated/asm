<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AssetAndStoreManagementSystem.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px"></dx:ASPxTextBox>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton" OnClick="ASPxButton1_Click"></dx:ASPxButton>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Code" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VotCode" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Deleted" VisibleIndex="4">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UpdatedBy" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="FindAll" TypeName="DataAccess.Models.CategoryModel"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
