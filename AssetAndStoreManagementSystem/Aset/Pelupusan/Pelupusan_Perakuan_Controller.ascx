﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pelupusan_Perakuan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pelupusan.Pelupusan_Perakuan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Perakuan" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Jenama" ShowInCustomizationForm="True" VisibleIndex="4" Width="12%">
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Model" ShowInCustomizationForm="True" VisibleIndex="5" Width="12%">
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Harga Perolehan Asal (RM)" ShowInCustomizationForm="True" VisibleIndex="7" Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="2" Width="18%">
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Id" ShowInCustomizationForm="True" VisibleIndex="1" Width="8%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Anggaran Nilai Semasa (RM)" ShowInCustomizationForm="True" VisibleIndex="8" Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Anggaran Kos Penyelenggaraan Semasa (RM)" ShowInCustomizationForm="True" VisibleIndex="9" Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Anggaran Nilai Selepas Dibaiki (RM)" ShowInCustomizationForm="True" VisibleIndex="10" Width="10%">
                                         <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Anggaran Tahan Selepas Dibaiki" ShowInCustomizationForm="True" VisibleIndex="11" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Mode="ShowAllRecords" Visible="False">
                                </SettingsPager>
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Styles>
                                    <AlternatingRow Enabled="True">
                                    </AlternatingRow>
                                </Styles>
                            </dx:ASPxGridView>
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

