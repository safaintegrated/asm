<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AduanKerosakan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.AduanKerosakan.AduanKerosakan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_Aduan.ascx" tagname="Tab_Aduan" tagprefix="uc1" %>
<%@ Register src="Tab_PegawaiAset.ascx" tagname="Tab_PegawaiAset" tagprefix="uc2" %>
<%@ Register src="Tab_AliranKerja_Controller.ascx" tagname="Tab_AliranKerja_Controller" tagprefix="uc4" %>
<%@ Register src="../../Components/UploadImage/UploadImage_Controller.ascx" tagname="UploadImage_Controller" tagprefix="uc3" %>
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function cbp_ProceedWithWorkflow_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            WFpopup_Label.SetText('Aliran kerja untuk aduan kerosakan ini telah dikemaskini.');
            WFpopup.Show();
            WFpopup_BtnOk.Focus();
        }
    }

    function WFpopup_BtnOk_Click()
    {
        if (OpenFromMyTask.GetText() == '1')
        { opener.RefreshGrid(); }

        window.close();
    }

    function ProceedWithWorkflow() {
        cbp_ProceedWithWorkflow.PerformCallback();
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

    function cbp_AKworkflow_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (s.cpWorkflowCount.toString() == '0')
            { return true; }
            else
            {
                if (MT_WorkflowType.GetText() == '13')
                {
                    ManageMainRibbonUtamaTab('false', 'false', 'false', 'true', 'false', 'false', 'false', 'false', 'false', 'true');
                    TabPA_EditMode.SetText('1');
                    cbp_PA.PerformCallback('NEW');
                    PageControl.SetActiveTabIndex(1);
                }
                else
                {
                    ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
                    MainRibbon.GetItemByName("Lulus").SetEnabled(true);
                    MainRibbon.GetItemByName("Kuiri").SetEnabled(true);
                    MainRibbon.SetActiveTabIndex(3);
                }
            }
        }
    }

    function AduanKerosakanSelected(P)
    {
        PageControl.SetVisible(true);
        LoadingPanel.SetText('Sistem sedang membuka rekod aduan kerosakan yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        AK_ProcessId.SetText(P.toString());
        cbp_TabAduan.PerformCallback('LOAD');       
    }

    function OnPageLoadEvents() {
        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);

        var PegawaiAsetTab = PageControl.GetTab(1);
        PegawaiAsetTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(2);
        AliranKerjaTab.SetVisible(false);

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);

        EnableDisableForm('false');
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
        WorkflowApproveReject('1');
    }

    function KuiriClicked()
    { WorkflowApproveReject('0'); }

    function KemaskiniClicked()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
        MainRibbon.GetItemByName("Gambar").SetEnabled(true);
        EnableDisableForm('true');
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_TabAduan.PerformCallback('ADD');
    }

    function SimpanClicked()
    {        
        if(CheckAssetInvSelected())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod aduan kerosakan anda.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_TabAduan.PerformCallback('SAVE');
        }
    }

    function HantarClicked()
    {
        if (AK_Status.GetText() == '15')
        {
            if (CheckPegawaiAsetConfirmation())
            {
                LoadingPanel.SetText('Sistem sedang menghantar pengesahan anda.  Sila tunggu sebentar..');
                LoadingPanel.Show();
                cbp_PegawaiAsetPosting.PerformCallback();
            }
        }
        else
        {
            EnableDisableForm('true');

            if (CheckAssetInvSelected() && CheckDamageNotes()) {
                LoadingPanel.SetText('Sistem sedang menghantar rekod aduan kerosakan anda.  Sila tunggu sebentar..');
                LoadingPanel.Show();
                cbp_TabAduan.PerformCallback('POST');
            }
        }

    }

    function CheckPegawaiAsetConfirmation()
    {
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

    function CheckAssetInvSelected()
    {
        if (AK_AssetInvRegNumber.GetText() == '')
        {
            popupMsg_Label.SetText('Rekod Aset Alih yang ingin dilaporkan belum dipilih.<br>Sila semak dan cuba sekali lagi');
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
            return false;
        }
        else
            return true;
    }

    function CheckDamageNotes()
    {
        if (AK_DamageNotes.GetText() == '')
        {
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
    {

        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);

        cbp_TabAduan.PerformCallback('CANCEL');

       /*if (Ref_RefProcessId.GetText() == '') {
            cbp_TabAduan.PerformCallback('CANCEL')
        }
        else {
            LoadingPanel.SetText('Sistem sedang memuat semula rekod pemeriksaan yang terakhir disimpan.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp_TabAduan.PerformCallback('LOAD')
        }*/ 
    }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        
        popupSearchAduanKerosakan.SetWidth(screen.width * 0.7);
        popupSearchAduanKerosakan.Show();
        GridSearchAduanKerosakan.PerformCallback();

        /*ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);*/
        
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

    function LampiranClicked()
    { }

    function GambarClicked()
    {
        popupAttachImage.SetWidth(screen.width * 0.7);
        popupAttachImage.Show();
    }

    function ImpotClicked()
    {
        
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

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Aduan Kerosakan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/DamageReport.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="2"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px;">
                <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" AccessibilityCompliant="True" ClientInstanceName="PageControl" ClientVisible="False" EnableClientSideAPI="True">
                    <TabPages>
                        <dx:TabPage Text="Aduan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_Aduan ID="Tab_Aduan1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Pegawai Aset">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Tab_PegawaiAset ID="Tab_PegawaiAset1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc4:Tab_AliranKerja_Controller ID="Tab_AliranKerja_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:46px;">
                <dx:ASPxCallbackPanel ID="cbp_AKRef" runat="server" ClientInstanceName="cbp_AKRef" EnableClientSideAPI="True" OnCallback="cbp_AKRef_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
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
                                                        <dx:ASPxTextBox ID="Ref_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefNumber" CssClass="Reference_ReferenceNumber" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Aduan">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="Ref_RefDate" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefDate" CssClass="Reference_Date" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Status">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefStatus" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefStatus" CssClass="Reference_Status" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefProcessId" runat="server" ClientInstanceName="Ref_RefProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                                <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                                <Paddings Padding="0px" />
                                <Border BorderStyle="None" />
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

<uc3:UploadImage_Controller ID="UploadImage_Controller1" runat="server" />


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






<dx:ASPxPopupControl ID="popupSearchAduanKerosakan" runat="server" AllowDragging="True" ClientInstanceName="popupSearchAduanKerosakan" EnableClientSideAPI="True" HeaderText="Carian Aduan Kerosakan" MaxHeight="550px" MinHeight="450px" MinWidth="650px" Modal="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridSearchAduanKerosakan" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearchAduanKerosakan" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="AK_ProcessId" Width="100%" OnCustomCallback="GridSearchAduanKerosakan_CustomCallback" OnHtmlDataCellPrepared="GridSearchAduanKerosakan_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AK_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Pengadu" FieldName="CreatorName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="CreatorName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="AK_RefNumber" ShowInCustomizationForm="True" VisibleIndex="1" Width="12%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="AK_RefNumber" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>               
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="AK_CreatedDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="StatusName" ShowInCustomizationForm="True" VisibleIndex="7" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Butiran Kerosakan" FieldName="AK_DamageNotes" ShowInCustomizationForm="True" VisibleIndex="6" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftran Aset Alih" FieldName="AK_AssetInvRegNumber" ShowInCustomizationForm="True" VisibleIndex="4" Width="12%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan Aset Alih" FieldName="AK_AssetInvDesc" ShowInCustomizationForm="True" VisibleIndex="5" Width="18%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SELECT [AK_ProcessId], [CreatorName], [AK_RefNumber], [AK_CreatedDate], [StatusName], [AK_DamageNotes], [AK_AssetInvRegNumber], [AK_AssetInvDesc] FROM [V_AduanKerosakan] ORDER BY [AK_AssetInvRegNumber]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxTextBox ID="OpenFromMyTask" runat="server" ClientInstanceName="OpenFromMyTask" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>








<dx:ASPxCallbackPanel ID="cbp_AKworkflow" runat="server" ClientInstanceName="cbp_AKworkflow" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_AKworkflow_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_AKworkflow_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxTextBox ID="MT_WorkflowType" runat="server" ClientInstanceName="MT_WorkflowType" EnableClientSideAPI="True" Width="170px">
    </dx:ASPxTextBox>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>









<dx:ASPxPopupControl ID="popupApprovalComments" runat="server" AllowDragging="True" ClientInstanceName="popupApprovalComments" HeaderText="Komen Pemeriksa" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="500px">
     <FooterContentTemplate>
         <div style="width:480px; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Teruskan" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	ProceedWithWorkflow();
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





        





    









