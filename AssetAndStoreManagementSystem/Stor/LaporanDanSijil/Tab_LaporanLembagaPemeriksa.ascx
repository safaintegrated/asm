<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_LaporanLembagaPemeriksa.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.LaporanDanSijil.Tab_LaporanLembagaPemeriksa" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Laporan Lembaga Pemeriksa" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Maklumat Stok" Width="100%" GroupBoxDecoration="HeadingLine">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="No Daftar Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keterangan Stok" ShowInCustomizationForm="True" VisibleIndex="1" Width="25%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kuantiti" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tarikh Pembelian" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Tempoh Digunakan" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Harga Perolehan Asal" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%">
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

                <dx:LayoutGroup Caption="Laporan Pegawai Pemeriksa" Width="100%" GroupBoxDecoration="HeadingLine">
                                    <Items>
                                        <dx:LayoutItem Width="100%" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Keadaan Aset (Baik/Rosak)" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Nilai Semasa" ShowInCustomizationForm="True" VisibleIndex="1" Width="25%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Syor Keadah Pelupusan" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Justifikasi " ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Tarikh Pemeriksaan" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Lembaga Pemeriksa" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%">
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
        </dx:LayoutGroup>
    </Items>
    <settingsitems horizontalalign="Left" verticalalign="Top" />
    <settingsitemcaptions horizontalalign="Left" location="Top" verticalalign="Top" />
    <paddings padding="0px" />
    <border borderstyle="None"></border>
</dx:ASPxFormLayout>
