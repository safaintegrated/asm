<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TerimaanBarang_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.TerimaanBarang_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_TerimaanBarang_Controller.ascx" tagname="Tab_TerimaanBarang_Controller" tagprefix="uc1" %>
<%@ Register src="Tab_SenaraiSemak_Controller.ascx" tagname="Tab_SenaraiSemak_Controller" tagprefix="uc2" %>
<%@ Register src="Tab_AliranKerja_Controller.ascx" tagname="Tab_AliranKerja_Controller" tagprefix="uc3" %>
<%@ Register src="../PurchaseRequest/PermohonanBelian_TabItem.ascx" tagname="permohonanbelian_tabitem" tagprefix="uc2" %>
<%@ Register src="../PurchaseRequest/PermohonanBelian_PrHeader.ascx" tagname="permohonanbelian_prheader" tagprefix="uc1" %>
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script src="Js_TerimaanBarang.js" type="text/javascript"></script>

<script>
    function ProceedWithWorkflow()
    {
        LoadingPanel.SetText('Sistem sedang mengemaskini aliran kerja rekod terimaan barang.  Sila tunggu..')
        LoadingPanel.Show();
        cbp_BeforeApproval.PerformCallback();
    }

    function cbp_BeforeApproval_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() == 'OK')
            cbp_ProceedWithWorkflow.PerformCallback();
        else
        {
            LoadingPanel.Hide();
            popupMsg_Label.SetText('Terdapat proses kelulusan Terimaan Barang yang lain sedang berlansung.<br>Sila cuba sekali lagi sebentar lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function cbp_ProceedWithWorkflow_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            WFpopup_Label.SetText('Aliran kerja untuk permohonan pembelian ini telah dikemaskini.');
            WFpopup.Show();
            WFpopup_BtnOk.Focus();
        }
    }

    function WFpopup_BtnOk_Click() {
        if (OpenFromMyTask.GetText() == '1')
        { opener.RefreshGrid(); }

        window.close();
    }

    function LoadSelectedGrn(P, R)
    {
        OnPageLoadEvents();
        HeaderMode.SetText('2');
        GRNH_Revision.SetText(R.toString());
        GRNH_ProcessId.SetText(P.toString());
        GRNH_PrNumber.GetGridView().Refresh();
        cbp_GRN.PerformCallback('LOAD');
    }

    function cbp_Workflow_EndCallback(s, e) {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
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


<style type="text/css">
    .auto-style2 {
        width: 100%;
    }
</style>


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Terimaan Barang" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/GRN.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <table class="auto-style2">
                            <tr>
                                <td>
                                    <dx:ASPxRibbon ID="MainRibbon" runat="server" ClientInstanceName="MainRibbon" ShowFileTab="False" Width="100%">
                                        <Tabs>
                                            <dx:RibbonTab Name="Utama" Text="Utama">
                                                <Groups>
                                                    <dx:RibbonGroup Name="Pengurusan Rekod" Text="Pengurusan Rekod">
                                                        <Items>
                                                            <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                                                                <LargeImage IconID="actions_add_32x32">
                                                                </LargeImage>
                                                            </dx:RibbonButtonItem>
                                                            <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                                                                <Items>
                                                                    <dx:RibbonDropDownButtonItem Name="PrintGRN" Text="Cetak Terimaan Barang Ini">
                                                                    </dx:RibbonDropDownButtonItem>
                                                                    <dx:RibbonDropDownButtonItem Name="PrintList" Text="Cetak Senarai Terimaan Barang">
                                                                    </dx:RibbonDropDownButtonItem>
                                                                </Items>
                                                                <LargeImage IconID="print_print_32x32">
                                                                </LargeImage>
                                                            </dx:RibbonDropDownButtonItem>
                                                            <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                                                                <LargeImage IconID="find_find_32x32">
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
                                                            <dx:RibbonButtonItem Name="Gambar" Size="Large" Text="Gambar">
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxCallbackPanel ID="cbp_Detail" runat="server" Width="100%" ClientInstanceName="cbp_Detail" EnableClientSideAPI="True">
                                        <PanelCollection>
                                            <dx:PanelContent runat="server">
                                                <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" ColCount="3" Width="100%">
                                                    <Items>
                                                        <dx:LayoutItem Caption="Nama Pegawai" Width="60%">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="EmployeeName" runat="server" Width="100%" ClientInstanceName="EmployeeName">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                        <dx:EmptyLayoutItem>
                                                        </dx:EmptyLayoutItem>
                                                        <dx:EmptyLayoutItem>
                                                        </dx:EmptyLayoutItem>
                                                        <dx:LayoutItem Caption="Pusat Tanggungjawab">
                                                            <LayoutItemNestedControlCollection>
                                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                                    <dx:ASPxTextBox ID="ASPxFormLayout4_E2" runat="server" Width="100%">
                                                                    </dx:ASPxTextBox>
                                                                </dx:LayoutItemNestedControlContainer>
                                                            </LayoutItemNestedControlCollection>
                                                        </dx:LayoutItem>
                                                    </Items>
                                                </dx:ASPxFormLayout>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxCallbackPanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="GridGrnLookup" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridGrnLookup" DataSourceID="GrnLookupDs" OnCustomCallback="GridGrnLookup_CustomCallback" OnHtmlDataCellPrepared="GridGrnLookup_HtmlDataCellPrepared" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_ProcessId" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_Revision" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Versi">
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Ptj_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Pusat Tanggungjawab">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_GrnNumber" ShowInCustomizationForm="True" VisibleIndex="2" Caption="No. GRN">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_PrNumber" ShowInCustomizationForm="True" VisibleIndex="4" Caption="No. Pesanan Belian">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                <DataItemTemplate>
                                                    <dx:ASPxHyperLink ID="GRNH_PrNumber" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                                    </dx:ASPxHyperLink>
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_SetVen_Name" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Pembekal">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="GRNH_DeliveryDate" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Tarikh Terimaan">
                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn FieldName="Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Status">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
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
                                    <asp:SqlDataSource ID="GrnLookupDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_GRN_FindRecord" SelectCommandType="StoredProcedure" OnSelecting="GrnLookupDs_Selecting">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
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


<dx:ASPxPopupControl ID="popupLookupGRN" runat="server" AllowDragging="True" ClientInstanceName="popupLookupGRN" CloseAnimationType="Fade" HeaderText="Carian Terimaan Barang" MaxHeight="600px" MinHeight="450px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" ShowPageScrollbarWhenModal="True" Width="1000px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ClientSideEvents Closing="function(s, e) {
	popupLookupGRN.SetContentUrl('about:blank');
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
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





    <dx:ASPxTextBox runat="server" Width="170px" ClientInstanceName="OpenFromMyTask" EnableClientSideAPI="True" ID="OpenFromMyTask" ClientVisible="False"></dx:ASPxTextBox>

        








<dx:ASPxCallbackPanel ID="cbp_BeforeApproval" runat="server" ClientInstanceName="cbp_BeforeApproval" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_BeforeApproval_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_BeforeApproval_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


    
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>

<dx:ASPxPopupControl ID="PopupGRN" runat="server" ClientInstanceName="PopupGRN" CloseAction="CloseButton" EnableClientSideAPI="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" MinHeight="600px" MinWidth="800px" Modal="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="DefaultMainContainerTable">
        <tr>
            <td colspan="2">
                <dx:ASPxMenu runat="server" ClientInstanceName="Toolbar_PopupGRN" EnableClientSideAPI="True" Width="100%" ID="Toolbar_PopupGRN">
                    <ClientSideEvents ItemClick="function(s, e) {
                        Toolbar_PopupPr_ItemClick(s, e);
                        }"></ClientSideEvents>
                    <Items>
                        <dx:MenuItem Name="btnEdit" Text="Kemaskini">
                            <Image IconID="edit_edit_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSubmit" Text="Hantar">
                            <Image IconID="mail_send_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnDelete" Text="Padam">
                            <Image IconID="actions_cancel_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnCancel" Text="Batal ">
                            <Image IconID="edit_delete_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnPrint" Text="Cetak">
                            <Image IconID="print_print_32x32"></Image>

                        </dx:MenuItem>
                        <dx:MenuItem Name="btnAudit" Text="Audit">

                        </dx:MenuItem>

                    </Items>

                </dx:ASPxMenu>

            </td>
        </tr>
        <tr>
            <td style="padding: 10px;">
                <dx:ASPxPageControl ID="PageControl_PopupGRN" runat="server" ActiveTabIndex="0" ClientInstanceName="PageControl_PopupGRN" EnableClientSideAPI="True" Width="100%">
                    <TabPages>
                        <dx:TabPage Text="Utama">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc1:Tab_TerimaanBarang_Controller ID="Tab_TerimaanBarang_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Senarai Semak">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc2:Tab_SenaraiSemak_Controller ID="Tab_SenaraiSemak_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Aliran Kerja">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <uc3:Tab_AliranKerja_Controller ID="Tab_AliranKerja_Controller1" runat="server" />
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>

            </td>
            <td style="padding-top:10px; vertical-align: top; text-align: left; width: 20%;">
                <dx:ASPxCallbackPanel ID="cbp_GrnRef" runat="server" ClientInstanceName="cbp_GrnRef" EnableClientSideAPI="True" OnCallback="cbp_GrnRef_Callback" ShowLoadingPanel="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Rujukan" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="No. GRN" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_GrnNumber" runat="server" ClientEnabled="False" CssClass="Reference_ReferenceNumber">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Versi">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_GrnVersion" runat="server" ClientEnabled="False" ClientInstanceName="Ref_GrnVersion" CssClass="Reference_Version" EnableClientSideAPI="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh GRN" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="Ref_GrnCreateDate" runat="server" ClientEnabled="False" CssClass="Reference_Date">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Status" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_GrnStatusText" runat="server" ClientEnabled="False" CssClass="Reference_Status">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="Ref_GrnProcessId" runat="server" ClientInstanceName="Ref_GrnProcessId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
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
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>






        








