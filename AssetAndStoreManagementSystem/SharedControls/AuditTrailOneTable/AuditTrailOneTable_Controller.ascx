﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditTrailOneTable_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.SharedControls.AuditTrailOneTable.AuditTrailOneTable_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="900px" AllowDragging="True" Height="430px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxFormLayout ID="FormAuditTrail" runat="server" ClientInstanceName="FormAuditTrail" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Audit" Width="40%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridAuditListing" runat="server" ClientInstanceName="GridAuditListing" Width="100%">
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Data Audit" Width="60%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridAuditDetails" runat="server" ClientInstanceName="GridAuditDetails" EnableCallbackAnimation="True" Width="100%">
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsLoadingPanel Mode="Disabled" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
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
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

