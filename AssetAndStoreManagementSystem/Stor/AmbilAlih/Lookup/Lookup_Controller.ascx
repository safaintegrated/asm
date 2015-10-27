<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.AmbilAlih.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function LembagaPemeriksaSelected(U)
    {
        var parent = window.parent;
        parent.LoadSelectedLembaga(U.toString());
    }
</script>
<dx:ASPxGridView ID="GridLookupLembagaPemeriksa" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridLookupLembagaPemeriksa" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="PelupusanItemId" Width="100%" OnHtmlDataCellPrepared="GridLookupLembagaPemeriksa_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="PelupusanItemId" VisibleIndex="0" ReadOnly="True">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NoKod" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PerihalStok" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="TarikhTerima" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="TempohSimpanan" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Kuantiti" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NilaiPerolehaSeunit" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="JumlahNilaiPerolehan" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="JustifikasiPelupusan" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="SyorKaedahPelupusan" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindPelupusan" SelectCommandType="StoredProcedure" OnSelecting="SearchDs_Selecting">
</asp:SqlDataSource>

