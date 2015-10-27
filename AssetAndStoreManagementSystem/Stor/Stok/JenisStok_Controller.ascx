<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JenisStok_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Stok.JenisStok_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script>
    function ProceedWithDelete() {
        LoadingPanel.SetText('Sistem sedang memadam rekod  yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp.PerformCallback('DELETE');
    }

    function OnPageLoad() {
        ManageForm.SetEnabled(false);
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');;
  
    }

    //function OnPageLoad() {
    //    FormCatInfo.SetEnabled(false);
    //    FormSubCatListing.SetEnabled(false);
    //    MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
    //    MainRibbon.GetItemByName("Gambar").SetEnabled(false);
    //    MainRibbon.GetItemByName("Impot").SetEnabled(false);
    //    MainRibbon.GetItemByName("Lulus").SetEnabled(false);
    //    MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    //    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    //}

    function ManageForm(truefalse) {
        //return;
        if (truefalse == 'true') {
            hlAddLocation.SetEnabled(true);
            glCategory.SetEnabled(true);
            glSubCategory.SetEnabled(true);
            txtNoPendaftaran.SetEnabled(true);
            txtStockId.SetEnabled(true);
            txtStockDetails.SetEnabled(true);
            glMeasurement.SetEnabled(true);
            txStockGroup.SetEnabled(true);
            cbIsHasExpiry.SetEnabled(true);
        }
        else {
            hlAddLocation.SetEnabled(false);
            glCategory.SetEnabled(false);
            glSubCategory.SetEnabled(false);
            txtNoPendaftaran.SetEnabled(false);
            txtStockId.SetEnabled(false);
            txtStockDetails.SetEnabled(false);
            glMeasurement.SetEnabled(false);
            txStockGroup.SetEnabled(false);
            cbIsHasExpiry.SetEnabled(false);
        }
    }

    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name) {
            case 'Kemaskini': KemaskiniClicked(); break;
            case 'Lulus': LulusClicked(); break;
            case 'Kuiri': KuiriClicked(); break;
            case 'Tutup': TutupClicked(); break;
            case 'Tambah': TambahClicked(); break;
            case 'Simpan': SimpanClicked(); break;
            case 'Hantar': HantarClicked(); break;
            case 'Padam': PadamClicked(); break;
            case 'Batal': BatalCicked(); break;
                //case 'Cetak': CetakClicked(); break;
            case 'Print': PrintClicked(); break;
            case 'PrintList': PrintListClicked(); break;
            case 'Carian': CarianClicked(); break;
            case 'Audit': AuditClicked(); break;
            case 'Lampiran': LampiranClicked(); break;
            case 'Gambar': GambarClicked(); break;
            case 'Impot': ImpotClicked(); break;
        }
    }

    function KemaskiniClicked()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        MainForm.SetEnabled(true);

    }

    function TambahClicked()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        glCategory.Focus();
        
    }

    function SimpanClicked() {
        if (CheckBeforeSave()) {
            //alert('1');
            LoadingPanel.SetText('Sistem sedang menyimpan rekod stok.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp.PerformCallback('SAVE');
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Rekod Kategori telah berjaya dipadam.');
            //alert('2');
        }
    }

    function AuditClicked()
    {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        //PopupAuditTrail.SetContentUrl('AuditIndex.aspx');
        PopupAuditTrail.Show();
    }

    function TutupClicked()
    {
        window.close();
        return true;
    }

    function CheckBeforeSave() {

        if (txtNoPendaftaran.GetText() == "") {
            popupMsg_Label.SetText('No Daftar Stok mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

         return true;
    }

    function PadamClicked() {
        popupDeleteConfirmation.Show();
        popupDeleteConfirmation_BtnOk.Focus();
    }

    function CarianClicked() {
        PopupSearch.Show();
        GridSearch.PerformCallback();
    }

    function BatalCicked() {

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    }
    function StokSelected(Id) {
        alert(Id.toString());
        txtStockId.SetText(Id.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat stok yang dipilih.  Sila tunggu..');
        LoadingPanel.Show();
        cbp.PerformCallback('LOAD');
    }

    function cbp_EndCallback(s, e) {
        LoadingPanel.Hide();

        //alert(s.cpMode.toString());

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            return;
        }
        if (s.cpMode.toString() == 'LOAD') {
            PopupSearch.Hide();
            MainForm.SetEnabled(false);
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
        else if (s.cpMode.toString() == 'ADD') {
            popupMsg_Label.SetText('Rekod stok telah berjaya disiampan.');
            popupMsg.Show();
            //MainForm.SetEnabled(true);
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
            
        }
        else if (s.cpMode.toString() == 'CANCEL') {
            //MainForm.SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
        else if (s.cpMode.toString() == 'DELETE') {
            popupDeleteConfirmation.Hide();
            popupMsg_Label.SetText('Data telah dipadam dengan jayanya.');
            popupMsg.Show();
            //MainForm.SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
    }

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
        if (Kemaskini == 'true')
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

        if (Tambah == 'true')
            MainRibbon.GetItemByName("Tambah").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Tambah").SetEnabled(false);

        if (Simpan == 'true')
            MainRibbon.GetItemByName("Simpan").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Simpan").SetEnabled(false);

        if (Hantar == 'true')
            MainRibbon.GetItemByName("Hantar").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Hantar").SetEnabled(false);

        if (Padam == 'true')
            MainRibbon.GetItemByName("Padam").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Padam").SetEnabled(false);

        if (Batal == 'true')
            MainRibbon.GetItemByName("Batal").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Batal").SetEnabled(false);

        if (Cetak == 'true')
            MainRibbon.GetItemByName("Cetak").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Cetak").SetEnabled(false);

        if (Carian == 'true')
            MainRibbon.GetItemByName("Carian").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Carian").SetEnabled(false);

        if (Audit == 'true')
            MainRibbon.GetItemByName("Audit").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Audit").SetEnabled(false);

        if (Tutup == 'true')
            MainRibbon.GetItemByName("Tutup").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Tutup").SetEnabled(false);
    }


</script>


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Stor" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Store.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table style="width: 100%; vertical-align: top; text-align: left;">
                <tr>
                    <td style="width: 100%; vertical-align: top; text-align: left;">
                        <dx:ASPxRibbon ID="MainRibbon0" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                                                        <dx:RibbonDropDownButtonItem Name="Print" Text="Cetak Stor Ini">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <dx:RibbonDropDownButtonItem Name="PrintList" Text="Cetak Senarai Stor">
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
                        </dx:ASPxRibbon>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; vertical-align: top; text-align: left; padding-top: 10px">
                        <dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%" OnCallback="cbp_Callback">
                            <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                            <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s,e);
}" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxFormLayout ID="MainForm"  ClientInstanceName="MainForm" runat="server" Width="100%" ColCount="2">
                                        <Items>
                                            <dx:LayoutGroup Caption="Kategori" ColCount="2" ColSpan="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Kategory" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glCategory" runat="server" AutoGenerateColumns="False" ClientInstanceName="glCategory" DataSourceID="dsCategory" KeyFieldName="CatId" TextFormatString="({1}) {2}" Width="100%">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                        <Settings ShowFilterRow="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="CatId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CatCode" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Kod">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CatName" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nama">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents EndCallback="function(s, e) {
	glSubCategory.GetGridView().Refresh();
}" RowClick="function(s, e) {
	glSubCategory.GetGridView().Refresh();
}" />
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SP_STOR_GetStockCategory" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Sub Kategori" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glSubCategory" runat="server" ClientInstanceName="glSubCategory" AutoGenerateColumns="False" DataSourceID="dsSubCategory" KeyFieldName="SubCatId" TextFormatString="({1}) {2}" Width="100%">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="SubCatId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="SubCatCode" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="SubCatName" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsSubCategory" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SP_PR_GetSubCategories" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="glCategory" DefaultValue="0" Name="CatId" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Stok" ColCount="2" ColSpan="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="No Pendaftaran">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtNoPendaftaran" runat="server" ClientInstanceName="txtNoPendaftaran" CssClass="TextBoxForName" EnableClientSideAPI="True" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem>
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStockId" runat="server" ClientInstanceName="txtStockId" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Keterangan Stok">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStockDetails" runat="server" ClientInstanceName="txtStockDetails" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Unit Pengukuran">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glMeasurement" runat="server" AutoGenerateColumns="False" ClientInstanceName="glMeasurement" DataSourceID="dsMeasurement" KeyFieldName="UomId" TextFormatString="{1}" Width="100%">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="UomId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UomDescription" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsMeasurement" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [UomId], [UomDescription] FROM [MasterUnitOfMeasurement] ORDER BY [UomDescription]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kumpulan Stok">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txStockGroup" runat="server" ClientInstanceName="txStockGroup" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Ada Tarikh Luput?">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="cbIsHasExpiry" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Selected="True" Text="Tidak" Value="0" />
                                                                        <dx:ListEditItem Text="Ya" Value="1" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ColSpan="2">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxBinaryImage ID="MainForm0_E5" runat="server" StoreContentBytesInViewState="True">
                                                                </dx:ASPxBinaryImage>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                                    </dx:ASPxFormLayout>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>





<p>


<dx:ASPxCallbackPanel ID="cbp_save" runat="server" ClientInstanceName="cbp_save" Width="200px" OnCallback="cbp_save_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_save_EndCallback(s, e);	
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">



        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>

</p>
<dx:ASPxPopupControl ID="PopupSearch" runat="server" AllowDragging="True" ClientInstanceName="PopupSearch" EnableClientSideAPI="True" HeaderText="Carian Stor" Height="480px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="900px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="Store" EnableCallbackAnimation="True" Width="100%" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared" OnCustomCallback="GridSearch_CustomCallback" KeyFieldName="Stock_Id">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Stock_Id" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="1">
                                 <DataItemTemplate>
                            <dx:ASPxHyperLink ID="hlStockRegNo" runat="server" ClientInstanceName="hlStockRegNo" EnableClientSideAPI="true" Text="ASPxHyperLink" />
                        </DataItemTemplate>

                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="Stock_Detail" ShowInCustomizationForm="True" VisibleIndex="2">

                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Stock_StatusExpiryDate" ShowInCustomizationForm="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="StockGroup" ShowInCustomizationForm="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Category" ShowInCustomizationForm="True" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SubCategory" ShowInCustomizationForm="True" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Measurement" ShowInCustomizationForm="True" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>

                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <Settings ShowFilterRow="True" />
                <SettingsLoadingPanel Mode="Disabled" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Styles>
                    <AlternatingRow Enabled="True">
                    </AlternatingRow>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="Store" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_Store_Find_Stock" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>





































<p>
    &nbsp;</p>
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>






































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









<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
    <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol4" runat="server">
            <table style="width: 100%; text-align: center; vertical-align: top;">
                <tr>
                    <td>
                        <dx:ASPxLabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <table style="width: 100%; vertical-align: top; text-align: left;">
                            <tr>
                                <td style="width: 15%"></td>
                                <td style="width: 35%; text-align: right; vertical-align: middle; padding-right: 6px;">
                                    <dx:ASPxButton ID="popupDeleteConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnOk" Text="Ok" Width="100px">
                                        <ClientSideEvents Click="function(s, e) {
	ProceedWithDelete();
}" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 35%; text-align: left; vertical-align: middle; padding-left: 6px;">
                                    <dx:ASPxButton ID="popupDeleteConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnCancel" Text="Batal" Width="100px">
                                        <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Hide();
}" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 15%"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>







































<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" HeaderText="Senarai Audit Untuk Stok" MaxWidth="1800px" MinHeight="600px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
</dx:ASPxPopupControl>








































































