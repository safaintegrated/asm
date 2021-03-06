﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SysAdmin_Popup.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.SysAdmin_Popup" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>

<dx:ASPxPopupControl ID="popup_SystemAdmin" runat="server" ShowHeader="False" Width="400px" ClientInstanceName="popup_SystemAdmin" PopupHorizontalAlign="WindowCenter" Modal="True" EnableTheming="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupVerticalAlign="WindowCenter" Theme="Office2010Black">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ShowItemCaptionColon="False" Width="100%" Theme="Office2010Black">
        <Items>
            <dx:LayoutGroup Caption="Sub-Menu Pentadbir Sistem" Width="100%" ShowCaption="False" CssClass="SubMenuGroupBox" GroupBoxDecoration="None">
                <Items>
                    <dx:LayoutGroup Caption="Konfigurasi Sistem" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle Caption-BackColor="Transparent" Caption-Font-Bold="true">
<Caption BackColor="Transparent" Font-Bold="True"></Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Maklumat Organisasi" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                         <dx:ASPxHyperLink ID="ASPxFormLayout1_E4" runat="server" ImageUrl="~/Public/Images/Screen/Organisasi.png" NavigateUrl="~/PengurusanSistem/Organisasi/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Kumpulan Pengguna Sistem" Width="25%"  CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E3" runat="server" ImageUrl="~/Public/Images/Screen/KumpulanPenggunaSistem.png" NavigateUrl="~/PengurusanSistem/KumpulanPenggunaSistem/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                       
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pengguna Sistem" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" ImageUrl="~/Public/Images/Screen/PenggunaSistem.png" NavigateUrl="~/PengurusanSistem/PenggunaSistem/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Buletin" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E1" runat="server" ImageUrl="~/Public/Images/Screen/Buletin.png" NavigateUrl="~/PengurusanSistem/Buletin/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                        
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Fail Induk" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle Caption-BackColor="Transparent" Caption-Font-Bold="true">
<Caption BackColor="Transparent" Font-Bold="True"></Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Staf" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E8" runat="server" ImageUrl="~/Public/Images/Screen/Kakitangan.png" NavigateUrl="~/PengurusanSistem/Kakitangan/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                       
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pembekal" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                         <dx:ASPxHyperLink ID="ASPxFormLayout1_E7" runat="server" ImageUrl="~/Public/Images/Screen/Pembekal.png" NavigateUrl="~/PengurusanSistem/Pembekal/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Lokasi" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E6" runat="server" ImageUrl="~/Public/Images/Screen/Lokasi.png" NavigateUrl="~/PengurusanSistem/Lokasi/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Pegawai Aset" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                         <dx:ASPxHyperLink ID="ASPxFormLayout1_E5" runat="server" ImageUrl="~/Public/Images/Screen/PegawaiAset.png" NavigateUrl="~/PengurusanSistem/PegawaiAset/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                       
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Antaramuka Sistem &amp; Emel" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                        <GroupBoxStyle Caption-BackColor="Transparent" Caption-Font-Bold="true">
<Caption BackColor="Transparent" Font-Bold="True"></Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="SAGA" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                         <dx:ASPxHyperLink ID="ASPxFormLayout1_E9" runat="server" ImageUrl="~/Public/Images/Screen/SAGA.png" NavigateUrl="~/PengurusanSistem/Saga/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                        
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="SMP" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                       <dx:ASPxHyperLink ID="ASPxFormLayout1_E10" runat="server" ImageUrl="~/Public/Images/Screen/SMP.png" NavigateUrl="~/PengurusanSistem/Smp/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Emel" Width="25%" CssClass="ImageFormAlignment">
                                <CaptionStyle CssClass="WrapFormCaption"></CaptionStyle>
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E11" runat="server" ImageUrl="~/Public/Images/Screen/Emel.png" NavigateUrl="~/PengurusanSistem/Emel/Index.aspx" Target="_blank">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
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