<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssetSystem_Popup.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.AssetSystem_Popup" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Kewpa_Popup.ascx" tagname="Kewpa_Popup" tagprefix="uc1" %>

<dx:ASPxPopupControl ID="popup_AssetSystem" runat="server" ShowHeader="False" Width="630px" ClientInstanceName="popup_AssetSystem" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True"  Theme="Office2010Black">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server"  Theme="Office2010Black" ShowItemCaptionColon="False" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Sub-Menu Pentadbir Sistem" CssClass="SubMenuGroupBox" GroupBoxDecoration="None" ShowCaption="False" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Fail Induk Dan Laporan" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Kategori dan Sub-Kategori" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink224" runat="server" ImageUrl="~/Public/Images/Screen/CategorySubcategory.png" NavigateUrl="~/Shared/KategoriSubKategori/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Laporan" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="AssetReportImage" runat="server" ClientInstanceName="AssetReportImage" EnableClientSideAPI="True" ImageUrl="~/Public/Images/Screen/Laporan.png" NavigateUrl="javascript: popup_KewPa.Show();" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Permohonan , Pendaftaran Dan Aduan" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Terimaan Barang (GRN)" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink230" runat="server" ImageUrl="~/Public/Images/Screen/GRN.png" NavigateUrl="~/Shared/TerimaanBarang/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pendaftaran" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink229" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Aset/Pendaftaran/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Penempatan" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink228" runat="server" ImageUrl="~/Public/Images/Screen/Placement.png" NavigateUrl="~/Aset/Penempatan/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Aduan Kerosakan" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink227" runat="server" ImageUrl="~/Public/Images/Screen/DamageReport.png" NavigateUrl="~/Aset/AduanKerosakan/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Permohonan Pinjaman" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink226" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Aset/Pinjaman/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Laporan Kehilangan" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink225" runat="server" ImageUrl="~/Public/Images/Screen/file.png" NavigateUrl="~/Aset/LaporanKehilangan/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Pemeriksaan Dan Susutnilai" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Lembaga Pemeriksa" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink231" runat="server" ImageUrl="~/Public/Images/Screen/InspectionOfficer.png" NavigateUrl="~/Shared/LembagaPemeriksa/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pemeriksaan" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink232" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Aset/Pemeriksaan/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Susutnilai" CssClass="ImageFormAlignment" Width="16.6%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink233" runat="server" ImageUrl="~/Public/Images/Screen/Susutnilai.png" NavigateUrl="~/Aset/SusutNilai/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
                            </dx:EmptyLayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Perlupusan Aset" ColCount="6" GroupBoxDecoration="HeadingLine" Width="100%">
                         <GroupBoxStyle>
                            <Caption BackColor="Transparent" Font-Bold="True">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Perlupusan" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink234" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Aset/Pelupusan/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Kemaskini Aset Perlupusan" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink235" runat="server" ImageUrl="~/Public/Images/Screen/UpdateDestroyedAsset.png" NavigateUrl="~/Aset/KemaskiniAsetPelupusan/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Jualan Lelong" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink236" runat="server" ImageUrl="~/Public/Images/Screen/Auction.png" NavigateUrl="~/Aset/Lelong/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tawaran Tender" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink237" runat="server" ImageUrl="~/Public/Images/Screen/Tender.png" NavigateUrl="~/Aset/Tender/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tawaran Sebutharga" Width="16.6%" CssClass="ImageFormAlignment">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink238" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Aset/SebutHarga/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                 <CaptionStyle CssClass="WrapFormCaption">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:EmptyLayoutItem Width="16.6%">
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
<uc1:Kewpa_Popup ID="Kewpa_Popup1" runat="server" />

    

        

