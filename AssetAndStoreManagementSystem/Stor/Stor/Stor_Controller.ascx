<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Stor_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Stor.Stor_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function OnPageLoad()
    {
        ManageForm('false');
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');            
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
    }

    function EmpGridLookup_RowClick(s, e)
    {
        if (ST_StoreOfficerEmpSysId.GetText() != '') {
            var grid = ST_StoreOfficerEmpSysId.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'EmployeeEmail', EmpGridLookupOnGetRowValues);
        }
    }

    function EmpGridLookupOnGetRowValues(values)
    {
        EmployeeEmail.SetText(values);
    }

    function cbp_EndCallback(s, e)
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
                popupMsg_Label.SetText('Rekod stor telah berjaya disiampan.');
                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'DELETE')
            {
                popupMsg_Label.SetText('Rekod stor telah berjaya dipadam.');
                popupMsg.Show();
            }
        }
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

    function KemaskiniClicked()
    { }

    function TambahClicked()
    {
        ManageForm('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true');
        ST_StoreName.SetText('');
        ST_StorePTJId.SetValue(null);
        ST_StoreAdd1.SetText('');
        ST_StoreAdd2.SetText('');
        ST_StoreAdd3.SetText('');
        ST_StoreAdd4.SetText('');
        ST_StoreOfficerEmpSysId.SetValue(null);
        ST_StorePhoneNumber.SetText('');
        ST_StoreId.SetText('');
    }

    function SimpanClicked()
    {
        if (CheckBeforeSave())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan rekod stor.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp.PerformCallback('SAVE');
        }
    }

    function CheckBeforeSave()
    {
        if (ST_StoreName.GetText() == '' || ST_StorePTJId.GetText() == '' || ST_StoreOfficerEmpSysId.GetText() == '') {
            popupMsg_Label.SetText('Nama Stor, Pusat Tanggungjawab dan Nama Pegawai mesti diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    { }

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

    function ManageForm(truefalse)
    {
        if (truefalse == 'true')
        {
            ST_StoreName.SetEnabled(true);
            ST_StorePTJId.SetEnabled(true);
            ST_StoreAdd1.SetEnabled(true);
            ST_StoreAdd2.SetEnabled(true);
            ST_StoreAdd3.SetEnabled(true);
            ST_StoreAdd4.SetEnabled(true);
            ST_StoreOfficerEmpSysId.SetEnabled(true);
            ST_StorePhoneNumber.SetEnabled(true);
        }
        else
        {
            ST_StoreName.SetEnabled(false);
            ST_StorePTJId.SetEnabled(false);
            ST_StoreAdd1.SetEnabled(false);
            ST_StoreAdd2.SetEnabled(false);
            ST_StoreAdd3.SetEnabled(false);
            ST_StoreAdd4.SetEnabled(false);
            ST_StoreOfficerEmpSysId.SetEnabled(false);
            ST_StorePhoneNumber.SetEnabled(false);
        }
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Stor" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Store.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left;">
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
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px">
                <dx:ASPxCallbackPanel ID="cbp" runat="server" ClientInstanceName="cbp" OnCallback="cbp_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                <Items>
                                    <dx:LayoutItem Caption="Nama Stor">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreName" runat="server" ClientInstanceName="ST_StoreName" CssClass="TextBoxForName" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Pusat Tanggungjawab">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="ST_StorePTJId" runat="server" ClientInstanceName="ST_StorePTJId" CssClass="ComboBoxForPusatTanggungjawab" DataSourceID="PtjDs" EnableClientSideAPI="True" TextField="PTJ_Name" ValueField="PTJ_Id" ValueType="System.Int32">
                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="PtjDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_Id], [PTJ_Name] FROM [PusatTanggungJawab] ORDER BY [PTJ_Name]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Alamat">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreAdd1" runat="server" ClientInstanceName="ST_StoreAdd1" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreAdd2" runat="server" ClientInstanceName="ST_StoreAdd2" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreAdd3" runat="server" ClientInstanceName="ST_StoreAdd3" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreAdd4" runat="server" ClientInstanceName="ST_StoreAdd4" CssClass="TextBoxForAddress" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nama Pegawai">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridLookup ID="ST_StoreOfficerEmpSysId" runat="server" AutoGenerateColumns="False" ClientInstanceName="ST_StoreOfficerEmpSysId" CssClass="TextBoxForName" DataSourceID="EmpDs" EnableClientSideAPI="True" KeyFieldName="EmployeeSystemId" TextFormatString="{1}">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    </GridViewProperties>
                                                    <GridViewClientSideEvents FocusedRowChanged="function(s, e) {
	EmpGridLookup_RowClick(s, e);
}" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1" Width="100%">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="EmployeeEmail" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="50%">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" />
                                                </dx:ASPxGridLookup>
                                                <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [EmployeeSystemId], [EmployeeName], [EmployeeEmail] FROM [Employee] ORDER BY [EmployeeName]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Alamat Emel">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="EmployeeEmail" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeEmail" CssClass="TextBoxForEmel" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="No. Telefon">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StorePhoneNumber" runat="server" ClientInstanceName="ST_StorePhoneNumber" CssClass="TextBoxForTel" EnableClientSideAPI="True">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ST_StoreId" runat="server" ClientInstanceName="ST_StoreId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                </dx:ASPxTextBox>
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
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>

<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
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
