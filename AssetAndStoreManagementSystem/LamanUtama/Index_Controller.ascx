<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Index_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.Index_Controller" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="AssetSystem_Popup.ascx" tagname="AssetSystem_Popup" tagprefix="uc1" %>
<%@ Register src="StoreSystem_Popup.ascx" tagname="StoreSystem_Popup" tagprefix="uc2" %>
<%@ Register src="SysAdmin_Popup.ascx" tagname="SysAdmin_Popup" tagprefix="uc3" %>

<%@ Register src="LaporanEksekutif_Popup.ascx" tagname="LaporanEksekutif_Popup" tagprefix="uc4" %>

<%@ Register src="Kewps_Popup.ascx" tagname="Kewps_Popup" tagprefix="uc5" %>

<link href="../Public/Css/StartCss.css" rel="stylesheet" />

<script>
    function ShowProfilePopup()
    {
        var element = SystemUserDefaultImage.GetMainElement();
        var left = ASPxClientUtils.GetAbsoluteX(element) - 500 + SystemUserDefaultImage.GetWidth();
        var top = ASPxClientUtils.GetAbsoluteY(element) + SystemUserDefaultImage.GetHeight() + 3;
        popupUserProfile.ShowAtPos(left, top);
    }

    function ShowProfileImageUploader() {
        var element = ProfileImage.GetMainElement();
        var left = ASPxClientUtils.GetAbsoluteX(element);
        var top = ASPxClientUtils.GetAbsoluteY(element) + ProfileImage.GetHeight() + 3;
        popupUploadImageSystemUser.ShowAtPos(left, top);
    }

    function OnPageLoad()
    {
        PopupLoading.Hide();
    }

    function UserProfileImageUploader_FileUploadComplete(s, e)
    {
        if (e.isValid) {
            if (s.cpErrMsg.toString() == '')
            {
                popupUploadImageSystemUser.Hide();
                cbp_UserProfile.PerformCallback();
                cbp_DefaultProfileImage.PerformCallback();
            }
            else {
                popupMsg_Label.SetText(s.cpErrMsg.toString());
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
        }
        else {
            popupInvalidAttachment.Show();
        }
    }
</script>

<table style="width:934px;">
    <tr>
        <td style="padding-top:10px;">
            <table style="width:100%;">
                <tr>
                    <td style="vertical-align:top; text-align:left;padding:0px 0px 0px 0px;" rowspan="3"><img class="spacerStyleHeader" src="../Public/Images/StartMenu/spacer.png"/></td>
                    <td style="vertical-align:middle; text-align:left;padding:0px 0px 0px 0px; width:111px;" rowspan="3">
                        <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Public/Images/StartMenu/DefaultLogo.png" ShowLoadingImage="true">
                        </dx:ASPxImage>
                    </td>
                    <td style="vertical-align:top; text-align:left;padding:0px 0px 0px 0px; width:711px;">&nbsp;</td>
                    <td style="vertical-align:bottom; text-align:left;padding:0px 12px 0px 10px; width:80px;" rowspan="3">
                        <dx:ASPxCallbackPanel ID="cbp_DefaultProfileImage" runat="server" ClientInstanceName="cbp_DefaultProfileImage" EnableCallbackAnimation="True" OnCallback="cbp_DefaultProfileImage_Callback" Width="100%">
                            <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxImage ID="SystemUserDefaultImage" runat="server" ClientInstanceName="SystemUserDefaultImage" Cursor="pointer" EnableClientSideAPI="True" ImageUrl="~/Upload/SystemUsers/DefaultSystemUser.png" ShowLoadingImage="True" Height="80px" Width="80px">
        <ClientSideEvents Click="function(s, e) {
ShowProfilePopup();
}" />
    </dx:ASPxImage>
                                </dx:PanelContent>
</PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </td>
                    <td style="vertical-align:top; text-align:left;padding:0px 0px 0px 0px;" rowspan="3"><img class="spacerStyleHeader" src="../Public/Images/StartMenu/spacer.png"/></td>
                </tr>
                <tr>
                    <td style="vertical-align:middle; text-align:left;padding:0px 0px 0px 15px; width:711px;"><span id="AppTitle" runat="server" class="AppNameSpan"><b>SISTEM PENGURUSAN ASET ALIH & STOR</b></span></td>
                </tr>
                <tr>
                    <td style="vertical-align:bottom; text-align:left;padding:0px 0px 0px 15px; width:711px;">
                        <div style="width:100%; vertical-align:middle; text-align:left; margin:0; padding-top:5px;">
                            <dx:ASPxHyperLink ID="ASPxHyperLink66" runat="server" ImageUrl="~/LamanUtama/Icons/Calendar.png" Target="_blank" ToolTip="Lihat kalendar peribadi saya" NavigateUrl="~/PenggunaSistem/Kalendar/Index.aspx" />
&nbsp;
                            <dx:ASPxHyperLink ID="ASPxHyperLink63" runat="server" ImageUrl="~/LamanUtama/Icons/Chat.png" Target="_blank" ToolTip="Guna applikasi pesanan segera (chat)" />
&nbsp;
                            <dx:ASPxHyperLink ID="ASPxHyperLink64" runat="server" ImageUrl="~/LamanUtama/Icons/OnlineManual.png" Target="_blank" ToolTip="Lihat manual dalam talian" NavigateUrl="~/PenggunaSistem/Manual/Index.aspx" />
                            <dx:ASPxHyperLink ID="ASPxHyperLink65" runat="server" ImageUrl="~/LamanUtama/Icons/Helpdesk.png" ToolTip="Lihat laman sesawang bantuan dalam talian" NavigateUrl="http://servicedesk.safpilihan.com.my/" Target="_blank" />
                        &nbsp;
                            <dx:ASPxHyperLink ID="ASPxHyperLink67" runat="server" ImageUrl="~/LamanUtama/Icons/MyTask.png" ToolTip="Lihat Tugasan Saya" NavigateUrl="~/PenggunaSistem/Tugasan/Index.aspx" Target="_blank" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top; text-align:left;padding:0px 0px 0px 0px;" colspan="5">
                        <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Public/Images/StartMenu/spacer.png" Height="10px">
                        </dx:ASPxImage>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table style="width:100%; margin:0; padding:0px 0px 0px 0px">
                <tr>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;"><img class="spacerStyle" src="../Public/Images/StartMenu/spacer.png"/></td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px; margin:0;">
                                    <dx:ASPxHyperLink ID="HyperlinkSystemAdmin" ClientInstanceName="HyperlinkSystemAdmin" NavigateUrl="javascript: popup_SystemAdmin.Show();" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink" Cursor="pointer" ImageUrl="~/Public/Images/StartMenu/SystemAdministrator.png" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png'); margin:0;">
                                    <div class="MenuDivStle" runat="server" id="DivSystemAdmin" onclick="javascript: popup_SystemAdmin.Show();">
                                        <span class="MenuTitle"><b>PENTADBIR SISTEM</b></span><br />
                                        <span class="MenuDesc">Pengurusan sistem, fail induk dan antaramuka sistem-sistem lain.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;"><img class="spacerStyle" src="../Public/Images/StartMenu/spacer.png"/></td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px; margin:0;">
                                    <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" ImageUrl="~/Public/Images/StartMenu/PurchaseRequisition.png" Cursor="pointer" NavigateUrl="~/Shared/PurchaseRequest/Index.aspx" Target="_blank" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png'); margin:0;">
                                    <div class="MenuDivStle" runat="server" id="DivPurchaseRequisition" onclick="window.open('../Shared/PermohonanBelian/Index.aspx');">
                                        <span class="MenuTitle"><b>PERMOHONAN BELIAN</b></span><br />
                                        <span class="MenuDesc">Pembelian aset alih, inventori & stor organisasi.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;"><img class="spacerStyle" src="../Public/Images/StartMenu/spacer.png"/></td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px;  margin:0;">
                                    <dx:ASPxHyperLink ID="HyperLinkLaporanEksekutif" runat="server" ImageUrl="~/Public/Images/StartMenu/ExecutiveReports.png" Text="ASPxHyperLink" Cursor="pointer" NavigateUrl="javascript: popup_LaporanEksekutif.Show();" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png');">
                                    <div class="MenuDivStle"  runat="server" id="DivExecutiveReporting" onclick="javascript: popup_LaporanEksekutif.Show();">
                                        <span class="MenuTitle"><b>LAPORAN EKSEKUTIF</b></span><br />
                                        <span class="MenuDesc">Jana & Muat-turun laporan-laporan eksekutif.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;"><img class="spacerStyle" src="../Public/Images/StartMenu/spacer.png"/></td>
                </tr>
                <tr>
                    <td style="vertical-align:top; text-align:left;padding:0px 0px 0px 0px; margin:0px;" colspan="7">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/StartMenu/spacer.png" Height="10px">
                        </dx:ASPxImage>
                    </td>
                </tr>
                <tr>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:10px 0px 0px 0px;">&nbsp;</td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px; margin:0;">
                                    <dx:ASPxHyperLink ID="HyperlinkAssetSystem" runat="server" ImageUrl="~/Public/Images/StartMenu/AssetManagementSystem.png" Text="ASPxHyperLink" Cursor="pointer" ClientInstanceName="HyperlinkAssetSystem" NavigateUrl="javascript: popup_AssetSystem.Show();" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png');">
                                    <div class="MenuDivStle" runat="server" id="DivAssetManagementSystem" onclick="javascript: popup_AssetSystem.Show();">
                                        <span class="MenuTitle"><b>PENGURUSAN ASET ALIH</b></span><br />
                                        <span class="MenuDesc">Pengurusan aset alih & inventori organisasi.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">&nbsp;</td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px; margin:0;">
                                    <dx:ASPxHyperLink ID="ImageLink_StoreSystem" runat="server" ImageUrl="~/Public/Images/StartMenu/StoreManagementSystem.png" Text="ASPxHyperLink" Cursor="pointer" NavigateUrl="javascript: popup_StoreSystem.Show();" ClientInstanceName="ImageLink_StoreSystem" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png');">
                                    <div class="MenuDivStle" runat="server" id="DivStoreManagementSystem" onclick="javascript: popup_StoreSystem.Show();">
                                        <span class="MenuTitle"><b>PENGURUSAN STOR</b></span><br />
                                        <span class="MenuDesc">Pengurusan stor & stok oraganisasi.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">&nbsp;</td>
                    <td style="width:290px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">
                        <table style="width:290px; vertical-align:top; text-align:left; padding:0px 0px 0px 0px;">
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:center; padding:0px 0px 0px 0px; margin:0;">
                                    <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" ImageUrl="~/Public/Images/StartMenu/Dashboard.png" Text="ASPxHyperLink" Cursor="pointer" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100%; vertical-align:top; text-align:left; padding:0px 0px 0px 0px; background-image:url('../Public/Images/StartMenu/DivBackground.png');">
                                    <div class="MenuDivStle" runat="server" id="DivDashboard">
                                        <span class="MenuTitle"><b>DASHBOARD</b></span><br />
                                        <span class="MenuDesc"><i>Overview</i> sistem Pengurusan Aset Alih & Stor.</span>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:16px; vertical-align:top; text-align:left;padding:0px 0px 0px 0px;">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    </table>

<uc1:AssetSystem_Popup ID="AssetSystem_Popup1" runat="server" />
<uc2:StoreSystem_Popup ID="StoreSystem_Popup1" runat="server" />
<uc3:SysAdmin_Popup ID="SysAdmin_Popup1" runat="server" />

<dx:ASPxPopupControl ID="PopupLoading" runat="server" AppearAfter="1" ClientInstanceName="PopupLoading" CloseAction="None" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowHeader="False" ShowOnPageLoad="True" Width="800px">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Sistem sedang menyediakan laman utama anda.  Sila tunggu sebentar..">
    </dx:ASPxLabel>
        </dx:PopupControlContentControl>
</ContentCollection>
    <Border BorderStyle="None" />
</dx:ASPxPopupControl>

<uc4:LaporanEksekutif_Popup ID="LaporanEksekutif_Popup1" runat="server" />

<dx:ASPxPopupControl ID="popupUserProfile" runat="server" Width="500px" ClientInstanceName="popupUserProfile" EnableClientSideAPI="True" HeaderText="Maklumat Pengguna Sistem" PopupElementID="SystemUserDefaultImage" PopupHorizontalAlign="RightSides" PopupVerticalAlign="Below" ShowFooter="True" CloseAnimationType="Fade" PopupAnimationType="Fade" ShowCloseButton="False" Theme="Moderno">
    <FooterContentTemplate>
         <div style="width:110px; padding:8px 0px 8px 0px; text-align:right; float:right;">
             <dx:ASPxButton ID="btnLogOut" runat="server"  Text="Keluar" Theme="SoftOrange" Width="100px" OnClick="btnLogOut_Click">
                 
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxCallbackPanel ID="cbp_UserProfile" runat="server" ClientInstanceName="cbp_UserProfile" EnableCallbackAnimation="True" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%" OnCallback="cbp_UserProfile_Callback">
        <SettingsLoadingPanel Enabled="False" ShowImage="False" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table style="width:100%; vertical-align:top; text-align:left">
                    <tr>
                        <td style="width:64px; vertical-align:top; text-align:left; padding-right:8px;">
                            <dx:ASPxImage ID="ProfileImage" runat="server" ClientInstanceName="ProfileImage" Cursor="pointer" EnableClientSideAPI="True" ImageUrl="~/Upload/SystemUsers/DefaultSystemUser.png" ToolTip="Klik untuk menukar imej anda.." Height="100px" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ShowProfileImageUploader();
}" />
                            </dx:ASPxImage>
                        </td>
                        <td style="width:auto; vertical-align:top; text-align:left">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Moderno" Width="100%">
                                <Items>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="lblUserName" runat="server" style="font-weight: 700" Text="ASPxLabel">
                                                </dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="lblPtj" runat="server" Text="ASPxLabel">
                                                </dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxLabel ID="lblLastLogin" runat="server" Text="ASPxLabel">
                                                </dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:ASPxFormLayout>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupUploadImageSystemUser" runat="server" AllowDragging="True" ClientInstanceName="popupUploadImageSystemUser" CloseAnimationType="Fade" HeaderText="Muatnaik Imej Baharu" PopupAnimationType="Fade" PopupElementID="ProfileImage" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Moderno" Width="500px">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxUploadControl ID="UserProfileImageUploader" runat="server" ClientInstanceName="UserProfileImageUploader" OnFileUploadComplete="UserProfileImageUploader_FileUploadComplete" ShowProgressPanel="True" UploadMode="Auto" Width="100%">
         <ValidationSettings AllowedFileExtensions=".gif, .jpg, .jpeg, .bmp, .png," GeneralErrorText="Sistem telah menghadapi masalah teknikal untuk memuatnaik imej" MaxFileSize="4194304" MaxFileSizeErrorText="Saiz fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." MultiSelectionErrorText="Saiz fail-fail yang dipilih melebihi saiz 4Mb.  Sila pilih fail yang lain." NotAllowedFileExtensionErrorText="Jenis fail yang dipilih tidak sah.  Sila pilih fail yang lain.">
                    </ValidationSettings>
        <ClientSideEvents FileUploadComplete="function(s, e) {
	UserProfileImageUploader_FileUploadComplete(s, e); 
}" TextChanged="function(s, e) {
	UserProfileImageUploader.Upload();
}" />
        <BrowseButton Text="Pilih Imej..">
        </BrowseButton>
        <AdvancedModeSettings>
            <FileListItemStyle CssClass="pending dxucFileListItem">
            </FileListItemStyle>
        </AdvancedModeSettings>
    </dx:ASPxUploadControl>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupInvalidAttachment" runat="server" ClientInstanceName="popupInvalidAttachment" CloseAnimationType="Fade" EnableClientSideAPI="True" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px" HeaderText="Muatnaik gambar gagal">
    <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:center;">
                
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Gambar yang dimuatnaik mempunyai jenis fail yang tidak dibenarkan atau bersaiz lebih daripada 4Mb." EncodeHtml="False">
                </dx:ASPxLabel>
                
            </td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left; padding-top:10px;"><div style="width:120px; text-align:center; margin-left:auto; margin-right:auto;">
                <dx:ASPxButton ID="ASPxButton16" runat="server" Text="Ok" Width="100%" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	popupInvalidAttachment.Hide();
}" />
                </dx:ASPxButton>
                </div></td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>