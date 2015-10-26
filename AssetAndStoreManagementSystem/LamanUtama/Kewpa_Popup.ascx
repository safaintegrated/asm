﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Kewpa_Popup.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.Kewpa_Popup" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>


<script>
    function cbp_KewpaRpt_EndCallback() {
        window.open('../Report/Viewer/Index.aspx');
    }
</script>
<style>
    .Centralize {
        padding-top:5px;
    }
</style>
<dx:ASPxPopupControl ID="popup_KewPa" runat="server" ShowHeader="False" Width="900px" ClientInstanceName="popup_KewPa" PopupHorizontalAlign="WindowCenter" BackColor="Transparent" Modal="True" EnableTheming="False" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupVerticalAlign="WindowCenter" Theme="Office2010Black" >
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ShowItemCaptionColon="False" Width="100%" BackColor="WhiteSmoke"  Theme="Office2010Black">
        <Items>
            <dx:LayoutGroup Caption="Laporan Kew.PA" Width="100%" ColCount="4" GroupBoxDecoration="HeadingLine">
                <GroupBoxStyle Caption-BackColor="Transparent" Caption-Font-Bold="true">
<Caption BackColor="Transparent" Font-Bold="True"></Caption>
                        </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" Text="KEW.PA-1 Borang Terimaan Barang-Barang" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA1');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="KEW.PA-2 Daftar Harta Modal" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA2');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Text="KEW.PA-3 Daftar Inventori" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA3');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" Text="KEW.PA-4 Senarai Daftar Harta Modal" NavigateUrl="~/Aset/LaporanKEWPA/KEWPA04/Index.aspx" Target="_blank">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="KEW.PA-5 Senarai Daftar Inventori" EnableClientSideAPI="True" NavigateUrl="~/Aset/LaporanKEWPA/KEWPA05/Index.aspx">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text="KEW.PA-6 Daftar Pergerakan Harta Modal &amp; Inventori" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA6');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxImage ID="ASPxImage6" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Text="KEW.PA-7 Senarai Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA7');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxImage ID="ASPxImage7" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server">
                                <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" Text="KEW.PA-8 Laporan Tahunan Harta Modal &amp; Inventori" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA8');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <dx:ASPxImage ID="ASPxImage8" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink8" runat="server" Text="KEW.PA-9 Borang Aduan Kerosakan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA9');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxImage ID="ASPxImage9" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxFormLayout1_E4" runat="server" Text="KEW.PA-10 Laporan Pemeriksaan Harta Modal" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA10');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                <dx:ASPxImage ID="ASPxImage10" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" Text="KEW.PA-11 Laporan Pemeriksaan Inventori" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA11');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                <dx:ASPxImage ID="ASPxImage11" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink10" runat="server" Text="KEW.PA-12 Sijil Tahunan Pemeriksaan Harta Modal &amp; Inventori" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA12');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server">
                                <dx:ASPxImage ID="ASPxImage12" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" Text="KEW.PA-13 Senarai Aset Yang Memerlukan Penyelenggaraan" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA13');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server">
                                <dx:ASPxImage ID="ASPxImage13" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink12" runat="server" Text="KEW.PA-14 Daftar Penyelenggaraan Harta Modal" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA14');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer27" runat="server">
                                <dx:ASPxImage ID="ASPxImage14" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer28" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink13" runat="server" Text="KEW.PA-15 Lantikan Lembaga Pemeriksa Pelupusan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA15');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer29" runat="server">
                                <dx:ASPxImage ID="ASPxImage15" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer30" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink14" runat="server" Text="KEW.PA-16 Perakuan Pelupusan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA16');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer31" runat="server">
                                <dx:ASPxImage ID="ASPxImage16" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer32" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink15" runat="server" Text="KEW.PA-17 Laporan Lembaga Pemeriksa Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA17');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer33" runat="server">
                                <dx:ASPxImage ID="ASPxImage17" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer34" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink16" runat="server" Text="KEW.PA-18 Sijil Penyaksian Pemusnahan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA18');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer35" runat="server">
                                <dx:ASPxImage ID="ASPxImage18" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer36" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink17" runat="server" Text="KEW.PA-19 Sijil Pemusnahan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA19');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer37" runat="server">
                                <dx:ASPxImage ID="ASPxImage19" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer38" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink18" runat="server" Text="KEW.PA-20 Laporan Tahunan Pelupusan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA20');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer39" runat="server">
                                <dx:ASPxImage ID="ASPxImage20" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer40" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink19" runat="server" Text="KEW.PA-21 Kenyataan Tawaran Tender Pelupusan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA21');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer41" runat="server">
                                <dx:ASPxImage ID="ASPxImage21" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer42" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink20" runat="server" Text="KEW.PA-22 Borang Tender Pelupusan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA22');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer43" runat="server">
                                <dx:ASPxImage ID="ASPxImage22" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer44" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink21" runat="server" Text="KEW.PA-23 Jadual Tender Pelupusan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA23');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer45" runat="server">
                                <dx:ASPxImage ID="ASPxImage23" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer46" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink22" runat="server" Text="KEW.PA-24 Kenyataan Tawaran Sebut Harga Pelupusan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA24');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer47" runat="server">
                                <dx:ASPxImage ID="ASPxImage24" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer48" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink23" runat="server" Text="KEW.PA25 Borang SebutHarga Pelupusan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA25');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer49" runat="server">
                                <dx:ASPxImage ID="ASPxImage25" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer50" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink24" runat="server" Text="KEW.PA-26 Jadual SebutHarga Pelupusan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA26');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer51" runat="server">
                                <dx:ASPxImage ID="ASPxImage26" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer52" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink25" runat="server" Text="KEW.PA-27 Kenyataan Jualan Lelongan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA27');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer53" runat="server">
                                <dx:ASPxImage ID="ASPxImage27" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer54" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink26" runat="server" Text="KEW.PA-28 Laporan Awal Kehilangan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA28');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer55" runat="server">
                                <dx:ASPxImage ID="ASPxImage28" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer56" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink27" runat="server" Text="KEW.PA-29 Pelantikan Jawatankuasa Penyiasat Kehilangan Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA29');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer57" runat="server">
                                <dx:ASPxImage ID="ASPxImage29" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer58" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink28" runat="server" Text="KEW.PA-30 Laporan Akhir Kehilangan Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA30');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer59" runat="server">
                                <dx:ASPxImage ID="ASPxImage30" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer60" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink29" runat="server" Text="KEW.PA-31 Sijil Hapus Kira Aset Alih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA31');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer61" runat="server">
                                <dx:ASPxImage ID="ASPxImage31" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Others/Report.png">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer62" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink30" runat="server" Text="KEW.PA-32 Laporan Tindakan Surcaj / Tatatertib Aset Alih" NavigateUrl="javascript: cbp_KewpsRpt.PerformCallback('KEW-PA32');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItems HorizontalAlign="Center" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Center" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
    <border borderstyle="None"></border>
</dx:ASPxPopupControl>
<dx:ASPxCallbackPanel ID="cbp_KewpaRpt" runat="server" ClientInstanceName="cbp_KewpaRpt" ClientVisible="False" OnCallback="cbp_KewpaRpt_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_KewpaRpt_EndCallback();
}" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>