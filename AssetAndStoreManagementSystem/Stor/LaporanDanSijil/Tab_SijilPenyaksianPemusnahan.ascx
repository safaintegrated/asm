<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_SijilPenyaksianPemusnahan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanDanSijil.Tab_SijilPenyaksianPemusnahan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Sijil Penyaksian Pemusnahan Aset Alih Universiti" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Maklumat Sijil Penyaksian Pemusnahan Aset Alih Universiti" GroupBoxDecoration="HeadingLine" Width="100%">
                    <Items>
                        <dx:LayoutItem Width="100%" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="No Transaksi" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tarikh Transaksi" ShowInCustomizationForm="True" VisibleIndex="1" Width="30%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Status" ShowInCustomizationForm="True" VisibleIndex="2" Width="30%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Senarai Stok Yang Telah Diperiksa" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keadah Pelupusan" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tarikh Pelupusan" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tempat" ShowInCustomizationForm="True" VisibleIndex="6" Width="30%">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Harga Jualan" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Penerima/Pembeli" ShowInCustomizationForm="True" VisibleIndex="8">
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
        </dx:LayoutGroup>
    </Items>
    <settingsitems horizontalalign="Left" verticalalign="Top" />
    <settingsitemcaptions horizontalalign="Left" location="Top" verticalalign="Top" />
    <paddings padding="0px" />
    <border borderstyle="None"></border>
</dx:ASPxFormLayout>