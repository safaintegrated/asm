<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Info.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PemeriksaanStok.Tab_Info" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Info Pemeriksaan" Width="100%">
            <Items>
                <dx:LayoutItem Caption="Nama Stor" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxComboBox ID="ASPxFormLayout1_E1" runat="server" CssClass="ComboBoxForNamaStor">
                            </dx:ASPxComboBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutGroup Caption="Maklumat Lembaga Pemeriksa" GroupBoxDecoration="HeadingLine" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Nama Lembaga" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="ASPxFormLayout1_E2" runat="server" CssClass="ComboBoxLembagaPemeriksa">
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Emel" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Telefon" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Peranan" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%">
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
                <dx:LayoutGroup Caption="Maklumat Pemverifikasi" GroupBoxDecoration="HeadingLine" Width="100%">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E3" runat="server" CssClass="myHyperlink" EnableClientSideAPI="True" EnableTheming="False" Text="Carian Pegawai Pemverifikasi..">
                                    </dx:ASPxHyperLink>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="0" Width="35%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Emel" ShowInCustomizationForm="True" VisibleIndex="3" Width="25%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Telefon" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="5" Width="5%">
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
                <dx:LayoutGroup Caption="Senarai Stok Untuk Diperiksa" GroupBoxDecoration="HeadingLine" Width="100%">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView8" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Kod Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                                  <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="1" Width="65%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Unit Pengukuran" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                  <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kuantiti Direkod" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                  <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
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

