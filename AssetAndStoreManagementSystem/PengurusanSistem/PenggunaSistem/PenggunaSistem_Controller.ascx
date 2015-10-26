<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PenggunaSistem_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem.PenggunaSistem_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="AuditTrail_Controller.ascx" tagname="AuditTrail_Controller" tagprefix="uc2" %>

<%@ Register src="PenggunaSistem_PopupManager.ascx" tagname="PenggunaSistem_PopupManager" tagprefix="uc1" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<script src="Js_PenggunaSistem.js" type="text/javascript"></script>

<script>
    function cbp_Report_EndCallback(s, e) {
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Index.aspx');
        PopupPrint.Show();
    }

    function SystemUserSelected(Id)
    {
        User_Id.SetText(Id.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat pengguna sistem.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_PopupUserManagement.PerformCallback('LOAD');
    }

    function OnPageLoad()
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pengguna Sistem" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PenggunaSistem.png">
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
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" DataSourceID="MainGridDs" KeyFieldName="User_Id" Width="100%" OnCustomCallback="MainGrid_CustomCallback" OnHtmlDataCellPrepared="MainGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="User_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="26%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Id Staf" FieldName="User_EmployeeId" ShowInCustomizationForm="True" VisibleIndex="2" Width="8%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                             <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="User_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="26%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                             <Settings AutoFilterCondition="Contains" />
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="User_Name" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="Dsgt_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="20%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                             <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Alamat Emel" FieldName="User_EmailAddress" ShowInCustomizationForm="True" VisibleIndex="5" Width="20%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                             <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="15">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="MainGridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [User_Id], [PTJ_FullName], [User_EmployeeId], [User_Name], [Dsgt_Name], [User_EmailAddress] FROM [V_User] WHERE ([User_StatusCode] = @User_StatusCode) ORDER BY [PTJ_FullName], [User_EmployeeId]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="User_StatusCode" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
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


<uc2:AuditTrail_Controller ID="AuditTrail_Controller1" runat="server" />


<dx:ASPxTextBox ID="EnableCreate" ClientInstanceName="EnableCreate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableUpdate" ClientInstanceName="EnableUpdate" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="EnableDelete" ClientInstanceName="EnableDelete" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>


<uc1:PenggunaSistem_PopupManager ID="PenggunaSistem_PopupManager1" runat="server" />




<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);

}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>




<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Pengguna Sistem" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
