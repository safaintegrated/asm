﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_SenaraiSemak_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.Tab_SenaraiSemak_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<style>
    .AddBottomPadding {
        padding-bottom:15px;
    }
</style>

<script>
    function chkDeclare_CheckedChanged() {
        if (chkDeclare.GetChecked()) {
            btnDeclare.SetEnabled(true);
        }
        else {
            btnDeclare.SetEnabled(false);
        }
    }

    function SaveCheckList() {
        if (VerifyChecklist())
            cbp_Checklist.PerformCallback('SAVE');
    }

    function cbp_Checklist_EndCallback(s, e) {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function VerifyChecklist() {
        var lpass = true;
        var Checkx;
        var DC_Mandatory;

        for (var i = 0; i < GridChecklist.GetVisibleRowsOnPage() ; i++) {
            Checkx = ASPxClientControl.GetControlCollection().GetByName('Checked_' + i.toString());
            DC_Mandatory = ASPxClientControl.GetControlCollection().GetByName('DC_Mandatory_' + i.toString());

            if (DC_Mandatory.GetChecked())
                if (!Checkx.GetChecked()) {
                    popupMsg_Label.SetText('Sila pastikan semua senarai semak Wajib telah ditandakan.<br>Sila semak dan cuba sekali lagi.');
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                    lpass = false;
                }

            if (!lpass)
                break;
        }

        return lpass;

    }
</script>
<dx:ASPxCallbackPanel ID="cbp_Checklist" runat="server" ClientInstanceName="cbp_Checklist" EnableCallbackAnimation="True" OnCallback="cbp_Checklist_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Semak" CssClass="FormGroupBoxStyle" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="GridChecklist" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridChecklist" Width="100%" OnHtmlDataCellPrepared="GridChecklist_HtmlDataCellPrepared">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Semak" FieldName="Checked" ShowInCustomizationForm="True" VisibleIndex="1" Width="5%">
                                            <DataItemTemplate>
                                                <dx:ASPxCheckBox ID="Checked" runat="server" EnableClientSideAPI="True">
                                                </dx:ASPxCheckBox>
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="DC_Desc" ShowInCustomizationForm="True" VisibleIndex="3" Width="90%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="DC_RowId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Wajib" FieldName="DC_Mandatory" ShowInCustomizationForm="True" VisibleIndex="2" Width="5%">
                                            <DataItemTemplate>
                                                <dx:ASPxCheckBox ID="DC_Mandatory" runat="server" ClientEnabled="False" EnableClientSideAPI="True">
                                                </dx:ASPxCheckBox>
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" />
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
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
            <dx:LayoutGroup Caption="Perakuan" CssClass="FormGroupBoxStyle" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxCheckBox ID="chkDeclare" runat="server" CheckState="Unchecked" Text="Saya mengaku bahawa semua senarai semak di atas (yang bertanda) telah diperiksa dan ianya benar." ClientInstanceName="chkDeclare" EnableClientSideAPI="True">
                                    <ClientSideEvents CheckedChanged="function(s, e) {
	chkDeclare_CheckedChanged();
}" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem CssClass="AddBottomPadding" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" CssClass="AddBottomPadding">
                                <dx:ASPxButton ID="btnDeclare" runat="server" AutoPostBack="False" Text="Ok" Width="100px" ClientInstanceName="btnDeclare" EnableClientSideAPI="True">
                                    <ClientSideEvents Click="function(s, e) {
	SaveCheckList();
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nama" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxTextBox ID="CHK_CheckedBy" runat="server" ClientEnabled="False" CssClass="TextBoxForName" ClientInstanceName="CHK_CheckedBy" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxDateEdit ID="CHK_CheckedDate" runat="server" ClientEnabled="False" CssClass="DateEditorInForm" ClientInstanceName="CHK_CheckedDate" EnableClientSideAPI="True" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                </dx:ASPxDateEdit>
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
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxTextBox ID="chkList_ProcessId" runat="server" ClientInstanceName="chkList_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>