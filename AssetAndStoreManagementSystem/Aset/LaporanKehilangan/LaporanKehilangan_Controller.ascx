<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LaporanKehilangan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.LaporanKehilangan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="KetuaPtj_Controller.ascx" tagname="KetuaPtj_Controller" tagprefix="uc2" %>
<%@ Register src="Penyiasat_Controller.ascx" tagname="Penyiasat_Controller" tagprefix="uc3" %>
<%@ Register src="HasilSiasatan_Controller.ascx" tagname="HasilSiasatan_Controller" tagprefix="uc4" %>
<%@ Register src="Laporan_Controller.ascx" tagname="Laporan_Controller" tagprefix="uc1" %>
<%@ Register src="Tab_AliranKerja_Controller.ascx" tagname="Tab_AliranKerja_Controller" tagprefix="uc5" %>

<%@ Register src="../../Components/UploadDocument/UploadDocument_Controller.ascx" tagname="UploadDocument_Controller" tagprefix="uc6" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>  

    function OnPageLoadEvents()
    {
        opener.popup_AssetSystem.Hide();
        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);

        var PenyiasatTab = PageControl.GetTab(1);
        PenyiasatTab.SetVisible(false);

        var LaporanPenyiasatTab = PageControl.GetTab(2);
        LaporanPenyiasatTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(false);

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);        
        EnableDisableForm('false');        
    }

    function OnPageLoad_LaporanKehilanganSelected(P, R)
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        LKH_ProcessId.SetText(P.toString());
        LKH_RevNumber.SetText(R.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod laporan kehilangan.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Laporan.PerformCallback('LOAD');
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
    {
        if (LKH_Status.GetText() == '3')
        {
            if (CheckMissingItemCurrentValue())
                WorkflowApproveReject('1');
        }
        else
        { }
        
    }

    function KuiriClicked()
    { WorkflowApproveReject('0'); }

    function KemaskiniClicked()
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
        popupAttachDocument_CallerName.SetText('LAPORAN KEROSAKAN');

        if (LKH_Status.GetText() == '2')
        {
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
            MainRibbon.GetItemByName("Gambar").SetEnabled(true);
            EnableDisableForm('true');
            LKH_SurchargeAction.SetEnabled(false);
            LKH_SurchargeDate.SetEnabled(false);
            LKH_DiciplinaryAction.SetEnabled(false);
            LKH_DiciplinaryDate.SetEnabled(false);
            
        }
        else if (LKH_Status.GetText() == '3') {
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
            MainRibbon.GetItemByName("Gambar").SetEnabled(true);
            EnableDisableForm('true');
            LKH_SurchargeAction.SetEnabled(false);
            LKH_SurchargeDate.SetEnabled(false);
            LKH_DiciplinaryAction.SetEnabled(false);
            LKH_DiciplinaryDate.SetEnabled(false);
        }
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Laporan.PerformCallback('ADD');
    }

    function SimpanClicked()
    {
        if (CheckBeforeSave())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod laporan kehilangan anda.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_Laporan.PerformCallback('SAVE');
        }
           
    }

    function HantarClicked()
    {
        if (LKH_Status.GetText() == '2')
        {
            if (CheckBeforeSave() && CalculateMissingItems() && CheckCurrentValue()) {
                LoadingPanel.SetText('Sistem sedang menghantar rekod laporan kehilangan anda.  Sila tunggu sebentar..');
                LoadingPanel.Show();
                cbp_Laporan.PerformCallback('POST');
            }
        }
        else if (LKH_Status.GetText() == '32')
        {
            if (CheckPPGrid())
            {
                LoadingPanel.SetText('Sistem sedang mengemaskini maklumat Pegawai Peyiasat.  Sila tunggu sebentar..')
                LoadingPanel.Show();
                cbp_SavePostPP.PerformCallback('POST');
            }
        }
        else if (LKH_Status.GetText() == '35')
        {
            if (LKIR_ReportDate.GetText() != '' || LKIR_ReportSummary.GetText() != '') {
                LoadingPanel.SetText('Sistem sedang menghantar laporan pegawai penyiasat.  Sila tunggu sebentar..');
                LoadingPanel.Show();
                cbp_HPP.PerformCallback('POST');
            }
            else {
                popupMsg_Label.SetText('Sila pastikan tarikh dan ringkasan laporan telah diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi');
                popupMsg.Show();
            }
        }
    }

    function CheckPegawaiAsetConfirmation() {
        if (TabPA_PegawaiAssetConfirmation.GetText() == '' ||
            TabPA_PegawaiAssetRecommendation.GetText() == '') {
            popupMsg_Label.SetText('Pengesahan dan syor diperlukan.<br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
            return false;
        }
        else
            return true;
    }

    function CheckAssetInvSelected() {
        if (AK_AssetInvRegNumber.GetText() == '') {
            popupMsg_Label.SetText('Rekod Aset Alih yang ingin dilaporkan belum dipilih.<br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
            return false;
        }
        else
            return true;
    }

    function CheckDamageNotes() {
        if (AK_DamageNotes.GetText() == '') {
            popupMsg_Label.SetText('Sila nyatakan kerosakan asset alih terlebih dahulu.<br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
            return false;
        }
        else
            return true;
    }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupSearch.SetWidth(screen.width * 0.85);
        popupSearch.Show();
        GridMainSearch.PerformCallback();
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

    function LampiranClicked()
    {
        popupAttachDocument.Show();
        GridDocumentListing.PerformCallback();
    }

    function GambarClicked() {
        popupAttachImage.SetWidth(screen.width * 0.7);
        popupAttachImage.Show();
    }

    function ImpotClicked() {

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

    function ProceedWithWorkflowLaporanKehilangan() {
        LoadingPanel.SetText('Sistem sedang mengemaskini aliran kerja laporan kehilangan ini.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_GetMissingItemDt.PerformCallback();
    }

    function WorkflowApproveReject(ApproveReject) {
        WF_Text.SetText('');
        WF_Result.SetText('');
        WF_Comment.SetText('');

        if (ApproveReject.toString() == '1') {
            WF_Text.SetText('LULUS');
            WF_Result.SetText('1');
        }
        else {
            WF_Text.SetText('KUIRI');
            WF_Result.SetText('0');
        }

        popupApprovalComments.Show();
    }

    function cbp_ProceedWithWorkflow_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (LKH_Status.GetText() == '3')
            {
                popupApprovalComments.Hide();
                cbp_Ref.PerformCallback('REF');
                GridAkWorkflow.PerformCallback();

                if (s.cpMailError.toString() == '')
                    WFpopup_Label.SetText('Aliran kerja untuk Laporan Kehilangan ini telah dikemaskini.');
                else
                    WFpopup_Label.SetText('Aliran kerja untuk Laporan Kehilangan ini telah dikemaskini namun terdapat sistem menghadapi masalah ketika menghantar emel notifikasi.<br><br>Masalah: '+s.cpMailError.toString());
                WFpopup.Show();
            }
            
        }
    }

    function WFpopup_BtnOk_Click()
    {
        WFpopup.Hide();

        if (OpenFromMyTask.GetText() == '1')
        { opener.RefreshGrid(); }

        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        PageControl.SetActiveTabIndex(3);
        MainRibbon.SetActiveTabIndex(0);
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Laporan Kehilangan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/LaporanKehilangan.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%">
        <tr>
            <td><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                    <Items>
                        <dx:RibbonButtonItem Name="KEW.PA-1" Size="Large" Text="KEW.PA-1">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
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
	MainRibbon_CommandExecuted(s,e);
}" />
</dx:ASPxRibbon></td>
        </tr>
        <tr>
            <td style="padding-top:10px; width:100%">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:80%; vertical-align:top; text-align:left;">
                            <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" ClientInstanceName="PageControl" EnableClientSideAPI="True">
                                <TabPages>
                                    <dx:TabPage Text="Laporan">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc1:Laporan_Controller ID="Laporan_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Lantikan Penyiasat">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc3:Penyiasat_Controller ID="Penyiasat_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Hasil Siasatan">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc4:HasilSiasatan_Controller ID="HasilSiasatan_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="Aliran Kerja">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <uc5:Tab_AliranKerja_Controller ID="Tab_AliranKerja_Controller1" runat="server" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </td>
                        <td style="width:20%; vertical-align:top; text-align:left; padding-top:43px;">
                            <dx:ASPxCallbackPanel ID="cbp_Ref" runat="server" ClientInstanceName="cbp_Ref" OnCallback="cbp_Ref_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                                <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                            <Items>
                                                <dx:LayoutGroup Caption="Rujukan">
                                                    <Items>
                                                        <dx:LayoutItem Caption="No. Rujukan">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="Ref_RefNumber" runat="server" ClientInstanceName="Ref_RefNumber" CssClass="TextBoxForNoRujukan" EnableClientSideAPI="True" ClientEnabled="False">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Versi">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="Ref_RevNumber" runat="server" ClientInstanceName="Ref_RevNumber" EnableClientSideAPI="True" Width="170px" ClientEnabled="False">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Tarikh Laporan">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxDateEdit ID="Ref_Date" runat="server" ClientInstanceName="Ref_Date" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" ClientEnabled="False">
                                                                    </dx:ASPxDateEdit>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Status">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="Ref_Status" runat="server" ClientInstanceName="Ref_Status" CssClass="TextBoxForStatus" EnableClientSideAPI="True" ClientEnabled="False">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="ProcessId" ShowCaption="False">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="Ref_StatusInt" runat="server" ClientInstanceName="Ref_StatusInt" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="Status" ShowCaption="False">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="Ref_ProcessId" runat="server" ClientInstanceName="Ref_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:LayoutGroup>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" Width="100%">
                                                                <SettingsAutoGeneratedImages ImageHeight="150px" ImageWidth="150px" />
                                                            </dx:ASPxImageSlider>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
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





<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>






<dx:ASPxPopupControl ID="popupSearch" runat="server" AllowDragging="True" ClientInstanceName="popupSearch" EnableClientSideAPI="True" HeaderText="Carian Laporan Kehilangan" MaxHeight="550px" MinHeight="450px" MinWidth="650px" Modal="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridMainSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridMainSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="LKH_ProcessId" Width="100%" OnCustomCallback="GridMainSearch_CustomCallback" OnHtmlDataCellPrepared="GridMainSearch_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="LKH_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Versi" FieldName="LKH_RevNumber" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="5%">
                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="LKH_REfNumber" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_CreatorEmpId" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Laporan" FieldName="LKH_CreatedDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Kehilangan" FieldName="LKH_MissingDate" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Lokasi Kehilangan" FieldName="LKH_MissingLocation" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Faktor Kehilangan" FieldName="LKH_MissingReason" ShowInCustomizationForm="True" VisibleIndex="6" Width="21%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_PoliceRptNumber" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LKH_PolieRptDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_OfficerInchargeEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_OfficerInchargeDesignation" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_OfficerInChargeDesignationType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_SurchargeAction" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LKH_SurchargeDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_DiciplinaryAction" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LKH_DiciplinaryDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_ExistingPrecautionMethods" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_FuturePrecautionMethods" ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_LastModByEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LKH_LastModDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_PostByEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LKH_PostDate" ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LKH_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CreatorPtjId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CreatorPtjName" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Pengadu" FieldName="EmployeeName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <DataItemTemplate> 
                    <dx:ASPxHyperLink ID="EmployeeName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="StatusName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jumlah Aset Hilang" FieldName="ItemCount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="10%">
                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PRV" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_LaporanKehilangan_FindRecords" OnSelecting="SearchDs_Selecting" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="CurrUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="popupApprovalComments" runat="server" AllowDragging="True" ClientInstanceName="popupApprovalComments" HeaderText="Komen Pemeriksa" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="500px">
     <FooterContentTemplate>
         <div style="width:480px; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Teruskan" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	ProceedWithWorkflowLaporanKehilangan();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxCallbackPanel ID="cbp_ProceedWithWorkflow" runat="server" ClientInstanceName="cbp_ProceedWithWorkflow" EnableCallbackAnimation="True" Width="100%" OnCallback="cbp_ProceedWithWorkflow_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
	cbp_ProceedWithWorkflow_EndCallback(s, e);
}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Tindakan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="WF_Text" runat="server" ClientEnabled="False" ClientInstanceName="WF_Text" EnableClientSideAPI="True" Width="100%">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Komen">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxMemo ID="WF_Comment" runat="server" ClientInstanceName="WF_Comment" EnableClientSideAPI="True" Rows="4" Width="100%">
                                        <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="ApproveReject" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="WF_Result" runat="server" ClientInstanceName="WF_Result" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="WFpopup" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="WFpopup" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="WFpopup_Label" runat="server" ClientInstanceName="WFpopup_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="WFpopup_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="WFpopup_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	WFpopup_BtnOk_Click();
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

<dx:ASPxTextBox ID="OpenFromMyTask" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>
 <uc6:UploadDocument_Controller ID="UploadDocument_Controller1" runat="server" />

 