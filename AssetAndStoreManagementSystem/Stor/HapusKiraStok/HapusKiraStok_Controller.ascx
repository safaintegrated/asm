﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HapusKiraStok_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.HapusKiraStok.HapusKiraStok_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>











<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<link href="../../Public/Css/Font.css" rel="stylesheet" />
<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<link href="../../Public/Css/MainCss.css" rel="stylesheet" />
<table class="MainTableContainer">
    <tr>
        <td>
            <table class="PageNameTableContainer">
                <tr>
                    <td class="PageNameTableContainer_IconCell">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/Screen/hapus.png" ShowLoadingImage="true"></dx:ASPxImage>
                    </td>
                    <td class="PageNameTableContainer_TextCell">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True"  CssClass="AppFontPageTitle" Font-Size="XX-Large" Text="Hapuskira Stok"></dx:ASPxLabel>
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
        <td >
            
            <dx:ASPxCallbackPanel ID="cbp_Load" runat="server" ClientInstanceName="cbp_Load" Width="100%">
                
                <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
   
                    <br />
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Hapuskira Stok" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                    <Items>
                                        <dx:LayoutGroup Caption="Maklumat Hapuskira" Width="100%">
                                            <Items>
                                                <dx:LayoutItem Caption="Nama Stor">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Tarikh">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server">
                                                            </dx:ASPxDateEdit>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Status">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Maklumat Stok Yang Dihapuskira">
                                            <Items>
                                                <dx:LayoutItem Caption="No Daftar Stok">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Keterangan Stok">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxMemo ID="ASPxFormLayout1_E5" runat="server" Rows="4" Width="170px">
                                                            </dx:ASPxMemo>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Harga Seunit">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Kuantiti Dihapuskira">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Nilai Perolehan">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Sebab Hapuskira">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxMemo ID="ASPxFormLayout1_E9" runat="server" Rows="4" Width="170px">
                                                            </dx:ASPxMemo>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Syor Oleh Pegawai Pemverifikasi">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="170px">
                                                            </dx:ASPxTextBox>
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="No Daftar Stok" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Keterangan Stok" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Harga Seunit" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Kuantiti Dihapuskira" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Nilai Perolehan" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Sebab Hapuskira" ShowInCustomizationForm="True" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Syor Oleh Pegawai Pemverifikasi" ShowInCustomizationForm="True" VisibleIndex="6">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
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
