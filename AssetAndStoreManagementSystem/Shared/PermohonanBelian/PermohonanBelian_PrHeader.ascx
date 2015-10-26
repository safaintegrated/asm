<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_PrHeader.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PermohonanBelian.PermohonanBelian_PrHeader" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_PermohonanBelian_PrHeader_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'NEW')
            {
                //tab management
                PageControl_PopupPr.GetTab(1).SetVisible(false);  //hide item tab
                PageControl_PopupPr.GetTab(2).SetVisible(false);  //hide senarai semak tab
                PageControl_PopupPr.GetTab(3).SetVisible(false);  //hide aliran kerja tab
                PageControl_PopupPr.SetActiveTab(PageControl_PopupPr.GetTab(0));  //focus on utama tab

                //popup toolbar management
                Manage_Toolbar_PopupPr(false, true, true, false, false, false, false);

                //popup management
                PopupPr.SetWidth(screen.width * 0.9);
                PopupPr.SetHeight(screen.height * 0.8);
                PopupPr.SetHeaderText('Permohonan Belian - Rekod Baharu');
                PopupPr.Show();
                PRH_Purpose.Focus();
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                //tab management
                PageControl_PopupPr.GetTab(1).SetVisible(true);  //hide item tab
                PageControl_PopupPr.GetTab(2).SetVisible(true);  //hide senarai semak tab
                PageControl_PopupPr.GetTab(3).SetVisible(true);  //hide aliran kerja tab

                //main grid management
                MainGrid.PerformCallback();

                //screen management
                if (PRH_ProcessId.GetText() == '')  //new PR mode
                {
                    //tab utama
                    PRH_ProcessId.SetText(s.cpReturnProcessId.toString());
                    PRH_Revision.SetText(s.cpReturnRevNumber.toString());

                    //tab item
                    TabItem_ProcessId.SetText(s.cpReturnProcessId.toString());
                    TabItem_RevNum.SetText(s.cpReturnRevNumber.toString());
                    TabItemGrid.PerformCallback();
                    EnableDisableItemForm(true);

                    //show notifications
                    popupMsg_Label.SetText('Rekod Permohonan Belian telah disimpan dengan jayanya.<br>Anda kini boleh memasukkan maklumat item untuk permohonan ini.');
                    popupMsg.Show();
                }
                else //existing PR is being viewed
                {
                    //show notifications
                    popupMsg_Label.SetText('Rekod Permohonan Belian telah disimpan dengan jayanya.');
                    popupMsg.Show();

                    //tab utama
                    EnableDisableUtamaForm(false);
                }
            }
            else if (s.cpMode.toString() == 'VIEW')
            {
                //tab utama
                PageControl_PopupPr.SetActiveTab(PageControl_PopupPr.GetTab(0));  //focus on utama tab
                EnableDisableUtamaForm(false);

                //tab item
                PageControl_PopupPr.GetTab(1).SetVisible(true);  //hide item tab
                TabItem_ProcessId.SetText(PRH_ProcessId.GetText());
                TabItem_RevNum.SetText(PRH_Revision.GetText());
                TabItemGrid.PerformCallback();
                EnableDisableItemForm(false);

                PageControl_PopupPr.GetTab(2).SetVisible(true);  //hide senarai semak tab
                PageControl_PopupPr.GetTab(3).SetVisible(true);  //hide aliran kerja tab

                //popup management
                PopupPr.SetWidth(screen.width * 0.9);
                PopupPr.SetHeight(screen.height * 0.8);
                PopupPr.SetHeaderText('Permohonan Belian - No. Transaksi: ' + PRH_ProcessId.GetText());
                PopupPr.Show();
                PRH_Purpose.Focus();
            }
        }
    }

    function PRH_SupplierCode_ValueChanged(s, e)
    {
        if (s.GetText() != '')
        {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'apsu_address1;apsu_address2;apsu_address3;apsu_address4;apglc_controlglac;glac_desc', FillSupplierInformation);
        }        
    }

    function FillSupplierInformation(Values)
    {
        PRH_VendorAddress1.SetText(Values[0].toString());

        if(Values[1] != null)
            PRH_VendorAddress2.SetText(Values[1].toString());

        if(Values[2] != null)
            PRH_VendorAddress3.SetText(Values[2].toString());

        if(Values[3] != null)
            PRH_VendorAddress4.SetText(Values[3].toString());

        if(Values[4] != null)
            PRH_SupplierGLCode.SetText(Values[4].toString());

        if(Values[5] != null)
            PRH_SupplierGLDesc.SetText(Values[5].toString());
    }

    function PRH_RequestBy_ValueChanged(s, e)
    {
        if (s.GetText() != '')
        {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'utem_code', FillSagaCode);
        }
    }

    function FillSagaCode(Value)
    {
        PTJ_SagaCode.SetText(Value.toString());
    }


    function PRH_PurchaserId_ValueChanged(s, e) {
        if (s.GetText() != '') {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'puda_delivaddress1;puda_delivaddress2;puda_delivaddress3', FillPurchaserAddress);
        }
    }

    function FillPurchaserAddress(Values)
    {
        if (Values[0] != null)
            PRH_DeliveryAdd1.SetText(Values[0].toString());

        if (Values[1] != null)
            PRH_DeliveryAdd2.SetText(Values[1].toString());

        if (Values[2] != null)
            PRH_DeliveryAdd3.SetText(Values[2].toString());
    }

    function EnableDisableUtamaForm(EnableDisable) {
        PRH_Purpose.SetEnabled(EnableDisable);
        PRH_DeliveryInstruction.SetEnabled(EnableDisable);
        PRH_RequestBy.SetEnabled(EnableDisable);
        PRH_ProcurementITypeId.SetEnabled(EnableDisable);
        PRH_ProcurementCatId.SetEnabled(EnableDisable);
        PRH_ProcurementMethodId.SetEnabled(EnableDisable);
        PRH_PurchaserId.SetEnabled(EnableDisable);
        PRH_SupplierCode.SetEnabled(EnableDisable);
    }

    //** TO EASE FUNCTION CALLING.  TO BE REMOVED BEFORE LIVE
    //function Manage_Toolbar_PopupPr(btnEdit, btnSave, btnSubmit, btnCancel, btnWithdraw, btnApprove, btnReject) {
    //    Toolbar_PopupPr.GetItemByName('btnEdit').SetEnabled(btnEdit);
    //    Toolbar_PopupPr.GetItemByName('btnSave').SetEnabled(btnSave);
    //    Toolbar_PopupPr.GetItemByName('btnSubmit').SetEnabled(btnSubmit);
    //    Toolbar_PopupPr.GetItemByName('btnCancel').SetEnabled(btnCancel);
    //    Toolbar_PopupPr.GetItemByName('btnWithdraw').SetEnabled(btnWithdraw);
    //    Toolbar_PopupPr.GetItemByName('btnApprove').SetEnabled(btnApprove);
    //    Toolbar_PopupPr.GetItemByName('btnReject').SetEnabled(btnReject);
    //}
</script>
<dx:ASPxCallbackPanel ID="cbp_PermohonanBelian_PrHeader" runat="server" ClientInstanceName="cbp_PermohonanBelian_PrHeader" OnCallback="cbp_PermohonanBelian_PrHeader_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_PermohonanBelian_PrHeader_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pembelian" Width="100%" ColCount="4">
                <Items>
                    <dx:LayoutItem Caption="Perihal Belian" ColSpan="2" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="PRH_Purpose" runat="server" ClientInstanceName="PRH_Purpose" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Arahan" ColSpan="2" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="PRH_DeliveryInstruction" runat="server" ClientInstanceName="PRH_DeliveryInstruction" EnableClientSideAPI="True" Rows="4" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Dimohon Oleh" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_RequestBy" runat="server" AutoGenerateColumns="False" ClientInstanceName="PRH_RequestBy" DataSourceID="RequestByDs" EnableClientSideAPI="True" Width="100%" KeyFieldName="utem_name" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="utem_name" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Nama Pemohon">
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="utem_desc" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="utem_code" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents ValueChanged="function(s, e) {
	PRH_RequestBy_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="RequestByDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT * FROM [UT_Email] WHERE ([utem_code] IS NOT NULL) ORDER BY [utem_name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Jenis Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementITypeId" runat="server" ClientInstanceName="PRH_ProcurementITypeId" EnableClientSideAPI="True" Width="100%" DataSourceID="ProcurementTypeDs" TextField="ProcurementTypeName" ValueField="ProcurementITypeId" ValueType="System.Int32">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="ProcurementTypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementType] ORDER BY [ProcurementTypeName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kategori Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementCatId" runat="server" ClientInstanceName="PRH_ProcurementCatId" EnableClientSideAPI="True" Width="100%" DataSourceID="ProcurementCatDs" TextField="ProcurementCatName" ValueField="ProcurementCatId" ValueType="System.Int32">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="ProcurementCatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementCategory] ORDER BY [ProcurementCatName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kaedah Perolehan" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="PRH_ProcurementMethodId" runat="server" ClientInstanceName="PRH_ProcurementMethodId" EnableClientSideAPI="True" Width="100%" DataSourceID="ProcurementMethodDs" TextField="ProcurementMethodName" ValueField="ProcurementMethodId" ValueType="System.Int32">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="ProcurementMethodDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [ProcurementMethod] ORDER BY [ProcurementMethodName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Hantar Kepada" ColCount="4">
                <Items>
                    <dx:LayoutItem Caption="Penerima" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_PurchaserId" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="PRH_PurchaserId" AutoGenerateColumns="False" DataSourceID="ReceipientDs" KeyFieldName="puda_purchaserid" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Hantar Kepada" FieldName="puda_purchaserid" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="puda_delivaddress1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="puda_delivaddress2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="puda_delivaddress3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents ValueChanged="function(s, e) {
	PRH_PurchaserId_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="ReceipientDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT * FROM [PU_Deliveryadd] ORDER BY [puda_purchaserid]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd1" ClientInstanceName="PRH_DeliveryAdd1" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd2" ClientInstanceName="PRH_DeliveryAdd2" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_DeliveryAdd3" ClientInstanceName="PRH_DeliveryAdd3" runat="server" EnableClientSideAPI="True" Width="100%" ClientEnabled="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Pembekal" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Nama Pembekal" Width="60%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PRH_SupplierCode" runat="server" AutoGenerateColumns="False" DataSourceID="VendorDs" KeyFieldName="apsu_suppid" TextFormatString="{1}" Width="100%" ClientInstanceName="PRH_SupplierCode" EnableClientSideAPI="True">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="true"/>
                                        
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Pembekal" FieldName="apsu_suppid" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nama Pembekal" FieldName="apsu_lname" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="apsu_address1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="apsu_address2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="apsu_address3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="apsu_address4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="apglc_controlglac" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="glac_desc" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" ValueChanged="function(s, e) {
	PRH_SupplierCode_ValueChanged(s, e);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="VendorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SELECT [apsu_suppid], [apsu_lname], [apsu_address1], [apsu_address2], [apsu_address3], [apsu_address4], [apglc_controlglac], [glac_desc] FROM [AP_Supplier] WHERE (([apglc_controlglac] IS NOT NULL) AND ([apsu_status] = @apsu_status)) ORDER BY [apsu_suppid]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="O" Name="apsu_status" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kod GL Pembekal" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_SupplierGLCode" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="PRH_SupplierGLCode" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat 1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress1" runat="server" Width="100%" ClientInstanceName="PRH_VendorAddress1" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Keterangan GL">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_SupplierGLDesc" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="PRH_SupplierGLDesc" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat 2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress2" ClientInstanceName="PRH_VendorAddress2" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Alamat 3">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress3" ClientInstanceName="PRH_VendorAddress3" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Alamat 4">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PRH_VendorAddress4" ClientInstanceName="PRH_VendorAddress4" runat="server" Width="100%" ClientEnabled="False" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>

    <dx:ASPxTextBox ID="PRH_ProcessId" ClientInstanceName="PRH_ProcessId" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_Revision" ClientInstanceName="PRH_Revision" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PTJ_SagaCode" ClientInstanceName="PTJ_SagaCode" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_Status" ClientInstanceName="PRH_Status" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
    <dx:ASPxTextBox ID="PRH_PRnumber" ClientInstanceName="PRH_PRnumber" ClientEnabled="false" runat="server" Width="170px" ClientVisible="False">
    </dx:ASPxTextBox> 
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



