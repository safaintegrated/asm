<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Pelupusan.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function PelupusanSelected(U)
    {
        var parent = window.parent;
        parent.LoadSelectedLembaga(U.toString());
    }
</script>
<dx:ASPxGridView ID="GridLookupPelupusan" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridLookupPelupusan" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="LPH_LembagaName" Width="100%" OnHtmlDataCellPrepared="GridLookupPelupusan_HtmlDataCellPrepared">
    <Columns>
<%--        <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="LPH_RefNumber" VisibleIndex="0" Width="10%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>           
        </dx:GridViewDataTextColumn>--%>
        <dx:GridViewDataTextColumn Caption="NoKod" FieldName="NoKod" ReadOnly="True" VisibleIndex="1" Width="12%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="NoKod" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="PerihalStok" FieldName="PerihalStok" VisibleIndex="3" Width="5%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="TarikhTerima" FieldName="TarikhTerima" VisibleIndex="4" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="TempohSimpanan" FieldName="TempohSimpanan" VisibleIndex="5" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Kuantiti" FieldName="Kuantiti" VisibleIndex="8" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="NilaiPerolehaSeunit" FieldName="NilaiPerolehaSeunit" ReadOnly="True" VisibleIndex="7" Width="18%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status" FieldName="StatusText" ReadOnly="True" VisibleIndex="9" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JumlahNilaiPerolehan" FieldName="JumlahNilaiPerolehan" ReadOnly="True" VisibleIndex="2" Width="17%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JustifikasiPelupusan" FieldName="JustifikasiPelupusan" ReadOnly="True" VisibleIndex="6" Width="7%">
             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>   
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn Caption="SyorKaedahPelupusan" FieldName="SyorKaedahPelupusan" ReadOnly="True" VisibleIndex="6" Width="7%">
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
<asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindPelupusan" SelectCommandType="StoredProcedure" OnSelecting="SearchDs_Selecting">
</asp:SqlDataSource>

