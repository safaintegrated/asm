<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function AssetInvSelected(U, T)
    {
        var parent = window.parent;
        parent.LoadLookupAssetInv(U.toString(), T.toString());
    }
</script>

<dx:ASPxGridView ID="GridAssetInvLookup" runat="server" ClientInstanceName="GridAssetInvLookup" DataSourceID="LookupDs" Width="100%" AutoGenerateColumns="False" KeyFieldName="AIRMI_UniqueId" OnAfterPerformCallback="GridAssetInvLookup_AfterPerformCallback" OnHtmlDataCellPrepared="GridAssetInvLookup_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="AIRMI_RegistrationNumber" VisibleIndex="0" Caption="No. Siri Pendaftaran" Width="12%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="AIRMI_RegistrationNumber" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_Desc" VisibleIndex="1" Caption="Keterangan" Width="19%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="CatName" ReadOnly="True" VisibleIndex="2" Caption="Kategori" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="SubCatName" ReadOnly="True" VisibleIndex="3" Caption="Sub-Kategori" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="T_Desc" ReadOnly="True" VisibleIndex="4" Caption="Jenis" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_Make" VisibleIndex="5" Caption="Buatan" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_Brand" VisibleIndex="6" Caption="Jenama" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_Model" VisibleIndex="7" Caption="Model" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_PoNumber" VisibleIndex="8" Caption="No. Pesanan Belian" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="AIRMI_ReceivedDate" VisibleIndex="12" Caption="Tarikh Terimaan" Width="6%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_InvoiceNumber" VisibleIndex="9" Caption="No. Invois" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_VoucherNumber" VisibleIndex="10" Caption="No. Baucar" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_GRNnumber" VisibleIndex="11" Caption="No. Terimaan Barang" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_PurchasePrice" VisibleIndex="13" Caption="Harga Belian" Width="6%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_AssetInvType" Visible="False" VisibleIndex="14">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="15" ReadOnly="True" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ReadOnly="True" VisibleIndex="16" Caption="Pusat Tanggungjawab" Width="25%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AIRMI_UniqueId" ReadOnly="True" Visible="False" VisibleIndex="17">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="LookupDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" SelectCommand="SELECT [AIRMI_RegistrationNumber], [AIRMI_Desc], [CatName], [SubCatName], [T_Desc], [AIRMI_Make], [AIRMI_Brand], [AIRMI_Model], [AIRMI_PoNumber], [AIRMI_ReceivedDate], [AIRMI_InvoiceNumber], [AIRMI_VoucherNumber], [AIRMI_GRNnumber], [AIRMI_PurchasePrice], [AIRMI_AssetInvType], [StatusName], [PTJ_Name], [AIRMI_UniqueId] FROM [V_LookupAssetInventory] ORDER BY [AIRMI_RegistrationNumber]"></asp:SqlDataSource>

