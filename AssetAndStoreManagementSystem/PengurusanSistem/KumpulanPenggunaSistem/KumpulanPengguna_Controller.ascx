<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KumpulanPengguna_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.KumpulanPenggunaSistem.KumpulanPengguna_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="AuditTrail_Controller.ascx" tagname="AuditTrail_Controller" tagprefix="uc2" %>

<script type="text/javascript">
    function cbp_Report_EndCallback(s, e)
    {
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Viewer/Index.aspx');
        PopupPrint.Show();
    }

    function AuditDetailSelected(ProcessId) {
        GridAuditHeaderDetails.PerformCallback(ProcessId);
    }

    function Toolbar_popupManagement_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': EditMode(); break;
            case 'btnSave': SaveMode(); break;
            case 'btnDelete': DeleteMode(); break;
            case 'btnCancel': CancelMode(); break;
        }
    }

    function EditMode() {
        ManagePopupToolbar(false, true, true, true);
        FormKumpulanPenggunaSistem.SetEnabled(true);
    }

    function DeleteMode()
    {
        popupDeleteConfirmation.Show(); popupDeleteConfirmation_BtnOk.Focus();
    }

    function ProceedWithDelete() {
        popupDeleteConfirmation.Hide();
        LoadingPanel.SetText('Sistem sedang memadam rekod kumpulan pengguna sistem yang dipilih.  Sila tunggu sebentar');
        LoadingPanel.Show();
        cbp_SystemUserGroup.PerformCallback('DELETE');
    }

    function SaveMode() {
        if (UserDefinedId.GetText() == '' || UserGroupName.GetText() == '')
        {
            popupMsg_Label.SetText('Nama dan Keterangan perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Kumupulan Pengguna Sistem.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_SystemUserGroup.PerformCallback('SAVE');
        }
    }

    function CancelMode()
    {
        popupManagement.Hide();
    }

    function ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupManagement.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupManagement.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupManagement.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupManagement.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }

    function ViewSUG(Idx)
    {
        UserGroupId.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat kumpulan pengguna sistem yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_SystemUserGroup.PerformCallback('LOAD');
    }

    function cbp_SystemUserGroup_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'SAVE')
            {
                popupManagement.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Kumpulan Pengguna Sistem telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'DELETE') {
                popupManagement.Hide();
                MainGrid.PerformCallback();
                popupMsg_Label.SetText('Rekod Kumpulan Pengguna Sistem telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'NEW')
            {   
                FormKumpulanPenggunaSistem.SetEnabled(true);
                ManagePopupToolbar(false, true, false, true);
                popupManagement.SetWidth(screen.width * 0.7);
                popupManagement.Show();
            }
            else
            {   
                FormKumpulanPenggunaSistem.SetEnabled(false);
                ManagePopupToolbar(true, false, false, false);
                popupManagement.SetWidth(screen.width * 0.7);
                popupManagement.Show();
            }
        }
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

    function OnLoadManagePopupToolbar() {
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
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'true');
        FormKumpulanPenggunaSistem.SetEnabled(true);
    }

    function TambahClicked() {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Kumpulan Pengguna Sistem Baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_SystemUserGroup.PerformCallback('NEW');
    }

    function SimpanClicked() {
        //check mandatoty fields
        if (UserDefinedId.GetText() == '' || UserGroupName.GetText() == '' || ActiveIndicator.GetValue().toString() == '') {
            popupMsg_Label.SetText('Sila pastikan semua medan telah diisi.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod.  Sila tunggu');
            LoadingPanel.Show();
            cbp_Save.PerformCallback('SAVE');
        }
    }

    function HantarClicked()
    { }

    function PadamClicked()
    {  }

    function BatalCicked() {
        
    }

    function CetakClicked() {
        cbp_Report.PerformCallback();
    }

    function CarianClicked() {
        GridSearchSystemUserGroup.PerformCallback();
        PopupSearchSystemUserGroup.Show();
    }

    function AuditClicked() {
        PopupAuditTrail.SetWidth(screen.width * 0.85);
        PopupAuditTrail.Show()
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
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Kumpulan Pengguna Sistem" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/KumpulanPenggunaSistem.png">
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
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainGrid" DataSourceID="SqlDataSource1" KeyFieldName="UserDefinedId" Width="100%" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="UserGroupId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="UserDefinedId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="UserDefinedId" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="UserGroupName" ShowInCustomizationForm="True" VisibleIndex="2">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jumlah Ahli" FieldName="MemberCount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Equals" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [UserGroupId], [UserDefinedId], [UserGroupName], [MemberCount] FROM [V_SystemUserGroup] ORDER BY [UserDefinedId]"></asp:SqlDataSource>
             </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>


<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
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
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
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
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>



<uc2:AuditTrail_Controller ID="AuditTrail_Controller1" runat="server" />




<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);

}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>




<dx:ASPxPopupControl ID="popupManagement" runat="server" AllowDragging="True" ClientInstanceName="popupManagement" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pengurusan Kumpulan Pengguna Sistem" MaxHeight="800px" MinWidth="900px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupManagement" runat="server" ClientInstanceName="Toolbar_popupManagement" EnableClientSideAPI="True" Width="100%">
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
            <td style="padding-top:10px">
                <dx:ASPxCallbackPanel ID="cbp_SystemUserGroup" runat="server" ClientInstanceName="cbp_SystemUserGroup" EnableCallbackAnimation="True" OnCallback="cbp_SystemUserGroup_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SystemUserGroup_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="FormKumpulanPenggunaSistem" runat="server" ClientInstanceName="FormKumpulanPenggunaSistem" ColCount="2" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Kumpulan Penguna" Width="40%">
                                        <Items>
                                            <dx:LayoutItem Caption="Kod Kumpulan Pengguna" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="UserDefinedId" runat="server" ClientInstanceName="UserDefinedId" CssClass="TextBoxForNo" EnableClientSideAPI="True" MaxLength="50" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Keterangan">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxMemo ID="UserGroupName" runat="server" ClientInstanceName="UserGroupName" EnableClientSideAPI="True" MaxLength="200" Rows="2" Width="100%">
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                                        </dx:ASPxMemo>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Aktif?">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxRadioButtonList ID="ActiveIndicator" runat="server" ClientInstanceName="ActiveIndicator" EnableClientSideAPI="True" RepeatDirection="Horizontal" ValueType="System.Boolean">
                                                            <Items>
                                                                <dx:ListEditItem Text="Ya" Value="True" />
                                                                <dx:ListEditItem Text="Tidak" Value="False" />
                                                            </Items>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxRadioButtonList>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="UserGroupId" runat="server" ClientInstanceName="UserGroupId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Akses Kumpulan Pengguna" Width="60%">
                                        <Items>
                                            <dx:LayoutItem Caption="" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="GridSysUserCredentials" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSysUserCredentials" EnableCallbackAnimation="True" KeyFieldName="MenuId" OnHtmlDataCellPrepared="GridSysUserCredentials_HtmlDataCellPrepared" Width="100%">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="MenuId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="MenuGroup" ShowInCustomizationForm="True" VisibleIndex="1" Width="30px">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Sub Menu Sistem" FieldName="MenuItem" ShowInCustomizationForm="True" VisibleIndex="2" Width="30%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataCheckColumn FieldName="InsertDeleteUpdate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Akses Menu" FieldName="EnableView" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxCheckBox ID="EnableView" runat="server" EnableClientSideAPI="True">
                                                                        </dx:ASPxCheckBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Rekod Baharu" FieldName="EnableCreate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxCheckBox ID="EnableCreate" runat="server" EnableClientSideAPI="True">
                                                                        </dx:ASPxCheckBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Edit Rekod" FieldName="EnableUpdate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="10%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxCheckBox ID="EnableUpdate" runat="server" EnableClientSideAPI="True">
                                                                        </dx:ASPxCheckBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataCheckColumn>
                                                                <dx:GridViewDataCheckColumn Caption="Padam Rekod" FieldName="EnableDelete" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="10%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxCheckBox ID="EnableDelete" runat="server" EnableClientSideAPI="True">
                                                                        </dx:ASPxCheckBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataCheckColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowDragDrop="False" AutoExpandAllGroups="True" AllowSort="False" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings GroupFormat="{1} {2}" />
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
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>





<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Kumpulan Pengguna Sistem" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>






