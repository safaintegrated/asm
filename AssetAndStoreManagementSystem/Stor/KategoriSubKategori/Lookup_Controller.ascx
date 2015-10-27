﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.KategoriSubKategori.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<script>
    function CatSubCatSelected(CatId)
    {
        var parent = window.parent;
        parent.GetSelectedCat(CatId);
    }
</script>

<dx:ASPxPopupControl ID="PopupSearchCatSubCat" runat="server" AllowDragging="True" ClientInstanceName="PopupSearchCatSubCat" EnableClientSideAPI="True" HeaderText="Carian Kategori" Height="300px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="900px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearchCatSubCat" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearchCatSubCat" EnableCallbackAnimation="True" Width="100%"  DataSourceID="LookupDs" KeyFieldName="CatId" OnCustomCallback="GridSearchCatSubCat_CustomCallback" OnHtmlDataCellPrepared="GridSearchCatSubCat_HtmlDataCellPrepared">
        <ClientSideEvents EndCallback="function(s, e) {
	PopupSearchCatSubCat.Show();
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Stock_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No Daftar Stok" FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="1" Width="50%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="Stock_RegisterNo" runat="server" Text="ASPxHyperLink" EnableClientSideAPI="true">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status Stok" FieldName="Stock_Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan Stok" FieldName="Stock_Detail" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsLoadingPanel Mode="Disabled" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="LookupDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT [Stock_Id], [Stock_RegisterNo], [Stock_Detail], [Stock_Status] FROM [Stock] ORDER BY [Stock_RegisterNo]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>



