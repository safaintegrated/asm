<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanStok_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.PermohonanStok_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_AliranKerja.ascx" tagname="Tab_AliranKerja" tagprefix="uc1" %>
<%@ Register src="Tab_Pengeluaran.ascx" tagname="Tab_Pengeluaran" tagprefix="uc2" %>
<%@ Register src="Tab_Permohonan.ascx" tagname="Tab_Permohonan" tagprefix="uc3" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Permohonan Stok" ShowCollapseButton="true" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PermohonanStok.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left; padding-top:10px">
        <tr>
            <td colspan="2"  style="width:100%; vertical-align:top; text-align:left;"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                     <%--   <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                                                    <Items>
                                                        <dx:RibbonDropDownButtonItem Name="CetakKewPs10" Text="Cetak KEWPS-10">
                                                        </dx:RibbonDropDownButtonItem>
                                                        
                                                    </Items>
                                                    <LargeImage IconID="print_print_32x32">
                                                    </LargeImage>
                                                </dx:RibbonDropDownButtonItem>--%>
                           <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                                                    <Items>
                                                        <dx:RibbonDropDownButtonItem Name="CetakKewPs10" Text="KEWPS-10">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <dx:RibbonDropDownButtonItem Name="CetakKewPs11" Text="KEWPS-11">
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px">
                <dx:ASPxTextBox ID="txtNewOrUpdate" runat="server" ClientInstanceName="txtNewOrUpdate" Width="170px" ClientVisible="False">
                </dx:ASPxTextBox>
                <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="96%">
                    <TabPages>
                        <dx:TabPage Text="Permohonan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc3:Tab_Permohonan ID="Tab_Permohonan1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Kelulusan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Tab_Pengeluaran ID="Tab_Pengeluaran1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja" Visible="False">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_AliranKerja ID="Tab_AliranKerja2" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:46px">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Visible="False">
                    <Items>
                        <dx:LayoutGroup Caption="Rujukan" Width="100%">
                            <Items>
                                <dx:LayoutItem Caption="No. Rujukan " Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="90%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh " Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" Width="60%">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Status" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="90%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>


<dx:ASPxPopupControl ID="psPermohonanStok" runat="server" AllowDragging="True" ClientInstanceName="psPermohonanStok" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Rekod Permohonan Stok" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="gvSearchPermohonanStok" runat="server" AutoGenerateColumns="False" DataSourceID="dsPermohonaStokSearch" KeyFieldName="ProcessId" OnHtmlDataCellPrepared="gvSearchPermohonanStok_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hlProcessId" runat="server" ClientInstanceName="hlProcessId" Text="ASPxHyperLink" />
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ProcessIdTemp" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmpSysId" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Purpose" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreationDate" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="RequiredDate" ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PtjDiPohon" ShowInCustomizationForm="True" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StorDiPohon" ShowInCustomizationForm="True" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StokDiPohon" ShowInCustomizationForm="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="KuantitDiPohon" ShowInCustomizationForm="True" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsPermohonaStokSearch" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllPermohonanStok" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>







        





<dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" EnableClientSideAPI="True" OnCallback="cbp_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px" style="margin-bottom: 0px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>








        













<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" OnCallback="cbp_Report_Callback" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {

('abc');
	window.open('../../Report/Viewer/Index.aspx');
}
" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>














        













