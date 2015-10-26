<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PegawaiAset_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PegawaiAset.PegawaiAset_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function ViewAssetOfficerAuditDetail(Idx) {
        Pid.SetText(Idx.toString());
        GridAuditDetails.PerformCallback();
    }

    function cbp_Report_EndCallback(s, e)
    {      
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Index.aspx');
        PopupPrint.Show();
    }

    function LoadPegawaiAset(Id)
    {
        temp.SetText(Id.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat Pegawai Aset yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback('LOAD');
    }

    function Toolbar_popupManagement_ItemClick(s, e)
    {
        switch (e.item.name)
        {
            case 'btnEdit': EditMode(); break;
            case 'btnSave': SaveMode(); break;
            case 'btnDelete': DeleteMode(); break;
            case 'btnCancel': CancelMode(); break;
        }
    }

    function CancelMode()
    {
        popupManagement.Hide();
    }

    function EditMode()
    {
        ManagePopupToolbar(false, true, true, true);
        Form_popupManagement.SetEnabled(true);
        PA_UserId.SetEnabled(false);
    }

    function SaveMode()
    {
        if (PA_UserId.GetText() == '' || PA_PtjSagaCode.GetText() == '' || PA_FromDate.GetText() == '' || PA_ToDate.GetText() == '')
        {
            popupMsg_Label.SetText('Nama Pegawai Aset, PTJ Dipertanggungjawabkan, Tarikh Mula dan Tarikh Tamat perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else
        {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Pegawai Aset.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupManagement.PerformCallback('SAVE');
        }
    }

    function DeleteMode()
    { popupDeleteConfirmation.Show(); }

    function ProceedWithDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod Pegawai Aset yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback('DELETE');
    }

    function User_Id_ValueChanged(s, e)
    {
        if (PA_UserId.GetText() != '') {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'PTJ_FullName;User_DesignationGrade;Dsgt_Name', SetUserValues);
        }
    }

    function SetUserValues(Values)
    {
        User_PTJ.SetText(Values[0].toString());
        User_DesignationAndGrade.SetText(Values[2].toString() + ' ' + Values[1].toString());
    }

    function cbp_popupManagement_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'NEW')
            {
                ManagePopupToolbar(false, true, false, true);
                popupManagement.SetWidth(screen.width * 0.7);
                popupManagement.Show();
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                popupManagement.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Pegawai Aset telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'DELETE')
            {
                popupDeleteConfirmation.Hide();
                popupManagement.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Pegawai Aset telah dipadam dengan jayanya.');
                popupMsg.Show();
            }
            else
            {
                ManagePopupToolbar(true, false, false, false);
                Form_popupManagement.SetEnabled(false);
                popupManagement.SetWidth(screen.width * 0.7);
                popupManagement.Show();
            }
        }
    }

    function ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel)
    {
        Toolbar_popupManagement.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupManagement.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupManagement.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupManagement.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }

    function OnPageLoad()
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
        OnLoadManagePopupToolbar();
    }

    function OnLoadManagePopupToolbar()
    {
        if (EnableUpdate.GetText() == 'True') 
            Toolbar_popupManagement.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnEdit").SetVisible(false);
        

        if (EnableCreate.GetText() == 'True') 
            Toolbar_popupManagement.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnSave").SetVisible(false);
        

        if (EnableDelete.GetText() == 'True') 
            Toolbar_popupManagement.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupManagement.GetItemByName("btnDelete").SetVisible(false);
        
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
            case 'Cetak': CetakClicked(); break;
            case 'Carian': CarianClicked(); break;
            case 'Audit': AuditClicked(); break;
            case 'Lampiran': LampiranClicked(); break;
            case 'Gambar': GambarClicked(); break;
            case 'Impot': ImpotClicked(); break;
        }
    }

    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked() {
        FormPegawaiAsetInformation.SetEnabled(true);
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Pegawai Aset baharu.  Sila tunggu sebentar.');
        LoadingPanel.Show();
        cbp_popupManagement.PerformCallback('NEW');
    }

    function SimpanClicked() {
        if (CheckDates() && CheckActiveStatus()) {
            LoadingPanel.SetText('Sistem sedang mengemaskini maklumat Pegawai Aset.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_Save.PerformCallback();
        }
    }

    function CheckDates() {
        if (StartDate.GetDate() > EndDate.GetDate()) {
            popupMsg_Label.SetText('Tarikh Mula Lantikan mesti lebih kecil daripada Tarikh Tamat Lantikan.<br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
        else
            return true;
    }

    function CheckActiveStatus() {
        if (ActiveStatus.GetValue().toString() == '') {
            popupMsg_Label.SetText('Medan <b>Status</b> belum diisi lagi.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
        else
            return true;
    }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked() {
        cbp_PegawaiAsetInformation.PerformCallback();
    }

    function CetakClicked()
    { cbp_Report.PerformCallback(); }

    function CarianClicked() {
        
    }

    function AuditClicked() {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        PopupAuditTrail.Show();
        GridAuditListing.PerformCallback();
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

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {

        if (EnableUpdate.GetText() == 'True') {
            if (Kemaskini == 'true')
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);
        }

        if (EnableCreate.GetText() == 'True') {
            if (Tambah == 'true')
                MainRibbon.GetItemByName("Tambah").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Tambah").SetEnabled(false);
        }

        if (Simpan == 'true')
            MainRibbon.GetItemByName("Simpan").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Simpan").SetEnabled(false);

        if (Hantar == 'true')
            MainRibbon.GetItemByName("Hantar").SetEnabled(true);
        else
            MainRibbon.GetItemByName("Hantar").SetEnabled(false);

        if (EnableDelete.GetText() == 'True') {
            if (Padam == 'true')
                MainRibbon.GetItemByName("Padam").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Padam").SetEnabled(false);
        }

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

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pegawai Aset" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PegawaiAset.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
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
                        <dx:RibbonButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
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
        <dx:RibbonTab Name="Lampiran" Text="Muatnaik">
            <Groups>
                <dx:RibbonGroup Name="Muatnaik" Text="">
                    <Items>
                        <dx:RibbonButtonItem Size="Large" Text="Lampiran" Name="Lampiran">
                            <LargeImage IconID="mail_attachment_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Gambar" Size="Large" Text="Gambar">
                            <LargeImage IconID="content_image_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Impot" Size="Large" Text="Import">
                            <LargeImage IconID="actions_download_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Laporan" Text="Laporan">
            <Groups>
                <dx:RibbonGroup>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Kelulusan" Text="Kelulusan">
            <Groups>
                <dx:RibbonGroup>
                    <Items>
                        <dx:RibbonButtonItem Name="Lulus" Size="Large" Text="Lulus">
                            <LargeImage IconID="actions_apply_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Kuiri" Size="Large" Text="Kuiri">
                            <LargeImage IconID="support_knowledgebasearticle_32x32">
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
            <td style="padding-top:10px;">
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="MainGridDs" KeyFieldName="PA_UserId" OnCustomCallback="MainGrid_CustomCallback" Width="100%" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="PA_UserId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PA_PtjSagaCode" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarikh Mula" FieldName="PA_FromDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="Tarikh Tamat" FieldName="PA_ToDate" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="PA_Active" ShowInCustomizationForm="True" VisibleIndex="5" Width="5%" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn Caption="PTJ Dipertanggungjawabkan" FieldName="PTJ_FullName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="30%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="User_Salutation" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="29%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="User_Salutation" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="PTJ Pegawai" FieldName="User_PTJ" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="25%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="MainGridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [V_PegawaiAset] ORDER BY [PTJ_FullName]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" Font-Names="Myriad Pro" Font-Size="Small">
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>




<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>




<dx:ASPxPopupControl ID="popupManagement" runat="server" ClientInstanceName="popupManagement" EnableClientSideAPI="True" HeaderText="Pengurusan Pegawai Aset" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True" MinWidth="900px" AllowDragging="True" MaxHeight="600px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupManagement" runat="server" Width="100%" ClientInstanceName="Toolbar_popupManagement" EnableClientSideAPI="True">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupManagement_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnEdit" Text="Kemaskini">
                            <Image IconID="edit_edit_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnDelete" Text="Padam">
                            <Image IconID="edit_delete_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnCancel" Text="Batal">
                            <Image IconID="actions_cancel_16x16">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxCallbackPanel ID="cbp_popupManagement" runat="server" ClientInstanceName="cbp_popupManagement" OnCallback="cbp_popupManagement_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupManagement_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="Form_popupManagement" runat="server" ClientInstanceName="Form_popupManagement" ColCount="2" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Pegawai Aset" Width="50%">
                                        <Items>
                                            <dx:LayoutItem Caption="Nama Staf">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridLookup ID="PA_UserId" runat="server" AutoGenerateColumns="False" DataSourceID="PA_UserId_Ds" KeyFieldName="User_Id" Width="100%" ClientInstanceName="PA_UserId" EnableClientSideAPI="True" TextFormatString="{2}">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                <Settings ShowFilterRow="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="User_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="ID Staf" FieldName="User_EmployeeId" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="User_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="30%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="30%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="Dsgt_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="20%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Gred" FieldName="User_DesignationGrade" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(screen.width * 0.4);
}" ValueChanged="function(s, e) {
	User_Id_ValueChanged(s, e);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="PA_UserId_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [User_Id], [User_EmployeeId], [User_Name], [PTJ_FullName], [Dsgt_Name], [User_DesignationGrade] FROM [V_User] WHERE ([User_StatusCode] = @User_StatusCode) ORDER BY [User_Name]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="1" Name="User_StatusCode" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Pusat Tanggungjawab">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="User_PTJ" runat="server" Text="ASPxLabel" ClientInstanceName="User_PTJ" EnableClientSideAPI="True">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Jawatan dan Gred">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="User_DesignationAndGrade" runat="server" Text="ASPxLabel" ClientInstanceName="User_DesignationAndGrade" EnableClientSideAPI="True">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Lantikan Terdahulu" RowSpan="2" Width="50%">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="temp" runat="server" ClientInstanceName="temp" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="Grid_Prev" runat="server" ClientInstanceName="Grid_Prev" Width="100%" AutoGenerateColumns="False">
                                                            <Columns>
                                                                <dx:GridViewDataDateColumn Caption="Tarikh Mula" ShowInCustomizationForm="True" VisibleIndex="0" Width="12%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" FieldName="PA_FromDate">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataDateColumn Caption="Tarikh Tamat" ShowInCustomizationForm="True" VisibleIndex="1" Width="12%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" FieldName="PA_ToDate">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn Caption="PTJ Dipertanggungjawabkan" ShowInCustomizationForm="True" VisibleIndex="2" Width="76%" FieldName="PTJ_FullName">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Styles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </Styles>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Maklumat Lantikan" ColCount="2" Width="50%">
                                        <Items>
                                            <dx:LayoutItem Caption="PTJ Yang Dipertanggungjawabkan" ColSpan="2" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridLookup ID="PA_PtjSagaCode" runat="server" Width="100%" AutoGenerateColumns="False" ClientInstanceName="PA_PtjSagaCode" DataSourceID="PA_PtjSagaCode_Ds" EnableClientSideAPI="True" KeyFieldName="PTJ_SagaCode" TextFormatString="{1}">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                <Settings ShowFilterRow="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Kod SAGA" FieldName="PTJ_SagaCode" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nama Pusat Tanggungjawab" FieldName="PTJ_FullName" ShowInCustomizationForm="True" VisibleIndex="1" Width="90%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="PA_PtjSagaCode_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_SagaCode], [PTJ_FullName] FROM [PusatTanggungJawab] ORDER BY [PTJ_SagaCode]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Mula" Width="10%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="PA_FromDate" runat="server" ClientInstanceName="PA_FromDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Tamat" Width="90%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="PA_ToDate" runat="server" ClientInstanceName="PA_ToDate" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                                <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Bottom" />
                            </dx:ASPxFormLayout>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>



<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Pegawai Aset" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDelete();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="1000px" HeaderText="Senarai Audit Buletin" AllowDragging="True" Height="650px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" MaxHeight="800px">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="FormAuditTrail" runat="server" ClientInstanceName="FormAuditTrail" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Audit" Width="40%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="GridAuditListing" runat="server" ClientInstanceName="GridAuditListing" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditMasterDs" KeyFieldName="ProcessId" OnCustomCallback="GridAuditListing_CustomCallback" OnHtmlDataCellPrepared="GridAuditListing_HtmlDataCellPrepared">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="40%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>
<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="ModifiedBy" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="AssetOfficerName" ReadOnly="True" ShowInCustomizationForm="True" Width="40%" Caption="Nama Pegawai Aset" VisibleIndex="2">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>
<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="ModifiedDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>
<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Tindakan" FieldName="ActionText" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>
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
                                <asp:SqlDataSource ID="AuditMasterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [ProcessId], [ModifiedBy], [AssetOfficerName], [ModifiedDate], [ActionText] FROM [V_PegawaiAset_MasterAudit] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Data Audit" Width="60%">
                <Items>
                    <dx:LayoutItem Caption="Maklumat Pengguna Sistem" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxGridView ID="GridAuditDetails" runat="server" ClientInstanceName="GridAuditDetails" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditHeaderDs" EnableCallbackAnimation="True" OnCustomCallback="GridAuditDetails_CustomCallback">
                                   
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="RowControl" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Medan" FieldName="ColumnName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="30%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsLoadingPanel Mode="Disabled" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="AuditHeaderDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_PegawaiAset_AuditDetails" SelectCommandType="StoredProcedure" OnSelecting="AuditHeaderDs_Selecting">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="XX" Name="ProcessId" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                        <dx:ASPxTextBox ID="Pid" runat="server" ClientInstanceName="Pid" EnableClientSideAPI="True" Width="170px" ClientVisible="false">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>