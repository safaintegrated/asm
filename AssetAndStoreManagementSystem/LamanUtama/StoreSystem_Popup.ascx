<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StoreSystem_Popup.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.StoreSystem_Popup" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Kewps_Popup.ascx" tagname="Kewps_Popup" tagprefix="uc1" %>

<dx:ASPxPopupControl ID="popup_StoreSystem" runat="server" ShowHeader="False" Width="430px" ClientInstanceName="popup_StoreSystem" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True" Theme="Office2010Black">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Office2010Black" ShowItemCaptionColon="False" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Sub-Menu Pentadbir Sistem" CssClass="SubMenuGroupBox" GroupBoxDecoration="None" ShowCaption="False" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Fail Induk Dan Laporan" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Stor" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink214" runat="server" ImageUrl="~/Public/Images/Screen/Store.png" NavigateUrl="~/Stor/Stor/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Kategori dan Sub-Kategori" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink215" runat="server" ImageUrl="~/Public/Images/Screen/CategorySubcategory.png" NavigateUrl="~/Shared/KategoriSubKategori/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Stok" Width="25%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink216" runat="server" ImageUrl="~/Public/Images/Screen/Stock.png" NavigateUrl="~/Stor/Stok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Laporan" Width="25%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="StoreReportImage" runat="server" ImageUrl="~/Public/Images/Screen/Laporan.png" NavigateUrl="javascript: popup_KewPs.Show();" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Permohonan Dan Pendaftaran" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Terimaan Barang (GRN)" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink217" runat="server" ImageUrl="~/Public/Images/Screen/GRN.png" NavigateUrl="~/Shared/TerimaanBarang/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pendaftaran" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink218" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Stor/DaftarStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Permohonan Stok" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink219" runat="server" ImageUrl="~/Public/Images/Screen/StockRequest.png" NavigateUrl="~/Stor/PermohonanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pengeluaran ke Stor PTJ" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink220" runat="server" ImageUrl="~/Public/Images/Screen/DamageReport.png" NavigateUrl="~/Stor/PengeluaranKeStorPTJ/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Pemeriksaan Dan Verifikasi" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Lembaga Pemeriksa" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink221" runat="server" ImageUrl="~/Public/Images/Screen/InspectionOfficer.png" NavigateUrl="~/Shared/LembagaPemeriksa/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pemeriksaan Stok" CssClass="ImageFormAlignment" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink222" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Stor/PemeriksaanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:EmptyLayoutItem Width="25%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="25%">
                            </dx:EmptyLayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Ambil Alih , Pelarasan , Perlupusan Dan Hapuskira" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                         <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Perakuan Ambil Alih" Width="25%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink223" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PerakuanAmbilAlih/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pelarasan Stok" Width="25%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink224" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PelarasanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Perlupusan" Width="25%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink225" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PelupusanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:EmptyLayoutItem Width="25%">
                            </dx:EmptyLayoutItem>
                        </Items>
                    </dx:LayoutGroup>
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
        <SettingsItems HorizontalAlign="Center" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Center" Location="Bottom" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
    <border borderstyle="None"></border>
</dx:ASPxPopupControl>
<uc1:Kewps_Popup ID="Kewps_Popup1" runat="server" />
    

        
