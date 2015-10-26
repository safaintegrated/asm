﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Kemaskini_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.KemaskiniAsetPelupusan.Kemaskini_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Aset Untuk Dikemaskini">
            <Items>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxHyperLink ID="ASPxFormLayout1_E1" runat="server" Text="Carian Aset Yang Dilupuskan">
                            </dx:ASPxHyperLink>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="ASPxGridView11" runat="server" AutoGenerateColumns="False" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Tarikh Dibeli" ShowInCustomizationForm="True" VisibleIndex="2" Width="8%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Kaedah Pelupusan" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                        <DataItemTemplate>
                                            <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Width="100%">
                                                <Items>
                                                    <dx:ListEditItem Text="Jualan Secara Tender" Value="Jualan Secara Tender" />
                                                    <dx:ListEditItem Text="Jualan Secara Sebutharga" Value="Jualan Secara Sebutharga" />
                                                    <dx:ListEditItem Text="Jualan Secara Lelong" Value="Jualan Secara Lelong" />
                                                    <dx:ListEditItem Text="E-Waste,Buangan Terjadual dan Sisa Pepejal" Value="E-Waste,Buangan Terjadual dan Sisa Pepejal" />
                                                    <dx:ListEditItem Text="Jualan Sisa" Value="Jualan Sisa" />
                                                    <dx:ListEditItem Text="Tukar Barang atau Perkhidmatan" Value="Tukar Barang atau Perkhidmatan" />
                                                    <dx:ListEditItem Text="Tukar Beli" Value="Tukar Beli" />
                                                    <dx:ListEditItem Text="Tukar Ganti" Value="Tukar Ganti" />
                                                    <dx:ListEditItem Text="Hadiah" Value="Hadiah" />
                                                    <dx:ListEditItem Text="Musnah" Value="Musnah" />
                                                    <dx:ListEditItem Text="Kaedah-kaedah lain pelupusan yang difikirkan sesuai" Value="Kaedah-kaedah lain pelupusan yang difikirkan sesuai" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tarikh Pelupusan" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%">
                                        <DataItemTemplate>
                                            <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
                                            </dx:ASPxDateEdit>
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tempat" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                        <DataItemTemplate>
                                            <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Penerima/Pembeli" ShowInCustomizationForm="True" VisibleIndex="7" Width="16%">
                                        <DataItemTemplate>
                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Harga Jualan" ShowInCustomizationForm="True" VisibleIndex="6" Width="8%">
                                        <DataItemTemplate>
                                            <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" />
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keterangan Aset" ShowInCustomizationForm="True" VisibleIndex="1" Width="20%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                        </CellStyle>
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
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
</dx:ASPxFormLayout>
