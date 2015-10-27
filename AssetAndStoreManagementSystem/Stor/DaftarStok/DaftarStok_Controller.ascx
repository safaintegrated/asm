<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DaftarStok_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.DaftarStok.DaftarStok_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="Tab_MaklumatStok.ascx" tagname="Tab_MaklumatStok" tagprefix="uc1" %>
<%@ Register src="Tab_SenaraiStok.ascx" tagname="Tab_SenaraiStok" tagprefix="uc2" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>

</script>


<style type="text/css">

.dxeBase_Office2010Blue
{
	font: 11px Verdana, Geneva, sans-serif;
}
    .auto-style1 {
        border: 1px dotted transparent;
        padding: 2px 14px;
    }
</style>


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pendaftaran Stok" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/daftarstok.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left;"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
    <Tabs>
        <dx:RibbonTab Name="Utama" Text="Utama">
            <Groups>
                <dx:RibbonGroup Text="Pengurusan Rekod" Name="Pengurusan Rekod">
                    <Items>
                        <dx:RibbonButtonItem BeginGroup="True" Name="Kemaskini" Size="Large" Text="Kemaskini">
                            <LargeImage IconID="edit_edit_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                            <LargeImage IconID="actions_add_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Simpan" Size="Large" Text="Simpan">
                            <LargeImage IconID="save_save_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Hantar" Size="Large" Text="Hantar">
                            <LargeImage IconID="mail_send_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Padam" Size="Large" Text="Padam">
                            <LargeImage IconID="edit_delete_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Batal" Size="Large" Text="Batal">
                            <LargeImage IconID="actions_deletelist_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <Items>
                                <dx:RibbonDropDownButtonItem Name="CetakKewPs3A" Size="Large" Text="Cetak KEW.PS-3A">
                                </dx:RibbonDropDownButtonItem>
                                 <dx:RibbonDropDownButtonItem Name="CetakKewPs3" Size="Large" Text="Cetak KEW.PS-3B">
                                </dx:RibbonDropDownButtonItem>
                                <dx:RibbonDropDownButtonItem Name="CetakKewPs4" Size="Large" Text="Cetak KEW.PS-4">
                                </dx:RibbonDropDownButtonItem>
                                 <dx:RibbonDropDownButtonItem Name="CetakKewPs5" Size="Large" Text="Cetak KEW.PS-5">
                                </dx:RibbonDropDownButtonItem>
                                <dx:RibbonDropDownButtonItem Name="CetakKewPs13" Size="Large" Text="Cetak KEW.PS-13">
                                </dx:RibbonDropDownButtonItem>
                            </Items>
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx:RibbonDropDownButtonItem>
                        <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                            <LargeImage IconID="find_find_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Audit" Size="Large" Text="Audit">
                            <LargeImage IconID="arrange_bringtofrontoftext_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tutup" Size="Large" Text="Tutup">
                            <LargeImage IconID="actions_close_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
    </Tabs>
    <Styles>
        <Item Width="70px">
        </Item>
    </Styles>
    <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
</dx:ASPxRibbon></td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px">
                
                <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
                    <TabPages>
                        <dx:TabPage Text="Transaksi Stok">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_MaklumatStok ID="Tab_MaklumatStok1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Senarai Stok">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Tab_SenaraiStok ID="Tab_SenaraiStok1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
                
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
















<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
    <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol3" runat="server">
            <table style="width: 100%; text-align: center; vertical-align: top;">
                <tr>
                    <td>
                        <dx:ASPxLabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <table style="width: 100%; vertical-align: top; text-align: left;">
                            <tr>
                                <td style="width: 35%"></td>
                                <td style="width: 30%">
                                    <dx:ASPxButton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100%">
                                        <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 35%"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>







<dx:ASPxPopupControl ID="pcSearch" runat="server" ClientInstanceName="pcSearch" Height="291px" Width="900px" AllowDragging="True" HeaderText="Carian" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="gvSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvSearch" DataSourceID="dsStockRegistration" KeyFieldName="Id" OnCustomCallback="gvSearch_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationId" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StockId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NoPkBppsBtb" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CurrentBalance" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ParasMenokok" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransactionType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransInFrom" ShowInCustomizationForm="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransInQuantityRequest" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransInQuantity" ShowInCustomizationForm="True" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransInUnitPrice" ShowInCustomizationForm="True" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransOutTo" ShowInCustomizationForm="True" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransOutQuantityRequest" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransOutUnitPrice" ShowInCustomizationForm="True" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransOutQuantity" ShowInCustomizationForm="True" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateTime" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsStockRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStockRegistration" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>








<p>
    &nbsp;</p>





















<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	window.open('../../Report/Viewer/Index.aspx');
}" />
    <PanelCollection>
        <dx:PanelContent runat="server"></dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>



































<dx:ASPxCallbackPanel ID="cbp_Report2" runat="server" ClientInstanceName="cbp_Report2" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	window.open('../../Report/Viewer/Index.aspx');
}" />
    <PanelCollection>
        <dx:PanelContent runat="server"></dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>



































