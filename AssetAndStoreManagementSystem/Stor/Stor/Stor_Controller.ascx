<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Stor_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Stor.Stor_Controller" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>

    function AddNewLocation() {
        cbp_LocationInfo.PerformCallback('ADDLOCATION');
    }

    function ProceedWithDelete()
    {
        ////popupDeleteConfirmation.Hide();
        ////LoadingPanel.SetText('Sistem sedang memadam rekod yang dipilih.  Sila tunggu sebentar..');
        ////LoadingPanel.Show();
        ////cbp.PerformCallback('DELETE*');
        //alert('To be done..');
    }

    function RemoveSubCat(Location_IdToRemove) {
        popupDeleteConfirmation.Hide();
        LoadingPanel.SetText('Sistem sedang memadam rekod yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_LocationInfo.PerformCallback('DELETE*' + Location_IdToRemove.toString());
    }

    function OnPageLoad() {
        ManageForm('false');
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true');
    }

    function FillEmployeeInfo(Values) {
        txtEmployeeName.SetText(Values[0].toString());
        txtPhoneNumber.SetText(Values[1].toString());
        txtEmployeeEmail.SetText(Values[2].toString());
    }

    function StorSelected(Id) {
        txtStoreId.SetText(Id.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat stor yang dipilih.  Sila tunggu..');
        LoadingPanel.Show();
        //alert('1'); 
        cbp.PerformCallback('LOAD');
        //alert('2');
    }


    function EmpGridLookupOnGetRowValues(values) {
        EmployeeName.SetText(values);
        EmployeeEmail.SetText(values);
    }

    function cbp_EndCallback(s, e) {

        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            return;
        }

        if (s.cpMode.toString() == 'SAVE') {
            popupMsg_Label.SetText('Rekod stor telah berjaya disimpan.');
            popupMsg.Show();
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'true', 'true', 'true', 'false', 'false', 'true');
        }
        else if (s.cpMode.toString() == 'DELETE') {
            popupMsg_Label.SetText('Rekod stor telah berjaya dipadam.');
            popupMsg.Show();
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        }
        else if (s.cpMode.toString() == 'LOAD') {
            cbp_LocationInfo.PerformCallback('LOAD');
            PopupSearch.Hide();
            MainForm.SetEnabled(false);
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
        else if (s.cpMode.toString() == 'CANCEL') {
            MainForm.SetEnabled(false);
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
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

    function PrintClicked() {
        //alert('print this STOR only');
        cbp_Report.PerformCallback('STOR');
    }

    function PrintListClicked() {
        //alert('print STOR Listing');
        cbp_Report.PerformCallback('LIST');
    }

    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked() {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        MainForm.SetEnabled(true);
    }

    function TambahClicked() {
        ManageForm('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        txtStoreName.SetText('');
        glPtj.SetValue(null);
        txtStoreAdd1.SetText('');
        txtStoreAdd2.SetText('');
        txtStoreAdd3.SetText('');
        txtStoreAdd4.SetText('');
        glEmployeeId.SetValue(null);
        txtPhoneNumber.SetText('');
        txtStoreId.SetText('');
        cbJenisStor(null);
    }

    function SimpanClicked() {
        if (CheckBeforeSave()) {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod stor.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp.PerformCallback('SAVE');

        }
    }

    function CheckBeforeSave()
    {
        if (txtStoreName.GetText() == '')
        {
            popupMsg_Label.SetText('Nama Stor perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        if (glPtj.GetText() == '')
        {
            popupMsg_Label.SetText('Pusat Tanggungjawab perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        if (glEmployeeId.GetText() == '')
        {
            popupMsg_Label.SetText('Nama Pegawai perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }

         return true;
    }

    function CheckLocationGrid() {
        var lpass = true;

        var Location_Section;
        var Location_Line;

        for (var i = 0; i < GridLocationList.GetVisibleRowsOnPage() ; i++) {
            Location_Section = ASPxClientControl.GetControlCollection().GetByName('Location_Section' + i.toString());
            Location_Line = ASPxClientControl.GetControlCollection().GetByName('Location_Line' + i.toString());

            if (Location_Section.GetText() == '' || Location_Line.GetText() == '') {
                lpass = false;
                popupMsg_Label.SetText('Sila pastikan semua medan Gudang / Seksyen & Baris <br>untuk setiap Lokasi telah diisi.<br><br>Sila semak dan cuba sekali lagi');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }

            if (!lpass)
                break;
        }

        return lpass;
    }

    function HantarClicked()
    { }

    function PadamClicked() {
        popupDeleteConfirmation.Show();
        popupDeleteConfirmation_BtnOk.Focus();
    }

    function BatalCicked() {
        if (txtStoreId.GetText() == '') {
            cbp.PerformCallback('CANCEL');
        } else {
            LoadingPanel.SetText('Sistem sedang membuka kembali maklumat stor yang terakhir disimpan.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp.PerformCallback('LOAD');

        }


    }

    function CetakClicked() {
        cbp_Report.PerformCallback();
    }

    function CarianClicked() {
        PopupSearch.Show();
        GridSearch.PerformCallback();
    }

    function AuditClicked()
    {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        //PopupAuditTrail.SetContentUrl('AuditIndex.aspx');
        PopupAuditTrail.Show();
    }

    function TutupClicked() {
        window.close();
        return true;
    }

    function LampiranClicked()
    { }

    function GambarClicked()
    { }

    function ImpotClicked()
    { }

    function RemoveLocation(LocationNumberToRemove) {

        cbp_LocationInfo.PerformCallback('REMOVELOCATION*' + LocationNumberToRemove.toString());
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

    function ManageForm(truefalse) {
        if (truefalse == 'true') {
            txtStoreName.SetEnabled(true);
            glPtj.SetEnabled(true);
            txtStoreAdd1.SetEnabled(true);
            txtStoreAdd2.SetEnabled(true);
            txtStoreAdd3.SetEnabled(true);
            txtStoreAdd4.SetEnabled(true);
            glEmployeeId.SetEnabled(true);
            hlAddLocation.SetEnabled(true);

        }
        else {
            txtStoreName.SetEnabled(false);
            glPtj.SetEnabled(false);
            txtStoreAdd1.SetEnabled(false);
            txtStoreAdd2.SetEnabled(false);
            txtStoreAdd3.SetEnabled(false);
            txtStoreAdd4.SetEnabled(false);
            glEmployeeId.SetEnabled(false);
            txtPhoneNumber.SetEnabled(false);
            txtEmployeeName.SetEnabled(false);
            hlAddLocation.SetEnabled(false);
        }
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
                        <dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                        <dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" OnCallback="cbp_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                            <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                            <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);
}" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxFormLayout ID="MainForm"  ClientInstanceName="MainForm" runat="server" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="Maklumat Utama">
                                                <Items>
                                                    <dx:LayoutItem Caption="Pusat Tanggungjawab">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPtj" runat="server" AutoGenerateColumns="False" ClientInstanceName="glPtj" DataSourceID="dsPtj" EnableClientSideAPI="True" KeyFieldName="PTJ_Id" TextFormatString="({0}) {1}" Width="300px">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                        <Settings ShowFilterRow="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsPtj" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_Code], [PTJ_Name], [PTJ_Id] FROM [PusatTanggungJawab] ORDER BY [PTJ_Code]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Nama Stor">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStoreName" runat="server" ClientInstanceName="txtStoreName" CssClass="TextBoxForName" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jenis Stor">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="cbJenisStor" runat="server" SelectedIndex="0">
                                                                    <Items>
                                                                        <dx:ListEditItem Selected="True" Text="Stor Pusat" Value="0" />
                                                                        <dx:ListEditItem Text="Stor Utama" Value="1" />
                                                                        <dx:ListEditItem Text="Stor Unit" Value="2" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                                <dx:ASPxTextBox ID="txtStoreId" runat="server" ClientInstanceName="txtStoreId" EnableClientSideAPI="True" Width="170px">
                                                                </dx:ASPxTextBox>
                                                                <br />
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Alamat">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStoreAdd1" runat="server" ClientInstanceName="txtStoreAdd1" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                                <br />
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStoreAdd2" runat="server" ClientInstanceName="txtStoreAdd2" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtStoreAdd3" runat="server" ClientInstanceName="txtStoreAdd3" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <br />
                                                                <dx:ASPxTextBox ID="txtStoreAdd4" runat="server" ClientInstanceName="txtStoreAdd4" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Pengawai">
                                                <Items>
                                                    <dx:LayoutItem Caption="Id Pegawai">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glEmployeeId" runat="server" AutoGenerateColumns="False" ClientInstanceName="glEmployeeId" CssClass="TextBoxForName" DataSourceID="EmpDs" EnableClientSideAPI="True" TextFormatString="({0}) {1}" KeyFieldName="EmployeeIdNo" OnTextChanged="glEmployeeId_TextChanged">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                        <Settings ShowFilterRow="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Id Pegawai">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Nama">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Telefon">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeEmail" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Email">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}"
                                                                        DropDown="function(s, e) {
	s.GetGridView().SetWidth(650);
}"
                                                                        ValueChanged="function(s, e) {
	var GV = glEmployeeId.GetGridView();
	GV.GetRowValues(GV.GetFocusedRowIndex(), 'EmployeeName;EmployeeTelephone;EmployeeEmail', FillEmployeeInfo);
}" />
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [EmployeeIdNo],[EmployeeName],[EmployeeTelephone] ,[EmployeeEmail] FROM [Employee] ORDER BY [EmployeeName]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Nama Pengawai">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtEmployeeName" runat="server" Width="170px" ClientInstanceName="txtEmployeeName" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                                <br />
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="No. Telefon">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPhoneNumber" runat="server" ClientInstanceName="txtPhoneNumber" CssClass="TextBoxForTel" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Alamat Emel">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtEmployeeEmail" runat="server" ClientEnabled="False" ClientInstanceName="txtEmployeeEmail" CssClass="TextBoxForEmel" EnableClientSideAPI="True" >
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Lokasi" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxCallbackPanel ID="cbp_LocationInfo" runat="server" ClientInstanceName="cbp_LocationInfo" EnableCallbackAnimation="True" OnCallback="cbp_LocationInfo_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                                                                    <SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

                                                                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_LocationInfo_EndCallback(s, e);
}" />
                                                                    <PanelCollection>
                                                                        <dx:PanelContent runat="server">
                                                                            <dx:ASPxFormLayout ID="MaklumatLokasi" runat="server" ClientInstanceName="MaklumatLokasi" Width="100%">
                                                                                <Items>
                                                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                <dx:ASPxHyperLink ID="hlAddLocation" runat="server" ClientInstanceName="hlAddLocation" Text="Tambah Maklumat Lokasi" CssClass="myHyperlink" EnableClientSideAPI="True" NavigateUrl="javascript: AddNewLocation();">
                                                                                                </dx:ASPxHyperLink>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                    </dx:LayoutItem>
                                                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                                                        <LayoutItemNestedControlCollection>
                                                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                                                <dx:ASPxGridView ID="gvLocation" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridLocationList" OnHtmlDataCellPrepared="GridLocationList_HtmlDataCellPrepared">
                                                                                                    <Columns>
                                                                                                        <dx:GridViewDataTextColumn Caption="Gudang / Seksyen" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%" FieldName="LocationSection">
                                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationSection" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <dx:GridViewDataTextColumn Caption="Baris" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%" FieldName="LocationLine">
                                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationLine" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <dx:GridViewDataTextColumn Caption="Rak" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%" FieldName="LocationShelf">
                                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationShelf" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <dx:GridViewDataTextColumn Caption="Tingkat" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%" FieldName="LocationLevel">
                                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationLevel" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="6" Width="5%" FieldName="LocationNumber">
                                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxHyperLink ID="LocationNumber" EnableClientSideAPI="true" ToolTip="Padam Lokasi ini" runat="server" Text="ASPxHyperLink" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                                                                                                </dx:ASPxHyperLink>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <dx:GridViewDataTextColumn Caption="Petak" FieldName="LocationSwath" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True"></CellStyle>
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationSwath" runat="server" Width="100%" EnableClientSideAPI="true"></dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                        <%--<dx:GridViewDataTextColumn FieldName="Countx" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                                    </dx:GridViewDataTextColumn>--%>
                                                                                                        <dx:GridViewDataTextColumn Caption="Nama / Zon" FieldName="LocationName" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                                                            <DataItemTemplate>
                                                                                                                <dx:ASPxTextBox ID="txtLocationName" runat="server" EnableClientSideAPI="True" >
                                                                                                                </dx:ASPxTextBox>
                                                                                                            </DataItemTemplate>
                                                                                                        </dx:GridViewDataTextColumn>
                                                                                                    </Columns>
                                                                                                    <SettingsPager Mode="ShowAllRecords">
                                                                                                    </SettingsPager>
                                                                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                                                    <Styles>
                                                                                                        <AlternatingRow Enabled="True">
                                                                                                        </AlternatingRow>
                                                                                                    </Styles>
                                                                                                </dx:ASPxGridView>
                                                                                            </dx:LayoutItemNestedControlContainer>
                                                                                        </LayoutItemNestedControlCollection>
                                                                                    </dx:LayoutItem>
                                                                                </Items>
                                                                                <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                                                                <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                                                                                <Paddings Padding="0px" />
                                                                                <Border BorderStyle="None" />
                                                                            </dx:ASPxFormLayout>
                                                                        </dx:PanelContent>
                                                                    </PanelCollection>
                                                                </dx:ASPxCallbackPanel>
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














<%--<dx:GridViewDataTextColumn FieldName="Countx" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                                    </dx:GridViewDataTextColumn>--%>














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
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="PopupSearch" runat="server" AllowDragging="True" ClientInstanceName="PopupSearch" EnableClientSideAPI="True" HeaderText="Carian Stor" Height="480px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="900px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="Store" EnableCallbackAnimation="True" Width="100%" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared" OnCustomCallback="GridSearch_CustomCallback" KeyFieldName="ST_StoreId">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreId" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Nama Stor">
                         <DataItemTemplate>
                             <dx:ASPxHyperLink ID="ST_StoreName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink"></dx:ASPxHyperLink>
                         </DataItemTemplate>
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="ST_StorePTJId" ShowInCustomizationForm="True" VisibleIndex="2" Caption="PTJ Id">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="StoreType" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Jenis Stor">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreAdd1" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Alamat 1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreAdd2" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Alamat 2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreAdd3" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Alamat 3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreAdd4" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Alamat 4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ST_StoreOfficerEmpSysId" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Id Pengawai">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Nama Pengawai">
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
            <asp:SqlDataSource ID="Store" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT [ST_StoreId]
      ,[ST_StoreName]
      ,[ST_StorePTJId]
      ,[StoreType]
      ,[ST_StoreAdd1]
      ,[ST_StoreAdd2]
      ,[ST_StoreAdd3]
      ,[ST_StoreAdd4]
      ,[ST_StoreOfficerEmpSysId]
	  ,E.EmployeeName
  FROM [AMS_Stock].[dbo].[Store]
 LEFT JOIN [AMS_Master].[dbo].[Employee] E ON [AMS_Stock].[dbo].[Store].ST_StoreOfficerEmpSysId = E.EmployeeSystemId
 LEFT JOIN [AMS_Master].[dbo].[MasterUnitOfMeasurement] U ON [AMS_Stock].[dbo].[Store].ST_StorePTJId= U.UomId
"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>





















<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	window.open('../../Report/Viewer/Index.aspx');
}" />
    <PanelCollection>
        <dx:PanelContent runat="server"></dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>







































<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" AllowDragging="True" AllowResize="True" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" HeaderText="Senarai Audit Untuk Stor" MaxWidth="1800px" MinHeight="600px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
</dx:ASPxPopupControl>



































































































