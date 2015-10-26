<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_MaklumatStok.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.DaftarStok.Tab_MaklumatStok" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ColCount="3">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Stok" Width="50%" ColCount="2">
                            <Items>
                                <dx:LayoutItem Caption="No. Pendaftaran Stok" Width="100%" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E1" runat="server" CssClass="ComboBoxNoDaftarStok">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Keterangan Stok" Width="100%" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" CssClass="TextBoxForName">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kumpulan Stok" Width="100%" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" CssClass="ComboBoxForKumpulan">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Unit Pengukuran" Width="100%" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E4" runat="server" CssClass="ComboBoxForUnitPengukuran">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kategori" Width="40%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E5" runat="server" CssClass="ComboBoxForKategori">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Sub-Kategori" Width="60%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E6" runat="server" CssClass="ComboBoxForSubKategori">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Maklumat Lokasi" Width="25%">
                            <Items>
                                <dx:LayoutItem Caption="Seksyen" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="70%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Baris" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" Width="70%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Rak" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="70%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tingkap" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="70%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Petak" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" Width="70%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Maklumat Kuantiti &amp; Harga" Width="25%">
                            <Items>
                                <dx:LayoutItem Caption="Harga Semasa (RM)" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E12" runat="server" AllowMouseWheel="False" DisplayFormatString="n" HorizontalAlign="Right" Width="70%">
                                                <SpinButtons ShowIncrementButtons="False">
                                                </SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Baki Semasa" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E13" runat="server" AllowMouseWheel="False" DisplayFormatString="n0" HorizontalAlign="Right" Width="70%">
                                                <SpinButtons ShowIncrementButtons="False">
                                                </SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kuantiti Dipohon" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E15" runat="server" AllowMouseWheel="False" DisplayFormatString="n0" HorizontalAlign="Right" Width="70%">
                                                <SpinButtons ShowIncrementButtons="False">
                                                </SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Kuantiti Akan Keluar" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E16" runat="server" AllowMouseWheel="False" DisplayFormatString="n0" HorizontalAlign="Right" Width="70%">
                                                <SpinButtons ShowIncrementButtons="False">
                                                </SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Paras Menokok" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E17" runat="server" AllowMouseWheel="False" DisplayFormatString="n0" HorizontalAlign="Right" Width="70%">
                                                <SpinButtons ShowIncrementButtons="False">
                                                </SpinButtons>
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Maklumat Transaksi Stok" ColSpan="3" Width="100%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Tarikh" ShowInCustomizationForm="True" VisibleIndex="0" Width="15%">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Transaksi" ShowInCustomizationForm="True" VisibleIndex="1" Width="65%">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kuantiti" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Baki" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
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
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                    <Paddings Padding="0px" />
                    <Border BorderStyle="None" />
                </dx:ASPxFormLayout>