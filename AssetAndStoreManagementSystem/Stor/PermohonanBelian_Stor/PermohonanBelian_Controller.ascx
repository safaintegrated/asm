﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.PermohonanBelian_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_Permohonan.ascx" tagname="Tab_Permohonan" tagprefix="uc1" %>
<%@ Register src="Tab_AliranKerja_Controller.ascx" tagname="Tab_AliranKerja_Controller" tagprefix="uc2" %>
<%@ Register src="Tab_SenaraiSemak_Controller.ascx" tagname="Tab_SenaraiSemak_Controller" tagprefix="uc3" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script src="Js_PermohonanBelian.js"></script>
<script>
    function cbp_EditPr_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != "")
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            //items
            PRI_Revision.SetText(s.cpRev.toString());
            TabItemDetail_EditMode.SetText('1');

            var PrItemDetailsTab = PR_PageControl.GetTab(1);
            PrItemDetailsTab.SetVisible(false);
            PR_PageControl.SetActiveTabIndex(0);

            //reference section
            PRH_Revision.SetText(s.cpRev.toString());
            cbp_PrRef.PerformCallback();

            //header
            TabPermohonan_Revision.SetText(s.cpRev.toString());
            cbp_Header.PerformCallback('LOAD');

            //listing
            TabItemListing_PrRevision.SetText(s.cpRev.toString());
            TabItemListing_EditMode.SetText('1');
            GridPRItemListing.PerformCallback();

            PageControl.SetActiveTabIndex(0);
            PageControl.SetVisible(true);
        }
    }
    function cbp_ProceedWithWorkflow_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            WFpopup_Label.SetText('Aliran kerja untuk permohonan pembelian ini telah dikemaskini.');
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

    function WorkflowApproveReject(ApproveReject)
    {
        WF_Text.SetText('');
        WF_Result.SetText('');
        WF_Comment.SetText('');

        if (ApproveReject.toString() == '1')
        {
            WF_Text.SetText('LULUS');
            WF_Result.SetText('1');
        }
        else
        {
            WF_Text.SetText('KUIRI');
            WF_Result.SetText('0');
        }

        popupApprovalComments.Show();
    }

    function ProceedWithWorkflow()
    {
        cbp_ProceedWithWorkflow.PerformCallback();
    }

    function LoadSelectedPr(ProcessId, Revision)
    {
        //items
        PRI_Revision.SetText(Revision.toString());
        PRI_ProcessId.SetText(ProcessId.toString());
        TabItemDetail_EditMode.SetText('0');

        //reference section
        PRH_Revision.SetText(Revision.toString());
        PRH_ProcessId.SetText(ProcessId.toString());
        cbp_PrRef.PerformCallback();

        //header
        TabPermohonan_Revision.SetText(Revision.toString());
        TabPermohonan_ProcessId.SetText(ProcessId.toString());
        cbp_Header.PerformCallback('LOAD');

        //listing
        TabItemListing_PRProcessId.SetText(ProcessId.toString());
        TabItemListing_PrRevision.SetText(Revision.toString());
        TabItemListing_EditMode.SetText('0');
        GridPRItemListing.PerformCallback();

        //diary
        Wf_ProcessId.SetText(ProcessId.toString());
        GridPrWorkflow.PerformCallback();

        //checklist
        chkList_ProcessId.SetText(ProcessId.toString());
        cbp_PR_Checklist.PerformCallback('LOAD');

        popupLookupPr.Hide();

        PageControl.SetActiveTabIndex(0);
        PageControl.SetVisible(true);
    }

    function cbp_PrRef_EndCallback(s, e)
    {
        if (PRH_Status.GetText() == '2')
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        else if (PRH_Status.GetText() == '3' || PRH_Status.GetText() == '5' || PRH_Status.GetText() == '7')
            cbp_Workflow.PerformCallback();
        else if(PRH_Status.GetText() == '4' || PRH_Status.GetText() == '6' || PRH_Status.GetText() == '8')
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
    }

    function cbp_Workflow_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (s.cpWorkflowCount.toString() == '0')
            { ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true'); }
            else
            {
                ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'true');
                MainRibbon.GetItemByName("Lulus").SetEnabled(true);
                MainRibbon.GetItemByName("Kuiri").SetEnabled(true);
                MainRibbon.GetItemByName("Lampiran").SetEnabled(true);
                MainRibbon.SetActiveTabIndex(3);
            }
        }
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Permohonan Belian" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Belian.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutItem ColSpan="2" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
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
                            <LargeImage IconID="actions_cancel_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                       <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <Items>
                                <dx:RibbonDropDownButtonItem Name="PrintPr" Text="Cetak Permohonan Belian Ini">
                                </dx:RibbonDropDownButtonItem>
                                <dx:RibbonDropDownButtonItem Name="PrintList" Text="Cetak Senarai Permohonan Belian">
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
        <dx:RibbonTab Name="Lampiran" Text="Muatnaik">
            <Groups>
                <dx:RibbonGroup Name="Muatnaik" Text="">
                    <Items>
                        <dx:RibbonButtonItem Name="Lampiran" Size="Large" Text="Lampiran">
                            <LargeImage IconID="content_image_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Size="Large" Text="Gambar" Name="Gambar">
                            <LargeImage IconID="mail_attachment_32x32">
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
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="80%" CssClass="MainFormSecondRowLeftColumnAddTopPadding">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" CssClass="MainFormSecondRowLeftColumnAddTopPadding">
                        <dx:ASPxPageControl ID="PageControl" runat="server" ActiveTabIndex="0" Width="100%" AccessibilityCompliant="True" ClientInstanceName="PageControl" ClientVisible="False" EnableClientSideAPI="True" OnActiveTabChanged="PageControl_ActiveTabChanged">
                            <TabPages>
                                <dx:TabPage Text="Permohonan">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <uc1:Tab_Permohonan ID="Tab_Permohonan1" runat="server" />
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Senarai Semak">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                                <uc3:Tab_SenaraiSemak_Controller ID="Tab_SenaraiSemak_Controller1" runat="server" />
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Aliran Kerja">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                                <uc2:Tab_AliranKerja_Controller ID="Tab_AliranKerja_Controller1" runat="server" />
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                            <Paddings Padding="0px" />
                        </dx:ASPxPageControl>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="20%" CssClass="MainFormSecondRowRightColumnAddTopPadding">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" CssClass="MainFormSecondRowRightColumnAddTopPadding">
                        <dx:ASPxCallbackPanel ID="cbp_PrRef" runat="server" ClientInstanceName="cbp_PrRef" EnableCallbackAnimation="True" OnCallback="cbp_PrRef_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

                            <ClientSideEvents EndCallback="function(s, e) {
	cbp_PrRef_EndCallback(s, e);
}" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="Rujukan" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem Caption="No. Permohonan" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="PRH_PRnumber" runat="server" ClientEnabled="False" ClientInstanceName="PRH_PRnumber" CssClass="Reference_ReferenceNumber" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Versi">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="PRH_Revision" runat="server" ClientEnabled="False" ClientInstanceName="PRH_Revision" EnableClientSideAPI="True" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Permohonan" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="PRH_SubmissionDate" runat="server" ClientEnabled="False" ClientInstanceName="PRH_SubmissionDate" CssClass="Reference_Date" EnableClientSideAPI="True">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Status" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout2_E2" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="PRH_ProcessId" runat="server" ClientInstanceName="PRH_ProcessId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="PRH_Status" runat="server" ClientInstanceName="PRH_Status" ClientVisible="False" Width="170px">
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
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxCallbackPanel ID="cbp_AddNewPR" runat="server" ClientInstanceName="cbp_AddNewPR" ClientVisible="False" OnCallback="cbp_AddNewPR_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_AddNewPR_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


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



<dx:ASPxPopupControl ID="popupAttachment" runat="server" AllowDragging="True" ClientInstanceName="popupAttachment" EnableClientSideAPI="True" HeaderText="Muatnaik &amp; Senarai Lampiran" Width="800px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" CssClass="AppFont" MaxHeight="500px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" Height="300px" ShowFooter="True" Modal="True">
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:350px; float:left; padding:8px 8px 8px 4px; margin:0">
            <dx:ASPxButton ID="ASPxButton8" runat="server" AutoPostBack="False" Text="Padam" Width="100px">
            </dx:ASPxButton>
            &nbsp;&nbsp;&nbsp;<dx:ASPxButton ID="ASPxButton9" runat="server" AutoPostBack="False" Text="Buka" Width="100px">
            </dx:ASPxButton>
            &nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton10" runat="server" AutoPostBack="False" Text="Info" Width="100px">
                <ClientSideEvents Click="function(s, e) {
	PopupAttachmentInfo.Show();
}" />
            </dx:ASPxButton>
        </div>
         <div style="width:100px; float:right; padding:8px 0px 8px 8px; text-align:right; margin:0">
             <dx:ASPxButton ID="ASPxButton11" runat="server" AutoPostBack="False" Text="Tutup" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupAttachment.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="LAMPIRAN (0)" Width="100%" CssClass="AppFont">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="width:100%; padding:4px 4px 4px 4px;">
                            <dx:ASPxUploadControl ID="PRUpload" runat="server" ShowClearFileSelectionButton="False" ShowProgressPanel="True" UploadMode="Auto" Width="100%" ClientInstanceName="PRUpload" OnFileUploadComplete="PRUpload_FileUploadComplete">
                                <ClientSideEvents FileUploadComplete="function(s, e) {
	PRUpload_FileUploadComplete(s, e);
}" TextChanged="function(s, e) {
	PRUpload.Upload();
}" />
                                <BrowseButton Text="Klik di sini untuk memuatnaik fail anda">
                                </BrowseButton>
                            </dx:ASPxUploadControl>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%; padding:4px 4px 4px 4px;">
                            <dx:ASPxGridView ID="AttachmentGrid" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="AttachmentGrid" DataSourceID="UploadManagerDs" EnableCallbackAnimation="True" KeyFieldName="RowId">
                                <ClientSideEvents EndCallback="function(s, e) {
	AttachmentGrid_EndCallback();
}" />
                                <Columns>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" FieldName="RowId" ReadOnly="True" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="2" FieldName="TransId" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="3" FieldName="ProcessId" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="4" Width="5%" FieldName="FileType" Caption="Fail">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Fail" ShowInCustomizationForm="True" VisibleIndex="5" Width="30%" FieldName="UserFileName">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SystemFileName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="UploadedDate" ShowInCustomizationForm="True" VisibleIndex="7" Width="15%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                        </PropertiesDateEdit>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="Notes" ShowInCustomizationForm="True" VisibleIndex="8" Width="45%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="5%">
                                    </dx:GridViewCommandColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsLoadingPanel Mode="Disabled" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Styles>
                                    <AlternatingRow Enabled="True">
                                    </AlternatingRow>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="UploadManagerDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SELECT * FROM [UploadManager] WHERE (([ProcessId] = @ProcessId) AND ([TransId] = @TransId)) ORDER BY [UploadedDate] DESC" OnSelecting="UploadManagerDs_Selecting">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="xxx" Name="ProcessId" Type="String" />
                                    <asp:Parameter DefaultValue="0" Name="TransId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="popupInvalidAttachment" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupInvalidAttachment" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol2" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:ASPxLabel runat="server" EncodeHtml="False" ClientInstanceName="popupInvalidAttachment_Label" EnableClientSideAPI="True" ID="popupInvalidAttachment_Label" Text="Muatnaik anda telah gagal disebabkan satu atau kesemua faktor berikut;<br><br>1. Saiz fail yang dipilih melebihi 4Mb<br>2. Jenis fail yang dipilih tidak dibenarkan<br><br>Untuk teruskan, sila pilih fail yang lain."></dx:ASPxLabel>

            </td>
        </tr>

        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%;">&nbsp;</td>
                        <td style="width:30%;">
                            <dx:aspxbutton ID="popupInvalidAttachment_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupInvalidAttachment_BtnOk" Text="Ok" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	CloseAttachmentErrorPopup();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%;">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="popupLookupPr" runat="server" AllowDragging="True" ClientInstanceName="popupLookupPr" CloseAnimationType="Fade" HeaderText="Carian Permohonan Pembelian" MaxHeight="600px" MinHeight="450px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" Width="1000px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxCallbackPanel ID="cbp_Workflow" runat="server" ClientInstanceName="cbp_Workflow" OnCallback="cbp_Workflow_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Workflow_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxTextBox ID="MT_WorkflowType" ClientInstanceName="MT_WorkflowType" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="False">
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


    <dx:ASPxTextBox runat="server" Width="170px" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="True" ID="OpenFromMyTask" ClientVisible="False"></dx:ASPxTextBox>

        


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





        


<dx:ASPxCallbackPanel ID="cbp_EditPr" runat="server" ClientInstanceName="cbp_EditPr" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_EditPr_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EditPr_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>






        


