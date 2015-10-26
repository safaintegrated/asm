<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LaporanTahunan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanTahunan.LaporanTahunan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>













<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>

<link href="../../Public/Css/MainCss.css" rel="stylesheet" />

<script>
    function ManageToolbar(btnEdit, btnAdd, btnSave, btnSubmit, btnDelete, btnPrint, btnSearch, btnAudit, btnClose, btnCancel) {
        if (btnEdit == 'true')
            Toolbar.GetItemByName("btnEdit").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnEdit").SetEnabled(false);

        if (btnAdd == 'true')
            Toolbar.GetItemByName("btnAdd").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnAdd").SetEnabled(false);

        if (btnSave == 'true')
            Toolbar.GetItemByName("btnSave").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnSave").SetEnabled(false);

        if (btnSubmit == 'true')
            Toolbar.GetItemByName("btnSubmit").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnSubmit").SetEnabled(false);

        if (btnDelete == 'true')
            Toolbar.GetItemByName("btnDelete").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnDelete").SetEnabled(false);

        if (btnPrint == 'true')
            Toolbar.GetItemByName("btnPrint").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnPrint").SetEnabled(false);

        if (btnSearch == 'true')
            Toolbar.GetItemByName("btnSearch").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnSearch").SetEnabled(false);

        if (btnAudit == 'true')
            Toolbar.GetItemByName("btnAudit").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnAudit").SetEnabled(false);

        if (btnClose == 'true')
            Toolbar.GetItemByName("btnClose").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnClose").SetEnabled(false);

        if (btnCancel == 'true')
            Toolbar.GetItemByName("btnCancel").SetEnabled(true);
        else
            Toolbar.GetItemByName("btnCancel").SetEnabled(false);
    }

    function Toolbar_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnSave': SaveMode(); break;
            case 'btnEdit': EditMode(); break;
            case 'btnCancel': CancelMode(); break;
            case 'btnAudit': AuditMode(); break;
            case 'btnClose': CloseWindow(); break;
            case 'btnAdd': AddNewSubCat(); break;
        }
    }

    function AddNewSubCat() {

    }


</script>

<style type="text/css">
    .auto-style1 {
        width: 100%;
        vertical-align: top;
        text-align: left;
        padding-top: 15px;
        height: 54px;
    }
</style>

<table class="MainTableContainer">
    <tr>
        <td>
            <table class="PageNameTableContainer">
                <tr>
                    <td class="PageNameTableContainer_IconCell">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/Screen/report.png" ShowLoadingImage="true"></dx:ASPxImage>
                    </td>
                    <td class="PageNameTableContainer_TextCell">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="XX-Large" Text="Laporan Tahunan Keseluruhan Pengurusan Stor"></dx:ASPxLabel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">
<dx1:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ShowGroupLabels="False" ClientInstanceName="MainRibbon">
    <Tabs>
        <dx1:ribbontab Name="Utama" Text="Utama">
            <Groups>
                <dx1:ribbongroup Text="">
                    <Items>
                        <dx1:ribbonbuttonitem BeginGroup="True" Name="Kemaskini" Size="Large" Text="Kemaskini">
                            <LargeImage IconID="edit_edit_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Tambah" Size="Large" Text="Tambah">
                            <LargeImage IconID="actions_add_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Simpan" Size="Large" Text="Simpan">
                            <LargeImage IconID="save_save_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Hantar" Size="Large" Text="Hantar">
                            <LargeImage IconID="mail_send_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Padam" Size="Large" Text="Padam">
                            <LargeImage IconID="edit_delete_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Batal" Size="Large" Text="Batal">
                            <LargeImage IconID="actions_deletelist_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Cetak" Size="Large" Text="Cetak">
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Carian" Size="Large" Text="Carian">
                            <LargeImage IconID="find_find_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Audit" Size="Large" Text="Audit">
                            <LargeImage IconID="arrange_bringtofrontoftext_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                        <dx1:ribbonbuttonitem Name="Tutup" Size="Large" Text="Tutup">
                            <LargeImage IconID="actions_close_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                    </Items>
                </dx1:ribbongroup>
            </Groups>
        </dx1:ribbontab>
        <dx1:ribbontab Name="Lampiran" Text="Lampiran">
            <Groups>
                <dx1:ribbongroup Name="Muatnaik" Text="">
                    <Items>
                        <dx1:ribbonbuttonitem Size="Large" Text="Lampiran" Name="Lampiran">
                            <LargeImage IconID="mail_attachment_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                    </Items>
                </dx1:ribbongroup>
            </Groups>
        </dx1:ribbontab>
        <dx1:ribbontab Name="Laporan" Text="Laporan">
            <Groups>
                <dx1:ribbongroup>
                    <Items>
                        <dx1:ribbonbuttonitem Name="KEW.PA-1" Size="Large" Text="KEW.PA-1">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx1:ribbonbuttonitem>
                    </Items>
                </dx1:ribbongroup>
            </Groups>
        </dx1:ribbontab>
    </Tabs>
    <Styles>
        <Item Width="70px">
        </Item>
    </Styles>
   <%-- <StylesTabControl>
        <ActiveTab>
            <Paddings PaddingBottom="5px" PaddingTop="5px" />
        </ActiveTab>
        
        <Tab Width="100px">
        </Tab>
    </StylesTabControl>--%>
    <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
</dx1:ASPxRibbon>


        </td>
    </tr>
    <tr>
        <td class="MainTableContainer_SecondRow" >
            
            <dx:ASPxCallbackPanel ID="cbp_Load" runat="server" ClientInstanceName="cbp_Load" Width="100%">
                
                <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <table class="MainTableContainer">
        <tr>
            <td style="width:50%; vertical-align:top;text-align:left; padding-right: 3px; padding-top: 15px;">
                <dx:ASPxRoundPanel runat="server" HeaderText="Maklumat Stor" Width="100%" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxRoundPanel3"><PanelCollection>
<dx:PanelContent runat="server">
                            <table class="MainTableContainer">
                                <tr>
                                    <td style="width:30%; vertical-align:top;text-align:left;padding:6px 6px 6px 6px;">
                                        <dx:ASPxLabel runat="server" Text="Nama Stor" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxLabel18"></dx:ASPxLabel>

                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top;text-align:left;padding:6px 6px 6px 6px;">
                                        <dx:ASPxTextBox runat="server" Width="50%" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxTextBox16"></dx:ASPxTextBox>

                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top;text-align:left;padding:6px 6px 6px 6px;">
                                        <dx:ASPxLabel runat="server" Text="PTJ" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxLabel19"></dx:ASPxLabel>

                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;text-align:left;padding:6px 6px 6px 6px;" colspan="2">
                                        <dx:ASPxTextBox runat="server" Width="100%" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxTextBox17"></dx:ASPxTextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top;text-align:left;padding:6px 6px 6px 6px;">
                                        <dx:ASPxLabel runat="server" Text="Nama Pegawai" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxLabel20"></dx:ASPxLabel>

                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;text-align:left;padding:6px 6px 6px 6px;" colspan="2">
                                        <dx:ASPxTextBox ID="ASPxTextBox18" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxLabel ID="ASPxLabel21" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="Alamat">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox22" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align:top; text-align:left;padding: 3px 6px 3px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox23" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align:top; text-align:left;padding: 3px 6px 3px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox24" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="vertical-align:top; text-align:left;padding: 3px 6px 6px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox25" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxLabel ID="ASPxLabel22" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="Telefon">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxLabel ID="ASPxLabel25" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="Alamat Emel">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:30%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox19" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="50%">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:40%; vertical-align:top; text-align:left;padding: 6px 6px 6px 6px;">
                                        <dx:ASPxTextBox ID="ASPxTextBox21" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

            </td>
            <td style="width:50%; vertical-align:top;text-align:left; padding-left: 3px; padding-top: 15px;">
                <dx:ASPxRoundPanel runat="server" HeaderText="Maklumat Kod Bidang" Width="100%" Font-Names="Myriad Pro" Font-Size="Small" ID="ASPxRoundPanel4"><PanelCollection>
<dx:PanelContent runat="server">
                            <dx:ASPxGridView runat="server" AutoGenerateColumns="False" Width="100%" ID="ASPxGridView2">

<SettingsPager Visible="False"></SettingsPager>

<SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False"></SettingsDataSecurity>

</dx:ASPxGridView>

                        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

            </td>
        </tr>
    </table>
                    </dx:PanelContent>
</PanelCollection>
                
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
    </table>






<dx:ASPxPopupControl ID="popupAudit" runat="server" AllowDragging="True" ClientInstanceName="popupAudit" CloseAction="CloseButton" EnableClientSideAPI="True" Font-Names="Myriad Pro" Font-Size="Small" FooterText="" HeaderText="Senarai Audit Rekod Maklumat Pengguna Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="800px">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
            <table style="width:100%; vertical-align:top; text-align:left">
                <tr>
                    <td style="width:40%; vertical-align:top;text-align:left; padding-right:5px;">
                        <dx:ASPxGridView ID="MainAuditGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MainAuditGrid" DataSourceID="AuditMainDs" KeyFieldName="ProcessId" Width="100%" Font-Names="Myriad Pro" Font-Size="Small">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="ModifiedDate" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                    </PropertiesDateEdit>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn Caption="Transaksi" FieldName="ProcessType" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="1000" Visible="False">
                            </SettingsPager>
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="AuditMainDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [ProcessId], [ModifiedBy], [ModifiedDate], [ProcessType] FROM [Organisation_AuditMaster] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
                    </td>
                    <td style="width:60%; vertical-align:top;text-align:left; padding-left:5px;">
                        <dx:ASPxGridView ID="DetailAuditGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="DetailAuditGrid" DataSourceID="AuditRecordDs" OnCustomCallback="DetailAuditGrid_CustomCallback" Width="100%" Font-Names="Myriad Pro" Font-Size="Small">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Medan" FieldName="ColumnName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="40%">
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="40%">
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="1000" Visible="False">
                            </SettingsPager>
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="AuditRecordDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_Organisation" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="ProcessId" SessionField="OrgAuditProcessId" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxPopupControl ID="PopupSysInfo" runat="server" AllowDragging="True" ClientInstanceName="PopupSysInfo" CloseAction="CloseButton" EnableClientSideAPI="True" Font-Names="Myriad Pro" Font-Size="Small" HeaderText="Informasi Sistem" Width="500px">
    <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
            <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
                <Items>
                    <dx:LayoutItem CssClass="Center" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" CssClass="Center">
                                <dx:ASPxLabel ID="PopupSysInfo_Label" runat="server" ClientInstanceName="PopupSysInfo_Label" EnableClientSideAPI="True" EncodeHtml="False">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem CssClass="CenterWithTopPadding" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" CssClass="CenterWithTopPadding">
                                <dx:ASPxButton ID="PopupSysInfo_BtnOk" runat="server" ClientInstanceName="PopupSysInfo_BtnOk" EnableClientSideAPI="True" Text="Ok" Width="170px">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItems HorizontalAlign="Center" VerticalAlign="Top" />
            </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Font-Names="Myriad Pro" Font-Size="Small">
</dx:ASPxLoadingPanel>