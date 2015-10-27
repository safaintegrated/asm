<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_TerimaanBarang_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.Tab_TerimaanBarang_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="Tab_SenaraiItem_Controller.ascx" tagname="Tab_SenaraiItem_Controller" tagprefix="uc1" %>

<script>
    function cbp_GrnSavePost_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            EnableDisableHeaderForm('false');
            GridGrnDetailsEnableDisable('false');
            
            if (s.cpMode.toString() == 'SAVE')
            {
                ManageMainRibbonUtamaTab('true', 'false', 'false', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Rekod terimaan barang telah berjaya disimpan.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
            else
            {
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Rekod terimaan barang telah berjaya dihantar kepada <b>'+ s.cpWfReceipient.toString() +'</b> untuk kelulusan.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }

            cbp_GrnRef.PerformCallback();
        }
    }

    function EnableDisableHeaderForm(EnableDisable)
    {
        if (EnableDisable == 'true') {
            GRNH_PrNumber.SetEnabled(true);
            GRNH_SupplierRef.SetEnabled(true);
            GRNH_DeliveryDate.SetEnabled(true);
            GRNH_SetVenAddress.SetEnabled(true);
            GRNH_PackingDetails.SetEnabled(true);
            GRNH_DeliveryDetails.SetEnabled(true);
            GRNH_TransportationDetails.SetEnabled(true);
        }
        else {
            GRNH_PrNumber.SetEnabled(false);
            GRNH_SupplierRef.SetEnabled(false);
            GRNH_DeliveryDate.SetEnabled(false);
            GRNH_SetVenAddress.SetEnabled(false);
            GRNH_PackingDetails.SetEnabled(false);
            GRNH_DeliveryDetails.SetEnabled(false);
            GRNH_TransportationDetails.SetEnabled(false);
        }
    }

    function PR_Selected() {
        cbp_GRN.PerformCallback('CHECK');
    }

    function cbp_GRN_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                PopupGRN.Show();
                PageControl_PopupGRN.GetTab(1).SetVisible(false);  
                PageControl_PopupGRN.GetTab(2).SetVisible(false); 
                //PageControl_PopupGRN.SetActiveTab(PageControl_PopupGRN.GetTab(0)); //focus on terimaan barang tab

                Manage_Toolbar_PopupGRN(false, true, true, false, true, false, false);
                PopupGRN.SetWidth(screen.width * 0.9);
                PopupGRN.SetHeight(screen.height * 0.8);
            }
        }
    }


        //MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        //MainRibbon.GetItemByName("Impot").SetEnabled(false);
        //MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        //MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        //MainRibbon.GetItemByName("Lampiran").SetEnabled(false);

        //if (s.cpErrMsg.toString() != '')
        //{
        //    popupMsg_Label.SetText(s.cpErrMsg.toString());
        //    popupMsg.Show();
        //    popupMsg_BtnOk.Focus();

        //    if (s.cpMode.toString() == 'CHECK')
        //    {
        //        GRNH_PrNumber.SetValue(null);
        //    }
        //}
        //else
        //{   
        //    if (s.cpMode.toString() == 'LOAD')
        //    {
        //        popupLookupGRN.Hide();
        //    }

        //    //item list
        //    Senarai_PrNumber.SetText(GRNH_PrNumber.GetText());
        //    Senarai_Revision.SetText(GRNH_Revision.GetText());
        //    Senarai_ProcessId.SetText(GRNH_ProcessId.GetText());
        //    Senarai_Status.SetText(GRNH_Status.GetText());

        //    //grn ref
        //    Ref_GrnVersion.SetText(GRNH_Revision.GetText());
        //    Ref_GrnProcessId.SetText(GRNH_ProcessId.GetText());

        //    //aliran kerja
        //    Wf_ProcessId.SetText(GRNH_ProcessId.GetText());

        //    //checklist
        //    chkList_ProcessId.SetText(GRNH_ProcessId.GetText());

        //    GridGrnDetails.PerformCallback();
        //    cbp_GrnRef.PerformCallback();
        //    cbp_Checklist.PerformCallback('LOAD');
        //    GridGrnWorkflow.PerformCallback();

        //    if (GRNH_Status.GetText() == "3")
        //    {
        //        //Ketua PTJ approval required
        //        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        //        EnableDisableHeaderForm('false');
        //        cbp_Workflow.PerformCallback();
        //    }
        //    else if (GRNH_Status.GetText() == "2") {
        //        EnableDisableHeaderForm('true');
        //        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true', 'true');
        //    }
        //    else if (GRNH_Status.GetText() == "9") {
        //        EnableDisableHeaderForm('false');
        //        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        //    }
        //    else if (s.cpMode.toString() == 'NEW')
        //    {
        //        PopupGRN.Show();
        //        EnableDisableHeaderForm(true)
        //        PageControl_PopupGRN.GetTab(1).SetVisible(false);  //hide senarai semak
        //        PageControl_PopupGRN.GetTab(2).SetVisible(false); //hide aliran kerja
        //        PageControl_PopupGRN.SetActiveTab(PageControl_PopupGRN.GetTab(0)); //focus on terimaan barang tab
        //    }
        //}
</script>

<dx:ASPxCallbackPanel ID="cbp_GRN" runat="server" ClientInstanceName="cbp_GRN" EnableClientSideAPI="True" OnCallback="cbp_GRN_Callback" Width="100%" ShowLoadingPanel="False">
    <SettingsLoadingPanel Enabled="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_GRN_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pembekal" ColCount="3" ColSpan="2" Width="70%">
                <Items>
                    <dx:LayoutGroup GroupBoxDecoration="None" Width="15%">
                        <Items>
                            <dx:LayoutItem Caption="No. PO" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridLookup ID="GRNH_PrNumber" runat="server" AutoGenerateColumns="False" ClientInstanceName="GRNH_PrNumber" CssClass="TextBoxForId" DataSourceID="odsPR" EnableClientSideAPI="True" OnInit="GRNH_PrNumber_Init" TextFormatString="{1}" Width="100%">
                                            <GridViewProperties>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                            </GridViewProperties>
                                            <GridViewClientSideEvents FocusedRowChanged="function(s, e) {
	PR_Selected();
}" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Instruction" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ReferenceNumber" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="RequesterId" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="RequestorName" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementTypeId" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementTypeName" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementCategoryId" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementCategory" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementMethodId" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcurementMethod" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ReceiverId" ShowInCustomizationForm="True" VisibleIndex="11">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SupplierId" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SupplierName" ShowInCustomizationForm="True" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="RevisionNumber" ShowInCustomizationForm="True" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ProcessId" ShowInCustomizationForm="True" VisibleIndex="15">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="PrNumber" ShowInCustomizationForm="True" VisibleIndex="16">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="StatusName" ShowInCustomizationForm="True" VisibleIndex="17">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Deleted" ShowInCustomizationForm="True" VisibleIndex="19">
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="20">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UpdatedBy" ShowInCustomizationForm="True" VisibleIndex="21">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" ValueChanged="function(s, e) {
	GRNH_PrNumber_ValueChanged(s, e);
}" />
                                        </dx:ASPxGridLookup>
                                        <asp:ObjectDataSource ID="odsPR" runat="server" SelectMethod="FindAll" TypeName="Data.Models.PurchaseRequestModel"></asp:ObjectDataSource>
                                        <asp:SqlDataSource ID="PrDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="PrDs_Selecting" SelectCommand="SP_GRN_LoadPrGridLookup" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="CurrUser" Type="Int32" />
                                                <asp:Parameter Name="Mode" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="No. Rujukan Pembekal" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="GRNH_SupplierRef" runat="server" ClientInstanceName="GRNH_SupplierRef" CssClass="TextBoxForId">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup GroupBoxDecoration="None" Width="40%">
                        <Items>
                            <dx:LayoutItem Caption="Nama Pembekal" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="GRNH_SetVen_Name" runat="server" ClientEnabled="False" ClientInstanceName="GRNH_SetVen_Name" EnableClientSideAPI="True" Width="100%">
                                        </dx:ASPxTextBox>
                                        <br />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Alamat Pembekal" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="GRNH_SetVenAddress" runat="server" ClientInstanceName="GRNH_SetVenAddress" CssClass="MemoBoxAlamatPembekal" EnableClientSideAPI="True" Rows="4" Width="100%">
                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:EmptyLayoutItem Width="45%">
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Penghantaran &amp; Bungkusan" ColCount="3" ColSpan="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Butiran Bungkusan" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="GRNH_PackingDetails" runat="server" ClientInstanceName="GRNH_PackingDetails" EnableClientSideAPI="True" Rows="3" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Butiran Penghantaran" Width="34%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="GRNH_DeliveryDetails" runat="server" ClientInstanceName="GRNH_DeliveryDetails" EnableClientSideAPI="True" Rows="3" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Butiran Pengangkutan" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="GRNH_TransportationDetails" runat="server" ClientInstanceName="GRNH_TransportationDetails" EnableClientSideAPI="True" Rows="3" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Terimaan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="GRNH_DeliveryDate" runat="server" ClientInstanceName="GRNH_DeliveryDate" EnableClientSideAPI="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nota Kredit">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxCheckBox ID="ASPxFormLayout1_E2" runat="server" CheckState="Unchecked" Width="20%">
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Item" ColSpan="2" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="ASPxFormLayout1_E3" runat="server" AutoPostBack="False" Text="Tambah">
                                    <ClientSideEvents Click="function(s, e) {
	NewItem_BtnAddProject_Click();
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <uc1:Tab_SenaraiItem_Controller ID="Tab_SenaraiItem_Controller1" runat="server" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="GRNH_ProcessId" runat="server" ClientInstanceName="GRNH_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="GRNH_Revision" runat="server" ClientInstanceName="GRNH_Revision" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="HeaderMode" runat="server" ClientInstanceName="HeaderMode" EnableClientSideAPI="True" Text="0" Width="170px" ClientVisible="False">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="GRNH_Status" runat="server" ClientInstanceName="GRNH_Status" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="GRNH_PtjId" ClientVisible="false" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


<dx:ASPxCallbackPanel ID="cbp_GrnSavePost" runat="server" ClientInstanceName="cbp_GrnSavePost" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_GrnSavePost_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
cbp_GrnSavePost_EndCallback(s, e);	
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Tambah Maklumat Item" Width="100%">
                <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" ColCount="2" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Delivery Order">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Invois No">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ColSpan="2" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="GridAddItem" runat="server" AutoGenerateColumns="False" DataSourceID="GrnItemsDs" Width="100%" ClientInstanceName="GridAddItem" KeyFieldName="GRND_RowId">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="GRND_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_Revision" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRNH_PrNumber" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Terima" FieldName="GRND_ItemNumber" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="PRI_Desc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRND_Type" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Kos Seunit (RM)" FieldName="GRND_UnitPrice" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn Caption="Selenggara" FieldName="GRND_Maintenance" ShowInCustomizationForm="True" VisibleIndex="15">
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="Perihal Kerosakan" FieldName="GRND_DamagedNotes" ShowInCustomizationForm="True" VisibleIndex="16">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="GRND_OtherNotes" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Kuantiti" ShowInCustomizationForm="True" VisibleIndex="9">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Dipesan" FieldName="PRI_Qty" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Telah Diterima" FieldName="GRND_ReceivedPreviously" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Terimaan" FieldName="GRND_ReceivedToDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ditolak" FieldName="GRND_Rejected" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Balance" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                        </Columns>
                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="GrnItemsDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_GRN_LoadItem" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="ProcessId" Type="String" />
                                            <asp:Parameter Name="Revision" Type="Int32" />
                                            <asp:Parameter Name="PrNumber" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
                    </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

            



