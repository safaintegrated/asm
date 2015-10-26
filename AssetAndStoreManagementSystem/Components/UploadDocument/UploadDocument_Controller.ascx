<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UploadDocument_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Components.UploadDocument.UploadDocument_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
 


<script>
    function DownloadFile()
    {
        if (popupAttachDocument_CallerName.GetText() == 'LAPORAN KEROSAKAN')
        {
            window.open('../../DocumentViewer/Index.ashx?RowId=' + RowId.GetText())
        }
    }

    function OpenFile() {
        if (popupAttachDocument_CallerName.GetText() == 'LAPORAN KEROSAKAN') {
            window.open('../../DocumentViewer/Viewer.aspx?RowId=' + RowId.GetText())
        }
    }

    function popupAttachDocument_Closing()
    {
        if (popupAttachDocument_CallerName.GetText() == 'ADUAN_KEROSAKAN')
        { cbp_Slider.PerformCallback(); }
    }

    function BeforeDeleteDocuments()
    {
        GridDocumentListing.GetSelectedFieldValues('RowId', ProceedDeletingDocuments);
    }

    function ProceedDeletingDocuments(result)
    {
        if (result.length > 0)
        {
            var List = '';

            for (var x = 0; x < result.length; x++)
            {
                if (List == '')
                    List = result[x].toString();
                else
                {
                    List = List + '-' + result[x].toString();
                }
            }
            cbp_popupAttachDocument.PerformCallback('3*' + List.toString());
        }
        else
        {
            popupMsg_Label.SetText('Tiada gambar yang telah dipilih.<br>Anda boleh memilih lebih daripada satu gambar untuk dipadamkan.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function cbp_UploadDocument_Loader_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() == '') {
            PopupAttachmentInfo.Show();
        }
        else {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function ShowDocumentInfo()
    {
        if (GridDocumentListing.GetFocusedRowIndex() != -1)
            GridDocumentListing.GetRowValues(GridDocumentListing.GetFocusedRowIndex(), 'RowId', ProceedDocumentInfo);
        else
        {
            popupMsg_Label.SetText('Pilih salah satu daripada senarai gambar yang telah dimuatnaik terlebih dahulu.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function ProceedDocumentInfo(Values)
    {
        RowId.SetText(Values.toString());        
        cbp_UploadDocument_Loader.PerformCallback();
    }

    function GridDocumentListing_EndCallback(s, e)
    {
        popupAttachDocument.SetHeaderText('Muatnaik Dokument (Jumlah Dokument Dimuatnaik: ' + s.cpTotalRows.toString() + ')');
    }

    function DocumentUploader_FileUploadComplete(s, e)
    {
        if (e.isValid) {
            if (s.cpErrMsg.toString() == '')
            {
                popupAttachDocument_UserFileName.SetText(s.cppopupAttachDocument_UserFileName.toString());
                popupAttachDocument_SystemFileName.SetText(s.cppopupAttachDocument_SystemFileName.toString());
                cbp_popupAttachDocument.PerformCallback('1');
            }
            else
            {
                popupMsg_Label.SetText(s.cpErrMsg.toString());
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
        }
        else {
            popupInvalidAttachment.Show();
        }
    }

    function cbp_popupAttachDocument_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() == '')
        {
            PopupAttachmentInfo.Hide();
            GridDocumentListing.PerformCallback();
        }
        else
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
</script>
<dx:ASPxPopupControl ID="popupAttachDocument" runat="server" AllowDragging="True" ClientInstanceName="popupAttachDocument" EnableClientSideAPI="True" HeaderText="Muatnaik Dokument" Width="900px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" MaxHeight="500px" Height="300px" ShowFooter="True" MinHeight="300px" MinWidth="700px">
    <ClientSideEvents PopUp="function(s, e) {
	GridDocumentListing.PerformCallback();
}" Closing="function(s, e) {
	popupAttachDocument_Closing();
}" />
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:350px; float:left; padding:11px 0px 11px 0px; margin:0">
            <dx:ASPxButton ID="ASPxButton8" runat="server" AutoPostBack="False" Text="Padam" Width="100px" Theme="SoftOrange">
                <ClientSideEvents Click="function(s, e) {
	BeforeDeleteDocuments();
}" />
            </dx:ASPxButton>           
            &nbsp;&nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton10" runat="server" AutoPostBack="False" Text="Info" Width="100px" Theme="SoftOrange">
                <ClientSideEvents Click="function(s, e) {
	ShowDocumentInfo();
}" />
            </dx:ASPxButton>
        </div>
         <div style="width:100px; float:right; padding:8px 0px 8px 8px; text-align:right; margin:0">
             <dx:ASPxButton ID="ASPxButton11" runat="server" AutoPostBack="False" Text="Tutup" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupAttachDocument.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%;">
        <tr>
            <td style="width:100%; padding:4px 4px 4px 4px;">
                <dx:ASPxUploadControl ID="DocumentUploader" runat="server" ClientInstanceName="DocumentUploader" OnFileUploadComplete="DocumentUploader_FileUploadComplete" ShowClearFileSelectionButton="False" ShowProgressPanel="True" UploadMode="Auto" Width="100%">
                    <ValidationSettings AllowedFileExtensions=".pdf, .doc, .docx, .zip, .rar, .7z, .xls, .xlsx" GeneralErrorText="Sistem telah menghadapi masalah teknikal untuk memuatnaik imej" MaxFileSize="4194304" MaxFileSizeErrorText="Saiz fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." MultiSelectionErrorText="Saiz fail-fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." NotAllowedFileExtensionErrorText="Jenis fail yang dipilih tidak sah.  Sila pilih fail yang lain.">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) {
	DocumentUploader_FileUploadComplete(s, e);
}" TextChanged="function(s, e) {
	DocumentUploader.Upload();
}" />
                    <BrowseButton Text="Pilih Fail Dokumen..">
                    </BrowseButton>
                    <AdvancedModeSettings>
                        <FileListItemStyle CssClass="pending dxucFileListItem">
                        </FileListItemStyle>
                    </AdvancedModeSettings>
                </dx:ASPxUploadControl>
            </td>
        </tr>
        <tr>
            <td style="width:100%; padding:4px 4px 4px 4px;">
                <dx:ASPxGridView ID="GridDocumentListing" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDocumentListing" DataSourceID="DocumentList" EnableCallbackAnimation="True" KeyFieldName="RowId" OnCustomCallback="GridDocumentListing_CustomCallback" OnHtmlDataCellPrepared="GridDocumentListing_HtmlDataCellPrepared" Width="100%">
                    <ClientSideEvents EndCallback="function(s, e) {
	GridDocumentListing_EndCallback(s, e);
}" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ProcessId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DocumentFileSystemName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama Fail" FieldName="DocumentFileUserName" ShowInCustomizationForm="True" VisibleIndex="1" Width="17%">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Muatnaik Oleh" FieldName="UploadedBy" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarikh Muatnaik" FieldName="UploadedDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy HH:mm">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm"></PropertiesDateEdit>

                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Nota" FieldName="Notes" ShowInCustomizationForm="True" VisibleIndex="4" Width="35%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                            
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle> 
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="DocumentList" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AttachmentsConnectionString %>" OnSelecting="DocumentList_Selecting" SelectCommand="SELECT * FROM [DocumentAttachments] WHERE ([ProcessId] = @ProcessId) ORDER BY [UploadedDate] DESC">
                    <SelectParameters>
                        <asp:Parameter Name="ProcessId" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="PopupAttachmentInfo" runat="server" HeaderText="Info fail" Width="700px" CssClass="AppFont" ClientInstanceName="PopupAttachmentInfo" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" AllowDragging="True">
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:98%; margin-left:auto; margin-right:auto; padding:8px 8px 8px 8px; text-align:center; vertical-align:middle;">
            <dx:ASPxButton ID="ASPxButton13" runat="server" AutoPostBack="False" Text="Simpan &amp; Tutup" Theme="SoftOrange" Width="150px" Wrap="True">
                 <ClientSideEvents Click="function(s, e) { cbp_popupAttachDocument.PerformCallback('2'); }" />
            </dx:ASPxButton>
            &nbsp;&nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Muat Turun Fail" Width="150px" Theme="SoftOrange">
                <ClientSideEvents Click="function(s, e) { DownloadFile(); }" /> 
            </dx:ASPxButton>
             &nbsp;&nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Lihat Fail" Width="150px" Theme="SoftOrange">
                <ClientSideEvents Click="function(s, e) { OpenFile(); }" /> 
            </dx:ASPxButton>
            &nbsp;&nbsp;&nbsp;
            <dx:ASPxButton ID="ASPxButton14" runat="server" AutoPostBack="False" Text="Batal" Width="150px" Theme="SoftOrange">
                <ClientSideEvents Click="function(s, e) { PopupAttachmentInfo.Hide(); }" />
            </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
    <dx:ASPxCallbackPanel ID="cbp_UploadDocument_Loader" runat="server" OnCallback="cbp_UploadDocument_Loader_Callback" Width="100%" ClientInstanceName="cbp_UploadDocument_Loader" EnableCallbackAnimation="True" EnableClientSideAPI="True" ShowLoadingPanel="False" ShowLoadingPanelDocument="False">
        <SettingsLoadingPanel Enabled="False" ShowImage="False" />
        <ClientSideEvents EndCallback="function(s, e) {
	cbp_UploadDocument_Loader_EndCallback(s, e);
}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" CssClass="AppFont" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Tambahan Dokumen" ShowCaption="True">
                            <Items>
                                <dx:LayoutItem Caption="Nama Fail">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="DocumentFileUserName" runat="server" ClientInstanceName="DocumentFileUserName" EnableClientSideAPI="True" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Nota">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxMemo ID="Notes" runat="server" ClientInstanceName="Notes" EnableClientSideAPI="True" Rows="4" Width="100%">
                                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="RowId" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="RowId" runat="server" ClientInstanceName="RowId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutItem Caption="Muatnaik Oleh">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="UploadedBy" runat="server" ClientInstanceName="UploadedBy" EnableClientSideAPI="True" Font-Bold="True" Text="ASPxLabel">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tarikh Muatnaik">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="UploadedDate" runat="server" ClientInstanceName="UploadedDate" EnableClientSideAPI="True" Font-Bold="True" Text="ASPxLabel">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
    <dx:ASPxTextBox ID="popupAttachDocument_CallerName" runat="server" ClientInstanceName="popupAttachDocument_CallerName" EnableClientSideAPI="True" Width="50%" Text="" ClientVisible="False">
    </dx:ASPxTextBox>
    <dx:ASPxTextBox ID="popupAttachDocument_ProcessId" runat="server" ClientInstanceName="popupAttachDocument_ProcessId" EnableClientSideAPI="True" Width="50%" ClientVisible="False">
    </dx:ASPxTextBox>

<dx:ASPxPopupControl ID="popupInvalidAttachment" runat="server" ClientInstanceName="popupInvalidAttachment" CloseAnimationType="Fade" EnableClientSideAPI="True" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" HeaderText="Muatnaik gambar gagal">
    <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:center;">
                
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Gambar yang dimuatnaik mempunyai jenis fail yang tidak dibenarkan atau bersaiz lebih daripada 4Mb." EncodeHtml="False">
                </dx:ASPxLabel>
                
            </td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px;"><div style="width:120px; text-align:center; margin-left:auto; margin-right:auto;">
                <dx:ASPxButton ID="ASPxButton16" runat="server" Text="Ok" Width="100%" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	popupInvalidAttachment.Hide();
}" />
                </dx:ASPxButton>
                </div></td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>





<dx:ASPxCallbackPanel ID="cbp_popupAttachDocument" runat="server" ClientInstanceName="cbp_popupAttachDocument" OnCallback="cbp_popupAttachDocument_Callback" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupAttachDocument_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
    <dx:ASPxTextBox ID="popupAttachDocument_UserFileName" runat="server" ClientInstanceName="popupAttachDocument_UserFileName" EnableClientSideAPI="True" Width="50%" Text="" ClientVisible="False">
    </dx:ASPxTextBox>
    <dx:ASPxTextBox ID="popupAttachDocument_SystemFileName" runat="server" ClientInstanceName="popupAttachDocument_SystemFileName" EnableClientSideAPI="True" Width="50%" Text="" ClientVisible="False">
    </dx:ASPxTextBox>















