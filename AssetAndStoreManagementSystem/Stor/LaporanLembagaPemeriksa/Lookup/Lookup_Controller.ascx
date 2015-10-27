<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanLembagaPemeriksa.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function LembagaPemeriksaSelected(U)
    {
        var parent = window.parent;
        parent.LoadSelectedLembaga(U.toString());
    }
</script>
<dx:ASPxGridView ID="GridLookupLembagaPemeriksa" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridLookupLembagaPemeriksa" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="LPH_LembagaName" Width="100%" OnHtmlDataCellPrepared="GridLookupLembagaPemeriksa_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="LPH_UniqueId" Visible="False" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="LPH_RefNumber" VisibleIndex="0" Width="10%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>           
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama Lembaga" FieldName="LPH_LembagaName" ReadOnly="True" VisibleIndex="1" Width="12%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="LPH_LembagaName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="LPH_AssignedPtj" Visible="False" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Tahun Pemeriksaan" FieldName="LPH_AssignYear" VisibleIndex="3" Width="5%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Tarikh Mula" FieldName="LPH_StartDate" VisibleIndex="4" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Tarikh Tamat" FieldName="LPH_EndDate" VisibleIndex="5" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="LPH_LastModeBy" Visible="False" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Kemaskini Terakhir Pada" FieldName="LPH_LastModeDate" VisibleIndex="8" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="LPH_Status" Visible="False" VisibleIndex="13">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Kemaskini Terakhir Oleh" FieldName="LastModeName" ReadOnly="True" VisibleIndex="7" Width="18%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status" FieldName="StatusText" ReadOnly="True" VisibleIndex="9" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="PTJ Yang Dipertanggungjawabkan" FieldName="PtjName" ReadOnly="True" VisibleIndex="2" Width="17%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Jumlah Ahli" FieldName="TotalMembers" ReadOnly="True" VisibleIndex="6" Width="7%">
             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SP_LembagaPemeriksa_SearchRecords" SelectCommandType="StoredProcedure" OnSelecting="SearchDs_Selecting">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

