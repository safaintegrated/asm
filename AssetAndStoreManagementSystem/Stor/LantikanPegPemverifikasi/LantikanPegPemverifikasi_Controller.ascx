﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LantikanPegPemverifikasi_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LantikanPegPemverifikasi.LantikanPegPemverifikasi_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
















<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<link href="../../Public/Css/Font.css" rel="stylesheet" />
<link href="../../Public/Css/MainCss.css" rel="stylesheet" />
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

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

<table class="MainTableContainer">
    <tr>
        <td>
            <table class="PageNameTableContainer">
                <tr>
                    <td class="PageNameTableContainer_IconCell">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/Screen/lantikanpeg.png" ShowLoadingImage="true"></dx:ASPxImage>
                    </td>
                    <td class="PageNameTableContainer_TextCell">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True"  Font-Size="XX-Large" CssClass="AppFontPageTitle" Text="Lantikan Pegawai Pemverifikasi"></dx:ASPxLabel>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="MainTableContainer_SecondRow">
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
<dx:PanelContent runat="server">
    
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pegawai Pemverifikasi Stok" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
                                    <Items>
                                        <dx:LayoutGroup Caption="Maklumat Lembaga Pegawai Pemverifikasi" ColCount="2" Width="80%">
                                            <Items>
                                                <dx:LayoutItem Caption="Nama Lembaga Pegawai" ColSpan="2" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" CssClass="TextBoxForName">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="PTJ Yang Dipertanggungjawabkan" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" CssClass="DropDownForPTJ">
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Tahun Pemeriksaan" Width="25%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E4" runat="server" Number="0">
                                                            </dx:ASPxSpinEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem Width="75%">
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem Caption="Tarikh Mula Lantikan">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E5" runat="server" CssClass="DateEditForDate">
                                                            </dx:ASPxDateEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Tarikh Tamat Lantikan">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E6" runat="server" CssClass="DateEditForDate">
                                                            </dx:ASPxDateEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup ShowCaption="False" Width="20%">
                                            <Items>
                                                <dx:LayoutItem Caption="No Rujukan" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" CssClass="TextBoxForNoRujukan">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Status">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server" CssClass="TextBoxForStatus">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Maklumat Ahli Lembaga Pegawai " ColCount="2" Width="100%">
                                            <Items>
                                                <dx:LayoutItem Caption="Nama Pekerja" ColSpan="2" Width="100%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" CssClass="TextBoxForName">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Nama Jawatan" Width="25%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" CssClass="TextBoxForNamaJawatan">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Gred Jawatan" Width="75%">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" CssClass="TextBoxForGred">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Emel">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" CssClass="TextBoxForEmel">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Telefon">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" CssClass="TextBoxForTel">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Peranan">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E13" runat="server">
                                                                <Items>
                                                                    <dx:ListEditItem Text="Pengerusi Lembaga" Value="Pengerusi Lembaga" />
                                                                    <dx:ListEditItem Text="Ahli Lembaga" Value="Ahli Lembaga" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:EmptyLayoutItem>
                                                </dx:EmptyLayoutItem>
                                                <dx:LayoutItem ShowCaption="False">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxButton ID="ASPxFormLayout1_E12" runat="server" Text="Ok">
                                                            </dx:ASPxButton>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutItem ColSpan="2" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Emel" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Telefon" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Peranan" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="6" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                                </dx:ASPxFormLayout>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
    
                    </dx:PanelContent>
</PanelCollection>
                
            </dx:ASPxCallbackPanel>
        </td>
    </tr>
    </table>
