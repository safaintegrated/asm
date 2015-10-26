<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function SelectGrn(ProcessId, Rev)
    {
        var parent = window.parent;
        parent.LoadSelectedGrn(ProcessId.toString(), Rev.toString());
    }
</script>
<dx:ASPxGridView ID="GridGrnLookup" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridGrnLookup" DataSourceID="GrnLookupDs" Width="100%" OnCustomCallback="GridGrnLookup_CustomCallback" OnHtmlDataCellPrepared="GridGrnLookup_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="GRNH_ProcessId" Visible="False" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Versi" FieldName="GRNH_Revision" VisibleIndex="3" Width="5%">
             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="Ptj_Name" ReadOnly="True" VisibleIndex="1" Width="30%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="No. GRN" FieldName="GRNH_GrnNumber" VisibleIndex="2" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="GRNH_PrNumber" VisibleIndex="4" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="GRNH_PrNumber" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pembekal" FieldName="GRNH_SetVen_Name" VisibleIndex="5" Width="20%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Tarikh Terimaan" FieldName="GRNH_DeliveryDate" VisibleIndex="6" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" ReadOnly="True" VisibleIndex="7" Width="17%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="GrnLookupDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_GRN_FindRecord" SelectCommandType="StoredProcedure" OnSelecting="GrnLookupDs_Selecting">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

