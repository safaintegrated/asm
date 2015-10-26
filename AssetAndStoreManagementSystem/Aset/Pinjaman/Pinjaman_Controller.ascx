<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pinjaman_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Pinjaman_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="Tab_Permohonan.ascx" tagname="Tab_Permohonan" tagprefix="uc1" %>
<%@ Register src="Tab_Pengeluaran.ascx" tagname="Tab_Pengeluaran" tagprefix="uc4" %>
<%@ Register src="Tab_Pemulangan.ascx" tagname="Tab_Pemulangan" tagprefix="uc5" %>
<%@ Register src="Tab_AliranKerja_Controller.ascx" tagname="Tab_AliranKerja_Controller" tagprefix="uc6" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function cbpPegawaiAssetApproval_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            //hide approver comment popup
            popupApprovalComments.Hide();

            //disable lulus and kuiri ribbon button
            MainRibbon.GetItemByName("Lulus").SetEnabled(false);
            MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
            MainRibbon.SetActiveTabIndex(0);

            //update aliran kerja
            GridPrWorkflow.PerformCallback();

            if (OpenFromMyTask.GetText() == 1)
            {
                opener.RefreshGrid(); 
            }

            if (WF_Result.GetText() == '1')
            {
                var PengeluaranTab = PageControl.GetTab(1);
                PengeluaranTab.SetVisible(true);
                PageControl.SetActiveTabIndex(1);

                //prepare pengeluaran listing
                txtWithdrawProcessId.SetText(Ref_RefProcessId.GetText());
                txtWithdrawRev.SetText(Ref_RefRevNumber.GetText());
                GridWithdrawalList.PerformCallback();
            }
            else
            {

            }

            popupMsg_Label.SetText('Aliran kerja untuk permohonan pinjaman telah dikemaskini.');
            popupMsg.Show();
        }
    }

    function ProceedWithWorkflow()
    {
        LoadingPanel.SetText('Sistem sedang mengemaskini aliran kerja permohonan pinjaman ini.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        cbpPegawaiAssetApproval.PerformCallback();
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

    function OnPageLoadEvents() 
    {
        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);

        var PengeluaranTab = PageControl.GetTab(1);
        PengeluaranTab.SetVisible(false);

        var PemulanganTab = PageControl.GetTab(2);
        PemulanganTab.SetVisible(false);

        var AliranKerjaTab = PageControl.GetTab(3);
        AliranKerjaTab.SetVisible(false);
        
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);

        EnableDisableHeaderForm('false');
    }

    function PageLoadWithProcessId(ProcessId, Revision)
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        PP_Selected(ProcessId.toString(), Revision.toString());
    }

    function PP_Selected(ProcessId,Revision)
    {
        PP_ProcessId.SetText(ProcessId.toString());
        PP_Revision.SetText(Revision.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod permohonan pinjaman yang dipilih.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        cbp_Permohonan.PerformCallback('LOAD');
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
    { WorkflowApproveReject('1'); }

    function KuiriClicked()
    { WorkflowApproveReject('0'); }

    function KemaskiniClicked()
    {
        if (PP_Status.GetText() == 2) {
            EnableDisableHeaderForm('true');
            ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'false');
        }
        else
        {
            //for +1 revision
            
        }
       
    }

    function TambahClicked()
    {
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Permohonan.PerformCallback('ADD');
    }

    function SimpanClicked()
    {
        if (CheckPurpose()) {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan pinjaman anda.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp_Permohonan.PerformCallback('SAVE');
        }
    
    }

    function HantarClicked()
    {
        if (CheckPurpose() && CheckGridList())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod permohonan pinjaman anda.  Sila tunggu sebentar..')
            LoadingPanel.Show();
            cbp_Permohonan.PerformCallback('POST')
        }      
    }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupLookupPP.SetWidth(screen.width * 0.7);
        popupLookupPP.Show();
        GridSearch.PerformCallback();
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

    function LampiranClicked()
    { }

    function GambarClicked()
    { }

    function ImpotClicked()
    { }

    function CheckPurpose()
    {
        if (PP_Purpose.GetText() == '')
        {
            popupMsg_Label.SetText('Tujuan pinjaman diperlukan.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;            
        }
        else
            return true;
    }

    function CheckGridList()
    {
        if (GridList.GetVisibleRowsOnPage() == 0)
        {
            popupMsg_Label.SetText('Anda belum memilih mana-mana aset alih yang hendak dipinjam.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Permohonan Pinjaman" ShowCollapseButton="true" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Pinjaman.png">
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
</dx:ASPxRibbon></td>
        </tr>
        <tr>
            <td style="width:80%; padding-top:10px; vertical-align:top; text-align:left; padding-right:5px;">
                <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" AccessibilityCompliant="True" ClientInstanceName="PageControl">
                    <TabPages>
                        <dx:TabPage Text="Permohonan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_Permohonan ID="Tab_Permohonan1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>                        
                        <dx:TabPage Text="Pengeluaran">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc4:Tab_Pengeluaran ID="Tab_Pengeluaran1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Pemulangan">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc5:Tab_Pemulangan ID="Tab_Pemulangan1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc6:Tab_AliranKerja_Controller ID="Tab_AliranKerja_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
            </td>
            <td style="width:20%; padding-top:46px; vertical-align:top; text-align:left; padding-left:5px;">
                <dx:ASPxCallbackPanel ID="cbp_Ref" runat="server" ClientInstanceName="cbp_Ref" EnableCallbackAnimation="True" OnCallback="cbp_Ref_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ViewStateMode="Disabled" Width="96%">
                                <Items>
                                    <dx:LayoutGroup Caption="Rujukan" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="No. Rujukan" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefNumber" CssClass="Reference_ReferenceNumber" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Versi">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefRevNumber" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefRevNumber" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh Permohonan" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="Ref_RefDate" runat="server" ClientEnabled="False" ClientInstanceName="Ref_RefDate" CssClass="Reference_Date" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Status" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_RefStatusText" runat="server" ClientInstanceName="Ref_RefStatusText" EnableClientSideAPI="True" ClientEnabled="False" CssClass="Reference_Status">
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

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
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
<dx:ASPxPopupControl ID="popupLookupPP" runat="server" AllowDragging="True" ClientInstanceName="popupLookupPP" CloseAnimationType="Fade" HeaderText="Carian Permohonan Pinjaman" MaxHeight="650px" MinHeight="450px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" MinWidth="650px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="PP_ProcessId" Width="100%" OnCustomCallback="GridSearch_CustomCallback" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="PP_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PP_Revision" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Versi" Width="5%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PP_RefNumber" ShowInCustomizationForm="True" VisibleIndex="0" Caption="No. Rujukan" Width="12%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PP_CreatedByEmpId" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nama Pemohon" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Pusat Tanggungjawab" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeEmail" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Caption="No. Telefon" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PP_LastModDate" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Tarikh Kemaskini Terakhir" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PP_Purpose" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Tujuan" Width="20%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="PP_Purpose"  EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PP_Status" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PP_AssetOfficerSystemId_Approval" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PP_ApprovalDate" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PP_AssetOfficerSystemId_TakeOut" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PP_TakeOutDate" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="PP_AssetOfficerSystemId_Return" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PP_ReturnDate" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="StatusText" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Status" Width="15%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CreatorPtjId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18" Visible="False">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_PermohonanPinjaman_FindRecord" SelectCommandType="StoredProcedure" OnSelecting="SearchDs_Selecting">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxTextBox ID="OpenFromMyTask" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
<dx:ASPxCallbackPanel ID="cbpPegawaiAssetApproval" ClientInstanceName="cbpPegawaiAssetApproval" ClientVisible="False"  runat="server" Width="200px" OnCallback="cbpPegawaiAssetApproval_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbpPegawaiAssetApproval_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
