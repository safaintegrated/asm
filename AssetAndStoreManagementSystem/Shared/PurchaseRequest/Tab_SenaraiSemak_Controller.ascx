<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_SenaraiSemak_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PurchaseRequest.Tab_SenaraiSemak_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<style>
    .AddBottomPadding {
        padding-bottom:15px;
    }
</style>

<script>
    //function chkDeclare_CheckedChanged() {
    //    if (chkDeclare.GetChecked()) {
    //        btnDeclare.SetEnabled(true);
    //    }
    //    else {
    //        btnDeclare.SetEnabled(false);
    //    }
    //}

    //function SaveCheckList() {
    //    if (VerifyChecklist())
    //        cbp_Checklist.PerformCallback('SAVE');
    //}

    //function cbp_Checklist_EndCallback(s, e) {
    //    if (s.cpErrMsg.toString() != '') {
    //        popupMsg_Label.SetText(s.cpErrMsg.toString());
    //        popupMsg.Show();
    //        popupMsg_BtnOk.Focus();
    //    }
    //}

    //function VerifyChecklist() {
    //    var lpass = true;
    //    var Checkx;
    //    var DC_Mandatory;

    //    for (var i = 0; i < GridChecklist.GetVisibleRowsOnPage() ; i++) {
    //        Checkx = ASPxClientControl.GetControlCollection().GetByName('Checked_' + i.toString());
    //        DC_Mandatory = ASPxClientControl.GetControlCollection().GetByName('DC_Mandatory_' + i.toString());

    //        if (DC_Mandatory.GetChecked())
    //            if (!Checkx.GetChecked()) {
    //                popupMsg_Label.SetText('Sila pastikan semua senarai semak Wajib telah ditandakan.<br>Sila semak dan cuba sekali lagi.');
    //                popupMsg.Show();
    //                popupMsg_BtnOk.Focus();
    //                lpass = false;
    //            }

    //        if (!lpass)
    //            break;
    //    }

    //    return lpass;

    //}
</script>
<dx:ASPxCallbackPanel ID="cbpChecklist" runat="server" ClientInstanceName="cbpChecklist" EnableCallbackAnimation="True" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%" OnCallback="cbpChecklist_Callback">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>
    <clientsideevents endcallback="function(s, e) {
	cbpChecklist_EndCallBack(s,e);
}" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <dx:ASPxCallbackPanel ID="cbpUpdateCheckList" runat="server" ClientInstanceName="cbpUpdateCheckList" OnCallback="cbpUpdateCheckList_Callback" Width="200px">
        <clientsideevents endcallback="function(s, e) {
	cbpUpdateCheckList_EndCallBack(s,e);
}" />
        <panelcollection>
            <dx:PanelContent runat="server">
            </dx:PanelContent>
        </panelcollection>
    </dx:ASPxCallbackPanel>
    <dx:ASPxFormLayout ID="flMainForm" runat="server" Width="100%" ClientInstanceName="flMainForm">
        <Items>
<dx:LayoutGroup Caption="Semakan Wajib"><Items>
<dx:LayoutItem ShowCaption="False"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtCheckListPrId" runat="server" Width="170px" ClientInstanceName="txtCheckListPrId">
                                </dx:ASPxTextBox>
                                <dx:ASPxGridView ID="gvCheckListMandatory" runat="server" DataSourceID="odsPurchaseRequestChecklist" AutoGenerateColumns="False" ClientInstanceName="gvCheckListMandatory" Width="100%">
                                    <clientsideevents rowclick="function(s, e) {
	gvCheckListMandatory_RowClick(s,e);
}" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="PurchaseRequestId" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CheckListId" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="IsChecked" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <settingsbehavior allowclienteventsonload="False" allowdragdrop="False" allowgroup="False" />
                                    <settingspager mode="ShowAllRecords">
                                    </settingspager>
                                    <settingsdatasecurity allowdelete="False" allowedit="False" allowinsert="False" />
                                </dx:ASPxGridView>
                                <asp:ObjectDataSource ID="odsPurchaseRequestChecklist" runat="server" SelectMethod="FindAllByPrId" TypeName="Data.Models.PurchaseRequestCheckListModel" OldValuesParameterFormatString="original_{0}">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtCheckListPrId" Name="prId" PropertyName="Text" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="isMandatory" Type="Boolean" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                            </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>
</dx:LayoutGroup>
            <dx:LayoutGroup Caption="Semakan Tidak Wajib" CssClass="FormGroupBoxStyle" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="gvCheckListNotMandatory" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvCheckListNotMandatory" Width="100%" DataSourceID="odsPurchaseRequestChecklistNotMandatory">
                                    <clientsideevents rowclick="function(s, e) {
	gvCheckListNonMandatory_RowClick(s,e);
}" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="PurchaseRequestId" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="2" Width="100%" ReadOnly="True">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CheckListId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="IsChecked" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
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
                                <asp:ObjectDataSource ID="odsPurchaseRequestChecklistNotMandatory" runat="server" SelectMethod="FindAllByPrId" TypeName="Data.Models.PurchaseRequestCheckListModel">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtCheckListPrId" Name="prId" PropertyName="Text" Type="String" />
                                        <asp:Parameter DefaultValue="False" Name="isMandatory" Type="Boolean" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
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
	btnChecked_Click(s,e);
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <border borderstyle="None"></border>
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxTextBox ID="chkList_ProcessId" runat="server" ClientInstanceName="chkList_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>