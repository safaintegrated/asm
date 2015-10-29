<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PermohonanBelian_PopupNewAsset.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PermohonanBelian.PermohonanBelian_PopupNewAsset" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<script>
    function NewAsset_GLAC_Account_ValueChanged(s, e)
    {
        if (s.GetText() != '') {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'glac_desc', Fill_NewAsset_GLAC_Desc);
        }
    }

    function Fill_NewAsset_GLAC_Desc(value) {
        NewAsset_GLAC_Desc.SetText(Value.toString());
    }

    function NewAsset_PCAC_Account_ValueChanged(s, e) {
        if (s.GetText() != '') {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'pcac_desc', NewAsset_FillProjectDesc);
        }
    }

    function NewAsset_FillProjectDesc(Values)
    { NewAsset_PCAC_Desc.SetText(Values.toString()); }

    function NewAsset_BtnAddGl_Click()
    { cbp_NewAsset_PopupGLDistibution.PerformCallback('NEW'); }

    function NewAsset_BtnAddProject_Click()
    { cbp_NewAsset_PopupProjectDistibution.PerformCallback('NEW'); }

    function NewAsset_Popup_ProjectDistribution_ButtonOk_Click() {
        if (NewAsset_PCAC_Account.GetText() == '' || NewAsset_PCAC_Desc.GetText() == '' || NewAsset_PCAC_Amount.GetText() == '')
        { }
        else
        {
            cbp_NewAsset_PopupProjectDistibution.PerformCallback('SAVE');
        }
    }

    function NewAsset_Popup_ProjectDistribution_ButtonDelete_Click()
    { }

    function cbp_NewAsset_PopupProjectDistibution_EndCallback(s, e) {
        if (s.cpMode.toString() == 'NEW')
        { NewAsset_Popup_ProjectDistribution.Show(); }
        else
        {
            NewAsset_ProjectDistributionGrid.PerformCallback();
            NewAsset_GLDistributionGrid.PerformCallback();
        }
    }

    function NewAsset_Popup_GLDistribution_ButtonOk_Click()
    {
        if (NewAsset_GLAC_Desc.GetText() != '')
        {
            cbp_NewAsset_PopupGLDistibution.PerformCallback('SAVE');
        }
    }

    function NewAsset_Popup_GLDistribution_ButtonDelete_Click()
    { }

    function cbp_NewAsset_PopupGLDistibution_EndCallback(s, e) {
        if (s.cpMode.toString() == 'NEW')
        { NewAsset_Popup_GLDistribution.Show(); }
        else
        {
            NewAsset_ProjectDistributionGrid.PerformCallback();
            NewAsset_GLDistributionGrid.PerformCallback();
        }
    }

    function NewAsset_PRI_TaxCode_ValueChanged(s, e) {
        if (NewAsset_PRI_TaxCode.GetText() != '') {
            var grid = s.GetGridView();
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'uttxl_perc', NewAsset_FillGstCode);
        }
    }

    function NewAsset_FillGstCode(Value) {
        NewAsset_PRI_TaxRate.SetNumber(Value);
        NewAsset_CalculateSubTotal();
    }

    function NewAsset_DeleteComponentConfirmation(Id, AccName) {
        NewAsset_TempDeleteComponent.SetText(Id.toString());
        NewAsset_DeleteCompConfirm_Label.SetText('Padam komponen / aksesori ini (' + AccName + ') ?');
        NewAsset_DeleteCompConfirm.Show();
    }

    function NewAsset_ProceedDeleteComponent() {
        NewAsset_DeleteCompConfirm.Hide();
        cbp_LineItem_NewAsset.PerformCallback('REMOVECOMPONENT');
    }

    function NewAsset_PRI_GLcode_EndCallback(s, e) {
        //if (s.cpErrMsg.toString() != '')
        //{
        //    PopupMessageBox_Label.SetText(s.cpErrMsg.toString());
        //    PopupMessageBox.Show();
        //}
    }

    function NewAsset_CalculateSubTotal() {
        NewAsset_C.SetNumber(NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber());
        NewAsset_E.SetNumber((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) * (NewAsset_PRI_TaxRate.GetNumber() / 100.00));
        NewAsset_F.SetNumber((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) + ((NewAsset_PRI_Qty.GetNumber() * NewAsset_PRI_UnitPrice.GetNumber()) * (NewAsset_PRI_TaxRate.GetNumber() / 100.00)));
    }

    function NewAsset_PRI_CatId_ValueChanged(s, e) {
        if (NewAsset_PRI_CatId.GetText() != '') {
            NewAsset_PRI_SubCatId.SetEnabled(true);
            NewAsset_PRI_SubCatId.GetGridView().PerformCallback();
        }
    }

    function NewAsset_PRI_SubCatId_ValueChanged(s, e) {
        if (NewAsset_PRI_SubCatId.GetValue() != null) {
            NewAsset_GLAC_Account.SetEnabled(true);
            NewAsset_GLAC_Account.GetGridView().PerformCallback();
        }
    }

    function Toolbar_PermohonanBelian_LineItem_NewAsset_ItemClick(s, e) {
        switch (e.item.name) {
            case "btnSave": Item_NewAssetSave(); break;
            case "btnDelete": Item_NewAssetDelete(); break;
        }
    }

    function Item_NewAssetSave() {
        if (NewAsset_PRI_Desc.GetText() == '') {
            PopupMessageBox_Label.SetText('Keterangan belum diisi.<br>Sila semak dan cuba sekali lagi.');
            PopupMessageBox.Show();
        }
        else {
            LoadingPanel.SetText('sistem sedang menyimpan item aset baharu anda.  sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_LineItem_NewAsset.PerformCallback('SAVE');
        }
    }

    function cbp_LineItem_NewAsset_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            PopupMessageBox_Label.SetText(s.cpErrMsg.toString());
            PopupMessageBox.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                Popup_LineItem_NewAsset.SetWidth(screen.width * 0.85);
                Popup_LineItem_NewAsset.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                ItemGrid.PerformCallback();
                GLDistribution_Grid.PerformCallback();
                Popup_LineItem_NewAsset.Hide();
            }
        }
    }

    function Manage_LineItem_NewAsset_Toolbar(btnSave, btnDelete) {
        Toolbar_PermohonanBelian_LineItem_NewAsset.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_PermohonanBelian_LineItem_NewAsset.GetItemByName('btnDelete').SetEnabled(btnDelete);
    }
</script>

<dx:ASPxPopupControl ID="Popup_LineItem_NewAsset" runat="server" ClientInstanceName="Popup_LineItem_NewAsset" CloseAction="CloseButton" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Permohonan Belian - Item Aset Baharu" MaxWidth="1200px" MinHeight="600px" MinWidth="700px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" MaxHeight="700px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_PermohonanBelian_LineItem_NewAsset" runat="server" ClientInstanceName="Toolbar_PermohonanBelian_LineItem_NewAsset" EnableClientSideAPI="True" ItemAutoWidth="False" ItemImagePosition="Top" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_PermohonanBelian_LineItem_NewAsset_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnDelete" Text="Padam">
                            <Image IconID="edit_delete_16x16">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle HorizontalAlign="Center" Width="110px" Wrap="True" />
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxCallbackPanel ID="cbp_LineItem_NewAsset" runat="server" ClientInstanceName="cbp_LineItem_NewAsset" OnCallback="cbp_LineItem_NewAsset_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_LineItem_NewAsset_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="Form_PermohonanBelian_LineItem_NewAsset" runat="server" ClientInstanceName="Form_PermohonanBelian_LineItem_NewAsset" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Aset">
                                        <Items>
                                            <dx:LayoutItem Caption="Pilih Aset">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                        <dx:ASPxGridLookup ID="Form_PermohonanBelian_LineItem_NewAsset_E2" runat="server" DataSourceID="ObjectDataSource1">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                            </GridViewProperties>
                                                        </dx:ASPxGridLookup>
                                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Maklumat Am Item" ColCount="5" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Keterangan Item" Width="66%" ColSpan="5">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                                        <dx:ASPxTextBox ID="NewAsset_PRI_Desc" runat="server" ClientInstanceName="NewAsset_PRI_Desc" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Unit Pengukuran" Width="20%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                                        <dx:ASPxComboBox ID="NewAsset_PRI_UomId" runat="server" ClientInstanceName="NewAsset_PRI_UomId" DataSourceID="UOMds" EnableClientSideAPI="True" TextField="UomDescription" ValueField="UomId" ValueType="System.Int32" Width="100%">
                                                        </dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="UOMds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [UomId], [UomDescription] FROM [MasterUnitOfMeasurement] ORDER BY [UomDescription]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kategori" Width="20%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                                        <dx:ASPxGridLookup ID="NewAsset_PRI_CatId" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_PRI_CatId" DataSourceID="CatDs" EnableClientSideAPI="True" KeyFieldName="CatId" TextFormatString="{1} - ({2})" Width="100%">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                <Settings ShowFilterRow="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="CatId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="CatName" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="VOT" FieldName="CatVot" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" ValueChanged="function(s, e) {
	NewAsset_PRI_CatId_ValueChanged(s, e);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="CatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [CatId], [CatName], [CatVot] FROM [Category] ORDER BY [CatName], [CatVot]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="1" Name="CatId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Sub-Kategori" Width="20%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                                        <dx:ASPxGridLookup ID="NewAsset_PRI_SubCatId" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_PRI_SubCatId" DataSourceID="SubCatDs" EnableClientSideAPI="True" KeyFieldName="SubCatId" TextFormatString="{1} - ({2})" Width="100%">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="SubCatId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="SubCatName" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="VOT" FieldName="SubCatGLAsset" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" ValueChanged="function(s, e) {
	NewAsset_PRI_SubCatId_ValueChanged(s, e);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="SubCatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" OnSelecting="SubCatDs_Selecting" SelectCommand="SELECT [SubCatId], [SubCatName], [SubCatGLAsset] FROM [SubCategory] WHERE ([CatId] = @CatId) ORDER BY [SubCatName], [SubCatGLAsset]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="1" Name="CatId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Jenis" Width="20%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                                        <dx:ASPxGridLookup ID="NewAsset_PRI_TypeId" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_PRI_TypeId" DataSourceID="TypeDs" EnableClientSideAPI="True" KeyFieldName="T_Id" Width="100%">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="T_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Jenis" FieldName="T_Desc" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="TypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [T_Id], [T_Desc] FROM [AssetStockType] WHERE (([T_CatId] = @T_CatId) AND ([T_SubCatId] = @T_SubCatId)) ORDER BY [T_Desc]">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="T_CatId" Type="Int32" />
                                                                <asp:Parameter Name="T_SubCatId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kod GST" Width="20%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                                        <dx:ASPxGridLookup ID="NewAsset_PRI_TaxCode" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_PRI_TaxCode" DataSourceID="PRI_TaxCodeDs" EnableClientSideAPI="True" KeyFieldName="uttxl_code" TextFormatString="{1} ({3} %)" Width="100%">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                <Settings ShowFilterRow="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Company" FieldName="uttxh_company" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Code" FieldName="uttxl_code" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Description" FieldName="uttxl_shortdesc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="GST %" FieldName="uttxl_perc" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                                    <PropertiesTextEdit DisplayFormatString="n2">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="GL Code" FieldName="apcd_vatglac" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="35%">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" ValueChanged="function(s, e) {
	NewAsset_PRI_TaxCode_ValueChanged(s, e);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="PRI_TaxCodeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="PRI_TaxCodeDs_Selecting" SelectCommand="SP_UT_Taxtypeline" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Jumlah Kecil dan GST" Width="100%" ColCount="7">
                                        <Items>
                                            <dx:LayoutItem Caption="Kuantiti (A)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_PRI_Qty" runat="server" ClientInstanceName="NewAsset_PRI_Qty" DisplayFormatString="n0" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                            <ClientSideEvents ValueChanged="function(s, e) {
	NewAsset_CalculateSubTotal();
}" />
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kos Seunit (B)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_PRI_UnitPrice" runat="server" ClientInstanceName="NewAsset_PRI_UnitPrice" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                            <ClientSideEvents ValueChanged="function(s, e) {
	NewAsset_CalculateSubTotal();
}" />
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="C = (A x B)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_C" runat="server" ClientEnabled="False" ClientInstanceName="NewAsset_C" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="% GST (D)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_PRI_TaxRate" runat="server" ClientEnabled="False" ClientInstanceName="NewAsset_PRI_TaxRate" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="E =(D x C)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_E" runat="server" ClientEnabled="False" ClientInstanceName="NewAsset_E" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="F = (C + E)" Width="16%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxSpinEdit ID="NewAsset_F" runat="server" ClientEnabled="False" ClientInstanceName="NewAsset_F" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100%">
                                                            <SpinButtons ShowIncrementButtons="False">
                                                            </SpinButtons>
                                                        </dx:ASPxSpinEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:EmptyLayoutItem Width="4%">
                                            </dx:EmptyLayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Komponen dan Aksesori" Width="100%">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxHyperLink ID="NewAsset_AddNewComponentHyperlink" runat="server" ClientInstanceName="NewAsset_AddNewComponentHyperlink" EnableClientSideAPI="True" NavigateUrl="javascript: cbp_LineItem_NewAsset.PerformCallback('ADDCOMPONENT');" Text="tambah komponen / aksesori">
                                                        </dx:ASPxHyperLink>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="NewAsset_ComponentGrid" runat="server" AutoGenerateColumns="False" KeyFieldName="PRIC_ProcessId" OnHtmlDataCellPrepared="NewAsset_ComponentGrid_HtmlDataCellPrepared" Width="100%">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="PRIC_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="PRIC_Revision" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="PRIC_ItemNumber" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Padam" FieldName="PRIC_ComponentNumber" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="5%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxHyperLink ID="PRIC_ComponentNumber" runat="server" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" Text="ASPxHyperLink">
                                                                        </dx:ASPxHyperLink>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="PRIC_Desc" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxTextBox ID="PRIC_Desc" runat="server" EnableClientSideAPI="true" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Jenama" FieldName="PRIC_Brand" ShowInCustomizationForm="True" VisibleIndex="1" Width="20%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxTextBox ID="PRIC_Brand" runat="server" EnableClientSideAPI="true" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Model" FieldName="PRIC_Model" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxTextBox ID="PRIC_Model" runat="server" EnableClientSideAPI="true" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Kuantiti" FieldName="PRIC_Qty" ShowInCustomizationForm="True" VisibleIndex="3" Width="5%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxSpinEdit ID="PRIC_Qty" runat="server" DisplayFormatString="n0" EnableClientSideAPI="true" HorizontalAlign="Right" Number="0" SpinButtons-ShowIncrementButtons="false" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Kos Seunit" FieldName="PRIC_UnitCost" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxSpinEdit ID="PRIC_UnitCost" runat="server" DisplayFormatString="n2" EnableClientSideAPI="true" HorizontalAlign="Right" Number="0" SpinButtons-ShowIncrementButtons="false" Width="100%">
                                                                        </dx:ASPxSpinEdit>
                                                                    </DataItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
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
                                    <dx:LayoutGroup Caption="Distribusi Projek dan Lejar" ColCount="2" Width="100%">
                                        <Items>
                                            <dx:LayoutGroup Caption="Projek" Width="50%">
                                                <Items>
                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxButton ID="NewAsset_BtnAddProject" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_BtnAddProject" EnableClientSideAPI="True" Text="Tambah">
                                                                    <ClientSideEvents Click="function(s, e) {
	NewAsset_BtnAddProject_Click();
}" />
                                                                </dx:ASPxButton>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridView ID="NewAsset_ProjectDistributionGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_ProjectDistributionGrid" DataSourceID="NewAsset_ProjectDistributionGridDs" OnCustomCallback="NewAsset_ProjectDistributionGrid_CustomCallback" Width="100%">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PRPROJDIS_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Kod Projek" FieldName="PRPROJDIS_ProjectCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="20%">
                                                                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="PRPROJDIS_Desc" ShowInCustomizationForm="True" VisibleIndex="2" Width="60%">
                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Jumlah" FieldName="PRPROJDIS_Value" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                                                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsPager Mode="ShowAllRecords">
                                                                    </SettingsPager>
                                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                    <Styles>
                                                                        <AlternatingRow Enabled="True">
                                                                        </AlternatingRow>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                                <asp:SqlDataSource ID="NewAsset_ProjectDistributionGridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="NewAsset_ProjectDistributionGridDs_Selecting" SelectCommand="SELECT [PRPROJDIS_RowId], [PRPROJDIS_ProjectCode], [PRPROJDIS_Desc], [PRPROJDIS_Value] FROM [PR_ProjDistribution] WHERE (([PRPROJDIS_ProcessId] = @PRPROJDIS_ProcessId) AND ([PRPROJDIS_Rev] = @PRPROJDIS_Rev) AND ([PRPROJDIS_ItemNumber] = @PRPROJDIS_ItemNumber))">
                                                                    <SelectParameters>
                                                                        <asp:Parameter Name="PRPROJDIS_ProcessId" Type="String" />
                                                                        <asp:Parameter Name="PRPROJDIS_Rev" Type="Int32" />
                                                                        <asp:Parameter Name="PRPROJDIS_ItemNumber" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Lejar" Width="50%">
                                                <Items>
                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxButton ID="NewAsset_BtnAddGl" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_BtnAddGl" EnableClientSideAPI="True" Text="Tambah">
                                                                    <ClientSideEvents Click="function(s, e) {
	NewAsset_BtnAddGl_Click();
}" />
                                                                </dx:ASPxButton>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ShowCaption="False" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridView ID="NewAsset_GLDistributionGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="NewAsset_GLDistributionGrid" DataSourceID="NewAsset_GLDistGridDs" OnCustomCallback="NewAsset_GLDistributionGrid_CustomCallback" Width="100%">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PRGLDIS_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="T" FieldName="PRGILDIS_GL_Type" ShowInCustomizationForm="True" VisibleIndex="1" Width="5%">
                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Dr/Cr" FieldName="PRGLDIS_TransType" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Kod GL" FieldName="PRGLDIS_GLCode" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%">
                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="PRGLDIS_Desc" ShowInCustomizationForm="True" VisibleIndex="3" Width="50%">
                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Jumlah" FieldName="PRGLDIS_Value" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                                            <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                                            <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsPager Mode="ShowAllRecords">
                                                                    </SettingsPager>
                                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                                    <Styles>
                                                                        <AlternatingRow Enabled="True">
                                                                        </AlternatingRow>
                                                                    </Styles>
                                                                </dx:ASPxGridView>
                                                                <asp:SqlDataSource ID="NewAsset_GLDistGridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="NewAsset_GLDistGridDs_Selecting" SelectCommand="SELECT [PRGLDIS_RowId], [PRGILDIS_GL_Type], [PRGLDIS_TransType], [PRGLDIS_GLCode], [PRGLDIS_Desc], [PRGLDIS_Value] FROM [PR_GLDistribution] WHERE (([PRGLDIS_ProcessId] = @PRGLDIS_ProcessId) AND ([PRGLDIS_Rev] = @PRGLDIS_Rev) AND ([PRGLDIS_ItemNumber] = @PRGLDIS_ItemNumber))">
                                                                    <SelectParameters>
                                                                        <asp:Parameter Name="PRGLDIS_ProcessId" Type="String" />
                                                                        <asp:Parameter Name="PRGLDIS_Rev" Type="Int32" />
                                                                        <asp:Parameter Name="PRGLDIS_ItemNumber" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                                <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                                <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                            </dx:ASPxFormLayout>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxTextBox ID="NewAsset_PRI_ProcessId" runat="server" ClientInstanceName="NewAsset_PRI_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="NewAsset_PRI_ItemNumber" runat="server" ClientInstanceName="NewAsset_PRI_ItemNumber" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="NewAsset_PRI_Revision" runat="server" ClientInstanceName="NewAsset_PRI_Revision" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>



<dx:ASPxTextBox ID="NewAsset_TempDeleteComponent" runat="server" ClientInstanceName="NewAsset_TempDeleteComponent" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


<dx:ASPxPopupControl ID="NewAsset_DeleteCompConfirm" runat="server" ClientInstanceName="NewAsset_DeleteCompConfirm" CloseAction="None" CloseAnimationType="Fade" HeaderText="Notifikasi Sistem" PopupAnimationType="Fade" ShowCloseButton="False" Width="400px" EnableClientSideAPI="True" ShowFooter="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True">
    <FooterTemplate>
        <div style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="NewAsset_DeleteCompConfirm_ButtonOk" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_DeleteCompConfirm_ButtonOk" EnableClientSideAPI="True" Text="Ok" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_ProceedDeleteComponent();
}" />
            </dx:ASPxButton>
            &nbsp;&nbsp;
             <dx:ASPxButton ID="NewAsset_DeleteCompConfirm_ButtonCancel" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_DeleteCompConfirm_ButtonCancel" EnableClientSideAPI="True" Text="Batal" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_DeleteCompConfirm.Hide();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:40px; vertical-align:central; text-align:center;">
                <dx:ASPxImage ID="NewAsset_DeleteCompConfirm_Icon" runat="server" ImageUrl="~/Public/Images/Icons/PopupMsg_Ok-32x32.png" ClientInstanceName="NewAsset_DeleteCompConfirm_Icon" EnableClientSideAPI="True">
                </dx:ASPxImage>
            </td>
            <td style="width:auto; vertical-align:central; text-align:left; padding-left:5px;">
                <dx:ASPxLabel ID="NewAsset_DeleteCompConfirm_Label" runat="server" ClientInstanceName="NewAsset_DeleteCompConfirm_Label" EnableClientSideAPI="True" Text="ASPxLabel" EncodeHtml="False">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="NewAsset_Popup_GLDistribution" runat="server" ClientInstanceName="NewAsset_Popup_GLDistribution" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Distribusi Lejar" PopupAnimationType="Fade" Width="500px" EnableClientSideAPI="True" ShowFooter="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True">
    <FooterTemplate>
        <div style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="NewAsset_Popup_GLDistribution_ButtonOk" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_Popup_GLDistribution_ButtonOk" EnableClientSideAPI="True" Text="Ok" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_Popup_GLDistribution_ButtonOk_Click();
}" />
            </dx:ASPxButton>
            &nbsp;&nbsp;
             <dx:ASPxButton ID="NewAsset_Popup_GLDistribution_ButtonDelete" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_Popup_GLDistribution_ButtonDelete" EnableClientSideAPI="True" Text="Padam" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_Popup_GLDistribution_ButtonDelete_Click();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
    <dx:ASPxCallbackPanel ID="cbp_NewAsset_PopupGLDistibution" runat="server" EnableCallbackCompression="False" Width="100%" ClientInstanceName="cbp_NewAsset_PopupGLDistibution" OnCallback="cbp_NewAsset_PopupGLDistibution_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
	cbp_NewAsset_PopupGLDistibution_EndCallback(s, e);
}" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent2" runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Kod GL">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server">
                                    <dx:ASPxGridLookup ID="NewAsset_GLAC_Account" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="NewAsset_GLAC_Account" AutoGenerateColumns="False" DataSourceID="GL_AccountDs" KeyFieldName="glac_account" TextFormatString="{0}">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Kod GL" FieldName="glac_account" ShowInCustomizationForm="True" ToolTip="30%" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" ValueChanged="function(s, e) {
	NewAsset_GLAC_Account_ValueChanged(s, e);
}" />
                                    </dx:ASPxGridLookup>
                                    <asp:SqlDataSource ID="GL_AccountDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="GL_AccountDs_Selecting" SelectCommand="SP_GL_Account" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Keterangan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server">
                                    <dx:ASPxTextBox ID="NewAsset_GLAC_Desc" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="NewAsset_GLAC_Desc">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Jumlah">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server">
                                    <dx:ASPxSpinEdit ID="NewAsset_GLAC_Value" runat="server" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" ClientInstanceName="NewAsset_GLAC_Value">
                                        <SpinButtons ShowIncrementButtons="False">
                                        </SpinButtons>
                                    </dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server">
                                    <dx:ASPxTextBox ID="NewAsset_GLAC_RowId" runat="server" ClientVisible="False" EnableClientSideAPI="True" Width="170px" ClientInstanceName="NewAsset_GLAC_RowId">
                                    </dx:ASPxTextBox>
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

<dx:ASPxPopupControl ID="NewAsset_Popup_ProjectDistribution" runat="server" ClientInstanceName="NewAsset_Popup_ProjectDistribution" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Distribusi Projek" PopupAnimationType="Fade" Width="500px" EnableClientSideAPI="True" ShowFooter="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="True">
    <FooterTemplate>
        <div style="width:100%; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="NewAsset_Popup_ProjectDistribution_ButtonOk" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_Popup_ProjectDistribution_ButtonOk" EnableClientSideAPI="True" Text="Ok" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_Popup_ProjectDistribution_ButtonOk_Click();
}" />
            </dx:ASPxButton>
            &nbsp;&nbsp;
             <dx:ASPxButton ID="NewAsset_Popup_ProjectDistribution_ButtonDelete" runat="server" AutoPostBack="False" ClientInstanceName="NewAsset_Popup_ProjectDistribution_ButtonDelete" EnableClientSideAPI="True" Text="Padam" Width="120px">
                <ClientSideEvents Click="function(s, e) {
	NewAsset_Popup_ProjectDistribution_ButtonDelete_Click();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
    <dx:ASPxCallbackPanel ID="cbp_NewAsset_PopupProjectDistibution" runat="server" EnableCallbackCompression="False" Width="100%" ClientInstanceName="cbp_NewAsset_PopupProjectDistibution" OnCallback="cbp_NewAsset_PopupProjectDistibution_Callback">
        <ClientSideEvents EndCallback="function(s, e) {
	cbp_NewAsset_PopupProjectDistibution_EndCallback(s, e);
}" />
        <PanelCollection>
            <dx:PanelContent ID="PanelContent3" runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Kod Projek">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server">
                                    <dx:ASPxGridLookup ID="NewAsset_PCAC_Account" runat="server" EnableClientSideAPI="True" Width="100%" AutoGenerateColumns="False" ClientInstanceName="NewAsset_PCAC_Account" DataSourceID="PC_AccountDs" TextFormatString="{0}" KeyFieldName="pcac_account">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                            <Settings ShowFilterRow="true" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="pcac_account" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Akaun" Width="30%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="pcac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Keterangan" Width="40%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="pcac_glac" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Kod GL" Width="30%">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents ValueChanged="function(s, e) {
	NewAsset_PCAC_Account_ValueChanged(s, e);
}" Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" />
                                    </dx:ASPxGridLookup>
                                    <asp:SqlDataSource ID="PC_AccountDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" SelectCommand="SP_PC_Account" SelectCommandType="StoredProcedure" OnSelecting="PC_AccountDs_Selecting"></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Keterangan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server">
                                    <dx:ASPxTextBox ID="NewAsset_PCAC_Desc" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="NewAsset_PCAC_Desc">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Jumlah">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server">
                                    <dx:ASPxSpinEdit ID="NewAsset_PCAC_Amount" runat="server" DisplayFormatString="n2" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" ClientInstanceName="NewAsset_PCAC_Amount">
                                        <SpinButtons ShowIncrementButtons="False">
                                        </SpinButtons>
                                    </dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server">
                                    <dx:ASPxTextBox ID="NewAsset_PCAC_RowId" runat="server" ClientVisible="False" EnableClientSideAPI="True" Width="170px" ClientInstanceName="NewAsset_PCAC_RowId">
                                    </dx:ASPxTextBox>
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
