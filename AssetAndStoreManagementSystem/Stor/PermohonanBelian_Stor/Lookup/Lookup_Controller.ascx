<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<script>
    function PR_HeaderSelected(ProcessId, Revision)
    {
        var parent = window.parent;
        parent.LoadSelectedPr(ProcessId, Revision);
    }
</script>

<dx:ASPxGridView ID="SearchPRHeader" runat="server" AutoGenerateColumns="False" DataSourceID="PR_SearchDs" KeyFieldName="PRH_ProcessId" Width="100%" OnHtmlDataCellPrepared="SearchPRHeader_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="PRH_ProcessId" ReadOnly="True" Visible="False" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PtjName" ReadOnly="True" VisibleIndex="1" Width="20%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Perihal Pembelian" FieldName="PRH_Purpose" VisibleIndex="2" Width="25%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="PRH_Purpose" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama Pembekal" FieldName="PRH_SetVen_Name" VisibleIndex="3" Width="15%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Jenis Perolehan" FieldName="PRH_ProcurementIType" ReadOnly="True" VisibleIndex="4">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PRH_ProcurementMethod" ReadOnly="True" Visible="False" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PRH_ProcurementCat" ReadOnly="True" Visible="False" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="PRH_PRnumber" VisibleIndex="7" Width="15%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Tarikh Dicipta" FieldName="PRH_CreationDate" Visible="False" VisibleIndex="8">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Status" FieldName="PRH_Status" ReadOnly="True" VisibleIndex="9" Width="10%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Versi" FieldName="PRH_Revision" VisibleIndex="10" Width="5%">
            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="PR_SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_PermohonanBelian_FindRecord" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

