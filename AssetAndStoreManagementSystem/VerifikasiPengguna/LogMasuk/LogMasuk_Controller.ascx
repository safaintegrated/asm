<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogMasuk_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.VerifikasiPengguna.LogMasuk.LogMasuk_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function CheckBeforeReset(s, e) {
        if (popupHelp_IDStaf.GetText() == '' || popupHelp_Emel.GetText() == '') {
            ErrorPopupMessageBox_Label.SetText('Sila Masukkan ID dan Emel untuk teruskan');
            ErrorPopupMessageBox.Show();
            e.processOnServer = false;
        }
        else {

            LoadingPanel.SetText('Sistem sedang menjana kata laluan baharu anda.  Sila tunggu sebentar..');
            LoadingPanel.Show();
        }

    }

    function btnHelp_Click(s, e) {
        popupHelp_IDStaf.SetText('');
        popupHelp_Emel.SetText('');
        popupHelp.Show();
    }

    function btnLoginClick(s, e) {
        if (txtUserId.GetText() == '' || txtPassword.GetText() == '') {
            ErrorPopupMessageBox_Label.SetText('Sila Masukkan ID Staf dan Kata Laluan untuk log masuk.<br>Sila semak dan cuba sekali lagi.');
            ErrorPopupMessageBox.Show();
            e.processOnServer = false;
        }
        else {

            LoadingPanel.SetText('Sistem sedang mengesahkan kredensi anda.  Sila tunggu sebentar..');
            LoadingPanel.Show();
        }
    }

    function MoreThanOneRecordMode() {
        LoadingPanel.Hide();
        PopupLogin.Hide();
    }

    function TacNotGeneratedMode() {
        LoadingPanel.Hide();
        PopupLogin.Hide();
    }

    function TacGeneratedNotEnteredMode() {
        LoadingPanel.Hide();
        PopupLogin.Hide();
    }

    function GeneralExceptions(ErrMessage) {
        LoadingPanel.Hide();
        ErrorPopupMessageBox_Label.SetText(ErrMessage.toString());
        ErrorPopupMessageBox.Show();
    }
</script>
<dx:ASPxPopupControl ID="PopupLogin" runat="server" ClientInstanceName="PopupLogin" CloseAction="None" EnableClientSideAPI="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="350px" ShowCloseButton="False" ShowOnPageLoad="True">
    <HeaderStyle HorizontalAlign="Center" />
    <FooterContentTemplate>
        <div style="width:100%; text-align:center; padding-top:3px; padding-bottom:3px;">
            &nbsp;
            <dx:ASPxLabel ID="lblClientName" runat="server" ClientInstanceName="lblClientName" EnableClientSideAPI="true" EncodeHtml="False" ForeColor="#999999" Text="ASPxLabel">
            </dx:ASPxLabel>
            </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:middle;text-align:center">
        <tr>
            <td style="width:auto; vertical-align:middle;text-align:center;padding-left:7px;">
                <dx:ASPxImage ID="ASPxImage2" runat="server" ShowLoadingImage="True" ImageUrl="~/Public/Images/Logo/Logo.png">
                </dx:ASPxImage>
            </td>
        </tr>
        <tr>
            <td style="width:auto; vertical-align:middle;text-align:center; padding-top:10px;padding-bottom:7px;">
                <dx:ASPxTextBox ID="txtUserId" runat="server" ClientInstanceName="txtUserId" EnableClientSideAPI="True" NullText="Masukkan ID Pengguna Anda" Width="100%" HorizontalAlign="Center">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width:auto; vertical-align:middle;text-align:center;">
                <dx:ASPxTextBox ID="txtPassword" runat="server" NullText="Masukkan Kata Laluan Anda" Password="True" Width="100%" ClientInstanceName="txtPassword" EnableClientSideAPI="True" HorizontalAlign="Center">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width:auto; vertical-align:middle;text-align:center;padding-left:7px;">
                <div  style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
                    <dx:ASPxButton ID="btnLogin" runat="server" ClientInstanceName="btnLogin" EnableClientSideAPI="True" OnClick="btnLogin_Click" Text="Login" Width="120px">
                        <ClientSideEvents Click="function(s, e) {
	btnLoginClick(s, e);
}" />
                    </dx:ASPxButton>
                    &nbsp;
                    &nbsp;
                    <dx:ASPxButton ID="btnHelp" runat="server" AutoPostBack="False" ClientInstanceName="btnHelp" EnableClientSideAPI="True" Text="Bantuan" Width="120px">
                        <ClientSideEvents Click="function(s, e) {
	btnHelp_Click(s, e);
}" />
                    </dx:ASPxButton>
                </div>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>

<dx:ASPxPopupControl ID="ErrorPopupMessageBox" runat="server" ClientInstanceName="ErrorPopupMessageBox" CloseAction="None" CloseAnimationType="Fade" HeaderText="Notifikasi Sistem" PopupAnimationType="Fade" ShowCloseButton="False" Width="400px" EnableClientSideAPI="True" ShowFooter="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True">
    <FooterTemplate>
        <div style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="ErrorPopupMessageBox_ButtonOk" runat="server" AutoPostBack="False" ClientInstanceName="ErrorPopupMessageBox_ButtonOk" EnableClientSideAPI="True" Text="Ok" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	ErrorPopupMessageBox.Hide();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:40px; vertical-align:central; text-align:center;">
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Public/Images/DialogBox/Error.png">
                </dx:ASPxImage>
            </td>
            <td style="width:auto; vertical-align:central; text-align:left; padding-left:5px;">
                <dx:ASPxLabel ID="ErrorPopupMessageBox_Label" runat="server" ClientInstanceName="ErrorPopupMessageBox_Label" EnableClientSideAPI="True" Text="ASPxLabel" EncodeHtml="False">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupHelp" runat="server" ClientInstanceName="popupHelp" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Bantuan" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="500px" ShowFooter="True">
    <FooterTemplate>
        <div style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="popupHelp_SubmitBtn" runat="server" ClientInstanceName="popupHelp_SubmitBtn" EnableClientSideAPI="True" Text="Hantar" Width="120px" OnClick="popupHelp_SubmitBtn_Click">
             <ClientSideEvents Click="function(s, e) {
	CheckBeforeReset(s,e);
}" />
            </dx:ASPxButton>
            &nbsp;
            &nbsp;
             <dx:ASPxButton ID="popupHelp_CancelBtn" runat="server" AutoPostBack="False" ClientInstanceName="popupHelp_CancelBtn" EnableClientSideAPI="True" Text="Batal" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	popupHelp.Hide();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E1" runat="server" Text="Sekiranya anda pertama kali masuk, kata laluan ialah nombor kad pengenalan.">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Text="Sekiranya lupa kata laluan, sila masukkan ID Staf and Emel untuk mendapat semula kata laluan">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="ID Staf">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                        <dx:ASPxTextBox ID="popupHelp_IDStaf" runat="server" Width="170px" ClientInstanceName="popupHelp_IDStaf" EnableClientSideAPI="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Emel">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                        <dx:ASPxTextBox ID="popupHelp_Emel" runat="server" Width="100%" ClientInstanceName="popupHelp_Emel" EnableClientSideAPI="True">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>











