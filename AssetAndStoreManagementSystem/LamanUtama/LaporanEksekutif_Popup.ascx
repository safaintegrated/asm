﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LaporanEksekutif_Popup.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.LaporanEksekutif_Popup" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>


<script>
    function cbp_ExeRpt_EndCallback() {
        window.open('../Report/Viewer/Index.aspx');
    }
</script>
<style>
    .Centralize {
        padding-top:5px;
    }
</style>
<dx:ASPxPopupControl ID="popup_LaporanEksekutif" runat="server" ShowHeader="False" Width="700px" ClientInstanceName="popup_LaporanEksekutif" PopupHorizontalAlign="WindowCenter" BackColor="Transparent" Modal="True" EnableTheming="False" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ShowItemCaptionColon="False" Width="100%" BackColor="WhiteSmoke" Theme="Office2010Black">
        <Items>
            <dx:LayoutGroup Caption="Laporan Eksekutif" Width="100%" ColCount="4" GroupBoxDecoration="HeadingLine">
                <GroupBoxStyle Caption-BackColor="Transparent" Caption-Font-Bold="true">
<Caption BackColor="Transparent" Font-Bold="True"></Caption>
                        </GroupBoxStyle>
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True" EnableClientSideAPI="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" Text="Kedudukan Semasa AsetAlih" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('1');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Kedudukan Stok Suku Tahun" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('2');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="Pengurusan AsetAlih Universiti" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('3');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text="Pengurusan Stor Universiti" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('4');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                <dx:ASPxImage ID="ASPxImage4" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Text="Laporan Peruntukan" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('5');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxImage ID="ASPxImage5" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" Text="Ringkasan Laporan Stok" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('9');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxImage ID="ASPxImage6" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Text="Ringkasan Kehilangan Aset" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('6');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxImage ID="ASPxImage7" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" Text="Ringkasan Kehilangan Stok" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('7');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxImage ID="ASPxImage8" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink8" runat="server" Text="Ringkasan Pelupusan Stok" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('6');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server">
                                <dx:ASPxImage ID="ASPxImage9" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" Text="Ringkasan Tahunan HMI" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('10');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                <dx:ASPxImage ID="ASPxImage10" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink10" runat="server" Text="Ringkasan Verifikasi" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('11');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                <dx:ASPxImage ID="ASPxImage11" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" Text="Ringkasan Pelupusan" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('12');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                     <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server">
                                <dx:ASPxImage ID="ASPxImage12" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink12" runat="server" Text="Ringkasan Pemeriksaan HMI" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('13');">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="5%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server">
                                <dx:ASPxImage ID="ASPxImage13" runat="server" ImageUrl="~/Public/Images/Others/Report.png" ShowLoadingImage="True">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="45%" CssClass="Centralize">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server" CssClass="Centralize">
                                <dx:ASPxHyperLink ID="ASPxHyperLink13" runat="server" Text="Ringkasan Penyelenggaraan" NavigateUrl="javascript: cbp_ExeRpt.PerformCallback('14');">
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
<dx:ASPxCallbackPanel ID="cbp_ExeRpt" runat="server" ClientInstanceName="cbp_ExeRpt" ClientVisible="False" OnCallback="cbp_ExeRpt_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_ExeRpt_EndCallback();
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
