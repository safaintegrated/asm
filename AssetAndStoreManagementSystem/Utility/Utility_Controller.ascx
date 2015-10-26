﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Utility_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Utility.Utility_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>















<script>
    function EncryptText()
    {
        if (E_In.GetText() == '') {
            PopupSysInfo_Label.SetText('No text to encrypt');
            PopupSysInfo.Show();
            PopupSysInfo_BtnOk.Focus();
        }
        else
            cbpEncryptDecrypt.PerformCallback('E');
    }

    function DecryptText()
    {
        if (D_In.GetText() == '') {
            PopupSysInfo_Label.SetText('No text to decrypt');
            PopupSysInfo.Show();
            PopupSysInfo_BtnOk.Focus();
        }
        else
            cbpEncryptDecrypt.PerformCallback('D');
    }

    function cbpEncryptDecrypt_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() == '')
        {
            if (s.cpMode.toString() == 'E')
            {
                E_Out.SetText(s.cpText.toString());
            }
            else
            {
                D_Out.SetText(s.cpText.toString());
            }
        }
        else
        {
            PopupSysInfo_Label.SetText(s.cpErrMsg.toString());
            PopupSysInfo.Show();
            PopupSysInfo_BtnOk.Focus();
        }
    }

</script>

<style type="text/css">
.Center {
text-align: center;
}
.CenterWithTopPadding {
text-align: center;
padding-top: 10px;
}
</style>

<dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" HeaderText="System Utilities" ShowCollapseButton="true" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Utility.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Font-Names="Myriad Pro" Font-Size="Small" Width="100%">
        <TabPages>
            <dx:TabPage Text="Text Encrypt &amp; Decrypt">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxFormLayout ID="ASPxFormLayout4" runat="server" ColCount="2" Width="100%">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Width="50%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Font-Names="Myriad Pro" Font-Size="Small" HeaderText="Encrypt Text" Width="100%">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                                                            <Items>
                                                                <dx:LayoutItem Caption="Text to encrypt">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="E_In" runat="server" ClientInstanceName="E_In" EnableClientSideAPI="True" Width="100%">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem ShowCaption="False">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxButton ID="btnE" runat="server" AutoPostBack="False" ClientInstanceName="btnE" EnableClientSideAPI="True" Text="Encrypt" Width="120px">
                                                                                <ClientSideEvents Click="function(s, e) {
	EncryptText();
}" />
                                                                            </dx:ASPxButton>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="Result">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="E_Out" runat="server" ClientInstanceName="E_Out" EnableClientSideAPI="True" Width="100%">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                        </dx:ASPxFormLayout>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxRoundPanel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" Width="50%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Font-Names="Myriad Pro" Font-Size="Small" HeaderText="Decrypt Text" Width="100%">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                                                            <Items>
                                                                <dx:LayoutItem Caption="Text to decrypt">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="D_In" runat="server" ClientInstanceName="D_In" EnableClientSideAPI="True" Width="100%">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem ShowCaption="False">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxButton ID="btnD" runat="server" AutoPostBack="False" ClientInstanceName="btnD" EnableClientSideAPI="True" Text="Decrypt" Width="120px">
                                                                                <ClientSideEvents Click="function(s, e) {
	DecryptText();
}" />
                                                                            </dx:ASPxButton>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                                <dx:LayoutItem Caption="Result">
                                                                    <LayoutItemNestedControlCollection>
                                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                                            <dx:ASPxTextBox ID="D_Out" runat="server" ClientInstanceName="D_Out" EnableClientSideAPI="True" Width="100%">
                                                                            </dx:ASPxTextBox>
                                                                        </dx:LayoutItemNestedControlContainer>
                                                                    </LayoutItemNestedControlCollection>
                                                                </dx:LayoutItem>
                                                            </Items>
                                                        </dx:ASPxFormLayout>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxRoundPanel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:ASPxFormLayout>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>





<dx:ASPxPopupControl ID="PopupSysInfo" runat="server" AllowDragging="True" ClientInstanceName="PopupSysInfo" CloseAction="CloseButton" EnableClientSideAPI="True" Font-Names="Myriad Pro" Font-Size="Small" HeaderText="Informasi Sistem" Width="500px">
    <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server" Width="100%">
                <Items>
                    <dx:LayoutItem CssClass="Center" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="Center">
                                <dx:ASPxLabel ID="PopupSysInfo_Label" runat="server" ClientInstanceName="PopupSysInfo_Label" EnableClientSideAPI="True" EncodeHtml="False">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem CssClass="CenterWithTopPadding" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Top">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="CenterWithTopPadding">
                                <dx:ASPxButton ID="PopupSysInfo_BtnOk" runat="server" ClientInstanceName="PopupSysInfo_BtnOk" EnableClientSideAPI="True" Text="Ok" Width="120px" AutoPostBack="False">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItems HorizontalAlign="Center" VerticalAlign="Top" />
            </dx:ASPxFormLayout>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>






<dx:ASPxCallbackPanel runat="server" ShowLoadingPanelImage="False" ShowLoadingPanel="False" ClientInstanceName="cbpEncryptDecrypt" ClientVisible="False" Width="200px" ID="cbpEncryptDecrypt" OnCallback="cbpEncryptDecrypt_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	cbpEncryptDecrypt_EndCallback(s, e);
}">
    </ClientSideEvents>
    <PanelCollection>
        <dx:PanelContent runat="server">
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>







