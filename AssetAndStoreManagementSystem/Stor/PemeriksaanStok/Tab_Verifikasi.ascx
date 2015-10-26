﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Verifikasi.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PemeriksaanStok.Tab_Verifikasi" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Hasil Verifikasi" Width="100%">
            <Items>
                <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None" ShowCaption="False" Width="100%" CssClass="FormGroupBoxStyle">
                    <Items>
                        <dx:LayoutItem Caption="Tarikh Mula" Width="15%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E1" runat="server" CssClass="DateEditorInForm">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tarikh Tamat" Width="85%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" CssClass="DateEditorInForm">
                                        <ClientSideEvents Init="function(s, e) {
	GridVerification.SetVisible(true);
}" />
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                     <ParentContainerStyle>
                            <Paddings Padding="0px" />
                            <Border BorderStyle="None" />
                            <BorderLeft BorderStyle="None" />
                            <BorderRight BorderStyle="None" />
                            <BorderBottom BorderStyle="None" />
                        </ParentContainerStyle>
                </dx:LayoutGroup>
                <dx:LayoutGroup GroupBoxDecoration="None" ShowCaption="False" Width="100%" CssClass="FormGroupBoxStyle">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="GridVerification" runat="server" AccessibilityCompliant="True" AutoGenerateColumns="False" ClientInstanceName="GridVerification" ClientVisible="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Kod Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="8%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="1" Width="23%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kuantiti Direkod" ShowInCustomizationForm="True" VisibleIndex="3" Width="8%">
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kuantiti Pemeriksaan" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%">
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kuantiti Verifikasi" ShowInCustomizationForm="True" VisibleIndex="5" Width="8%">
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Catatan" ShowInCustomizationForm="True" VisibleIndex="8" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Cadangan" ShowInCustomizationForm="True" VisibleIndex="7" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Justifikasi" ShowInCustomizationForm="True" VisibleIndex="6" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                     <ParentContainerStyle>
                            <Paddings Padding="0px" />
                            <Border BorderStyle="None" />
                            <BorderLeft BorderStyle="None" />
                            <BorderRight BorderStyle="None" />
                            <BorderBottom BorderStyle="None" />
                        </ParentContainerStyle>
                </dx:LayoutGroup>
            </Items>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    <Paddings Padding="0px" />
    <Border BorderStyle="None" />
</dx:ASPxFormLayout>
