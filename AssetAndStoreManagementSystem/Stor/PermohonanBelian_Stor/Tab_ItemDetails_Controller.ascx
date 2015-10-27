<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_ItemDetails_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanBelian_Stor.Tab_ItemDetails_Controller" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />
<style>
    .AddBottomPadding {
        padding-bottom: 15px;
    }
</style>

<script>
    function PRI_GLcode_DropDown(s, e) {
        if (PRI_UnitPrice.GetNumber() == 0) {
            popupMsg_Label.SetText('Sila masukkan kos seunit terlebih dahulu.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
            PRI_GLcode.GetGridView().Refresh();
    }

    function NewIPrtemMode() {
        PRI_CatId.SetEnabled(true);
        PRI_SubCatId.SetEnabled(true);
        PRI_TypeId.SetEnabled(false);
        PRI_ParentId.SetEnabled(false);
        PRI_Desc.SetEnabled(false);
        PRI_UomId.SetEnabled(false);
        PRI_Qty.SetEnabled(false);
        PRI_UnitPrice.SetEnabled(false);
        PRI_ProjectCode.SetEnabled(false);
        PRI_GLcode.SetEnabled(false);
        linkAddComponent.SetEnabled(false);
    }

    function PRI_ProjectCode_EndCallback(s, e)
    { }

    function PRI_GLcode_EndCallback(s, e)
    { }

    function RemoveComponent(ComponentIdToRemove) {
        cbp_SavePRItem.PerformCallback('REMOVECOMPONENT*' + ComponentIdToRemove.toString());
    }

    function CalcaulateItemTotalPrice() {
        if (PRI_Qty.GetText() != '' && PRI_UnitPrice.GetText() != '')
            PRI_Amount.SetNumber(PRI_Qty.GetNumber() * PRI_UnitPrice.GetNumber());
    }

    function BtnSavePrItem_Click() {
        LoadingPanel.SetText('Sistem sedang menyimpan maklumat item permohonan belian.  Sila tunggu sebentar..');
        LoadingPanel.Show();

        if (!CheckItem())
            return;

        //alert('1');
        //if (!CheckPurchaseType())
        //    return;
        //alert('2');

        //if (!CheckComponents())
        //    return;
        //alert('3');

        cbp_SavePRItem.PerformCallback('SAVE');
    }

    function CheckItem() {
        if (
            PRI_PurchaseType.GetText() == '' ||
            PRI_SubCatId.GetText() == '' ||
            PRI_Desc.GetText() == '' ||
            PRI_UomId.GetText() == '' ||
            PRI_Qty.GetNumber() == 0
            ) {
            LoadingPanel.Hide();
            popupMsg_Label.SetText('Pastikan Jenis Belian, Sub-Kategori, Keterangan, Unit Pengukuran dan Kuantiti telah diisi.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
        else {
            return true;
        }
    }

    function CheckPurchaseType() {
        if (PRI_PurchaseType.GetValue().toString() == '1' || PRI_PurchaseType.GetValue().toString() == '6') {
            return true;
        }
        else {
            if (PRI_ParentId.GetValue().toString() == '') {
                LoadingPanel.Hide();
                popupMsg_Label.SetText('Sila pilih ID Aset / Inventori terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
                return false;
            }
            else {
                return true;
            }
        }
    }

    function CheckComponents() {
        var lpass = true;
        var PRC_Desc;
        var PRC_Brand;
        var PRC_Model;
        var PRC_UnitCost;
        var ComponentToCheck;
        var Component_Array = [];

        for (var i = 0; i < GridPrItemComponentListing.GetVisibleRowsOnPage() ; i++) {
            PRC_Desc = ASPxClientControl.GetControlCollection().GetByName('PRC_Desc_' + i.toString());
            PRC_Brand = ASPxClientControl.GetControlCollection().GetByName('PRC_Brand_' + i.toString());
            PRC_Model = ASPxClientControl.GetControlCollection().GetByName('PRC_Model_' + i.toString());

            if (PRC_Desc.GetText() == '' || PRC_Brand.GetText() == '' || PRC_Model.GetText() == '') {
                LoadingPanel.Hide();
                lpass = false;
                popupMsg_Label.SetText('Sila pasti maklumat Keterangan, Jenama dan Model untuk setiap komponen telah diisi.<br>Sila semak dan cuba sekali lagi.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
            else {
                ComponentToCheck = PRC_Desc.GetText() + '*' + PRC_Model.GetText() + '*' + PRC_Model.GetText();

                if (Component_Array.indexOf(ComponentToCheck) == -1) {
                    Component_Array.push(ComponentToCheck);
                }
                else {
                    LoadingPanel.Hide();
                    lpass = false;
                    popupMsg_Label.SetText('Maklumat komponen <b>' + PRC_Desc.GetText() + '</b> wujud lebih daripada 1 kali.<br>Sila semak dan cuba sekali lagi.');
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus();
                }
            }

            if (!lpass)
                break;
        }

        return lpass;
    }

    function CheckComponentsPricing() {
        var PRC_UnitCost;
        var Sum_ComponentPrice = 0.0;

        for (var i = 0; i < GridPrItemComponentListing.GetVisibleRowsOnPage() ; i++) {
            PRC_UnitCost = ASPxClientControl.GetControlCollection().GetByName('PRC_UnitCost_' + i.toString());
            Sum_ComponentPrice = Sum_ComponentPrice + PRC_UnitCost.GetNumber();
        }

        if (Sum_ComponentPrice == 0)
            return true;
        else {
            if (Sum_ComponentPrice == PRI_UnitPrice.GetNumber())
                return true;
            else {
                popupMsg_Label.SetText('Jumlah harga setiap komponen mesti sama dengan Kos Seunit item.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
                return false;
            }
        }
    }

    function AddNewItemComponent() {
        cbp_SavePRItem.PerformCallback('ADDCOMPONENT');
    }

    function cbp_SavePRItem_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            if (s.cpMode.toString() == "LOAD") {
                var PrItemDetailsTab = PR_PageControl.GetTab(1);
                PrItemDetailsTab.SetVisible(true);
                PR_PageControl.SetActiveTabIndex(1);

                if (TabItemDetail_EditMode.GetText() == '0')
                { FormPRItemDetails.SetEnabled(false); }
                else
                {
                    if (PRI_PurchaseType.GetText() == '')
                        NewIPrtemMode();
                    else
                        PRFormSettings(PRI_PurchaseType.GetValue().toString());
                }
            }
            else if (s.cpMode.toString() == 'SAVE') {
                var PrItemDetailsTab = PR_PageControl.GetTab(1);
                PrItemDetailsTab.SetVisible(false);
                PR_PageControl.SetActiveTabIndex(0);
                GridPRItemListing.PerformCallback();
            }

            //if (TabItemDetail_EditMode.GetText() == '0')
            //{ FormPRItemDetails.SetEnabled(false); }
            //else
            //{ FormPRItemDetails.SetEnabled(true); }
        }
    }

    function PRI_PurchaseType_ValueChanged(s, e) {
        //temp remove todo to check it again
        //return;

        if (PRI_PurchaseType.GetValue().toString() == '1') //aset baru
        {
            PRI_ParentId.SetValue(null);
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(1);
        }
        else if (PRI_PurchaseType.GetValue().toString() == '2')  //penyelenggaraan
        {
            PRI_ParentId.SetValue(null);
            PRI_ParentId.GetGridView().Refresh();
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(2);
        }
        else if (PRI_PurchaseType.GetValue().toString() == '3')  //alat ganti
        {
            PRI_ParentId.SetValue(null);
            PRI_ParentId.GetGridView().Refresh();
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(3);
        }
        else if (PRI_PurchaseType.GetValue().toString() == '4') //tambahan
        {
            PRI_ParentId.SetValue(null);
            PRI_ParentId.GetGridView().Refresh();
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(4);
        }
        else if (PRI_PurchaseType.GetValue().toString() == '5') //stok
        {
            PRI_ParentId.SetValue(null);
            PRI_ParentId.GetGridView().Refresh();
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(5);
        }
        else if (PRI_PurchaseType.GetValue().toString() == '6') //lain
        {
            PRI_ParentId.SetValue(null);
            PRI_CatId.SetValue(null);
            PRI_SubCatId.SetValue(null);
            PRI_TypeId.SetValue(null);
            PRFormSettings(6);
        }

        PRI_CatId.GetGridView().Refresh();
        PRI_ParentId.GetGridView().Refresh();
    }

    function PRFormSettings(PurchaseType) {
        if (PurchaseType == '') {
            FormPRItemDetails.SetEnabled(true);
            PRI_PurchaseType.SetEnabled(true);
            PRI_CatId.SetEnabled(true);
            PRI_SubCatId.SetEnabled(true);
            PRI_TypeId.SetEnabled(false);
            PRI_ParentId.SetEnabled(false);
            PRI_Desc.SetEnabled(false);
            PRI_UomId.SetEnabled(false);
            PRI_Qty.SetEnabled(false);
            PRI_UnitPrice.SetEnabled(false);
            PRI_ProjectCode.SetEnabled(false);
            PRI_GLcode.SetEnabled(false);
            linkAddComponent.SetEnabled(false);
            PRI_Amount.SetEnabled(false);
        }
        else if (PurchaseType == 1) {
            FormPRItemDetails.SetEnabled(true);
            PRI_CatId.SetEnabled(true);
            PRI_SubCatId.SetEnabled(true);
            PRI_TypeId.SetEnabled(true);
            PRI_ParentId.SetEnabled(false);
            PRI_Desc.SetEnabled(true);
            PRI_UomId.SetEnabled(true);
            PRI_Qty.SetEnabled(true);
            PRI_UnitPrice.SetEnabled(true);
            PRI_ProjectCode.SetEnabled(true);
            PRI_GLcode.SetEnabled(true);
            linkAddComponent.SetEnabled(true);
            PRI_Amount.SetEnabled(false);
        }
        else if (PurchaseType == 2 || PurchaseType == 3 || PurchaseType == 4 || PurchaseType == 5) {
            FormPRItemDetails.SetEnabled(true);
            PRI_CatId.SetEnabled(true);
            PRI_SubCatId.SetEnabled(true);
            PRI_TypeId.SetEnabled(false);
            PRI_ParentId.SetEnabled(true);
            PRI_Desc.SetEnabled(true);
            PRI_UomId.SetEnabled(true);
            PRI_Qty.SetEnabled(true);
            PRI_UnitPrice.SetEnabled(true);
            PRI_ProjectCode.SetEnabled(true);
            PRI_GLcode.SetEnabled(true);
            linkAddComponent.SetEnabled(true);
            PRI_Amount.SetEnabled(false);
        }
        else if (PurchaseType == 6)  //lain lain
        {
            FormPRItemDetails.SetEnabled(true);
            PRI_CatId.SetEnabled(true);
            PRI_SubCatId.SetEnabled(true);
            PRI_TypeId.SetEnabled(false);
            PRI_ParentId.SetEnabled(false);
            PRI_Desc.SetEnabled(true);
            PRI_UomId.SetEnabled(true);
            PRI_Qty.SetEnabled(true);
            PRI_UnitPrice.SetEnabled(true);
            PRI_ProjectCode.SetEnabled(true);
            PRI_GLcode.SetEnabled(true);
            linkAddComponent.SetEnabled(true);
            PRI_Amount.SetEnabled(false);
        }
    }

</script>
<dx:ASPxCallbackPanel ID="cbp_SavePRItem" runat="server" ClientInstanceName="cbp_SavePRItem" EnableCallbackAnimation="True" OnCallback="cbp_SavePRItem_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>

    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SavePRItem_EndCallback(s, e);
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxFormLayout ID="FormPRItemDetails" runat="server" ClientInstanceName="FormPRItemDetails" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Maklumat Item" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Jenis Belian" CssClass="AddBottomPadding" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" CssClass="AddBottomPadding">
                                        <dx:ASPxComboBox ID="PRI_PurchaseType" runat="server" ClientInstanceName="PRI_PurchaseType" DataSourceID="PurchaseTypeDs" EnableClientSideAPI="True" TextField="PurchaseName" ValueField="PurchaseId" ValueType="System.Int32" Width="10%">
                                            <ClientSideEvents ValueChanged="function(s, e) {
	PRI_PurchaseType_ValueChanged(s, e);
}" />
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="PurchaseId" Visible="False" />
                                                <dx:ListBoxColumn Caption="Jenis Belian" FieldName="PurchaseName" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="PurchaseTypeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PurchaseId], [PurchaseName] FROM [MasterPurchasingType] ORDER BY [PurchaseId]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutGroup Caption="Maklumat Am Item" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                                <Items>
                                    <dx:LayoutItem Caption="Kategori" Width="25%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridLookup ID="PRI_CatId" runat="server" Width="100%" AutoGenerateColumns="False" ClientInstanceName="PRI_CatId" DataSourceID="CatDs" EnableClientSideAPI="True" KeyFieldName="CatId" OnInit="PRI_CatId_Init" IncrementalFilteringDelay="100" MultiTextSeparator="-" TextFormatString="({1}) {2}" OnTextChanged="PRI_CatId_TextChanged">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        <Settings ShowFilterRow="True" />
                                                    </GridViewProperties>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="CatId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CatCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Kod" Width="15%">
                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CatName" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Kategori" Width="85%">
                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <GridViewStyles>
                                                        <AlternatingRow Enabled="True">
                                                        </AlternatingRow>
                                                    </GridViewStyles>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	PRI_SubCatId.GetGridView().Refresh();
alert('a');
	PRI_TypeId.GetGridView().Refresh();
}"
                                                        Init="function(s, e) {
	s.GetGridView().SetWidth(450);
alert('b');
}"
                                                        RowClick="function(s, e) {
	PRI_SubCatId.GetGridView().Refresh();
	//PRI_TypeId.GetGridView().Refresh();
alert('c');

}" />
                                                </dx:ASPxGridLookup>
                                                <asp:SqlDataSource ID="CatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" OnSelecting="CatDs_Selecting" SelectCommand="SP_PR_GetCategories" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="1" Name="PurchaseType" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Sub-Kategori" Width="25%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridLookup ID="PRI_SubCatId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PRI_SubCatId" DataSourceID="SubCatDs" EnableClientSideAPI="True" KeyFieldName="SubCatId" OnInit="PRI_SubCatId_Init" Width="100%" IncrementalFilteringDelay="100" MultiTextSeparator="-" TextFormatString="({1}) {2}">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        <Settings ShowFilterRow="True" />
                                                    </GridViewProperties>
                                                    <GridViewClientSideEvents RowClick="function(s, e) {
	//PRI_TypeId.GetGridView().Refresh();
}" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="SubCatId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="SubCatCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Kod" Width="15%">
                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="SubCatName" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Sub-Kategori" Width="85%">
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
s.GetGridView().SetWidth(450);
alert('d');
	
}" />
                                                </dx:ASPxGridLookup>
                                                <asp:SqlDataSource ID="SubCatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" OnSelecting="SubCatDs_Selecting" SelectCommand="SP_PR_GetSubCategories" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="1" Name="CatId" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:EmptyLayoutItem Width="25%">
                                    </dx:EmptyLayoutItem>
                                    <dx:LayoutItem Caption="Keterangan" Width="50%" ColSpan="2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxMemo ID="PRI_Desc" runat="server" ClientInstanceName="PRI_Desc" EnableClientSideAPI="True" MaxLength="200" Rows="3" Width="100%">
                                                </dx:ASPxMemo>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:EmptyLayoutItem Width="25%">
                                    </dx:EmptyLayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Maklumat Unit Pengukuran, Kuantiti &amp; Kos Seunit" ColCount="4" GroupBoxDecoration="HeadingLine" Width="100%">
                                <Items>
                                    <dx:LayoutItem Caption="Unit Pengukuran" Width="25%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="PRI_UomId" runat="server" ClientInstanceName="PRI_UomId" DataSourceID="UomDs" EnableClientSideAPI="True" TextField="UomDescription" ValueField="UomId" ValueType="System.Int32" Width="100%">
                                                    <Columns>
                                                        <dx:ListBoxColumn FieldName="UomId" Visible="False" />
                                                        <dx:ListBoxColumn Caption="Unit Pengukuran" FieldName="UomDescription" />
                                                    </Columns>
                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="UomDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [UomId], [UomDescription] FROM [MasterUnitOfMeasurement] ORDER BY [UomDescription]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kuantiti" Width="10%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxSpinEdit ID="PRI_Qty" runat="server" AllowMouseWheel="False" ClientInstanceName="PRI_Qty" DisplayFormatString="n0" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="100px">
                                                    <SpinButtons ShowIncrementButtons="False">
                                                    </SpinButtons>
                                                    <ClientSideEvents ValueChanged="function(s, e) {
	CalcaulateItemTotalPrice();
}" />
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kos Seunit (RM)" Width="10%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxSpinEdit ID="PRI_UnitPrice" runat="server" AllowMouseWheel="False" ClientInstanceName="PRI_UnitPrice" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="120px">
                                                    <SpinButtons ShowIncrementButtons="False">
                                                    </SpinButtons>
                                                    <ClientSideEvents ValueChanged="function(s, e) {
	CalcaulateItemTotalPrice();
}" />
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Jumlah (RM)" Width="55%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxSpinEdit ID="PRI_Amount" runat="server" AllowMouseWheel="False" ClientInstanceName="PRI_Amount" DisplayFormatString="n" EnableClientSideAPI="True" HorizontalAlign="Right" Number="0" Width="120px" ClientEnabled="False">
                                                    <SpinButtons ShowIncrementButtons="False">
                                                    </SpinButtons>
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Maklumat Kod Projek &amp; Kod GL (VOT)" ColCount="3" GroupBoxDecoration="HeadingLine" Width="100%">
                                <Items>
                                    <dx:LayoutItem Caption="Kod Projek" Width="15%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridLookup ID="PRI_ProjectCode" ClientInstanceName="PRI_ProjectCode" EnableClientSideAPI="true" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SagaProjectCodeDs" KeyFieldName="Project_glcode" OnInit="PRI_ProjectCode_Init" TextFormatString="{1}" Style="height: 24px">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    </GridViewProperties>
                                                    <GridViewClientSideEvents RowClick="function(s, e) {
	PRI_TypeId.GetGridView().Refresh();
}" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Id_glcode" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Project_glcode" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <GridViewStyles>
                                                        <AlternatingRow Enabled="True">
                                                        </AlternatingRow>
                                                    </GridViewStyles>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	//PRI_ProjectCode_EndCallback(s, e);
}"
                                                        Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}" />
                                                </dx:ASPxGridLookup>
                                                <asp:SqlDataSource ID="SagaProjectCodeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" OnSelecting="SagaProjectCodeDs_Selecting" SelectCommand="SELECT [Id_glcode], [Project_glcode] FROM [dummy_gl_code]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod GL (VOT)" Width="15%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridLookup ID="PRI_GLcode" ClientInstanceName="PRI_GLcode" EnableClientSideAPI="true" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SagaGlCode" KeyFieldName="Id_glcode" OnInit="PRI_GLcode_Init" TextFormatString="{1}" OnTextChanged="PRI_GLcode_TextChanged">
                                                    <GridViewProperties>
                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    </GridViewProperties>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="Id_glcode" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="code_glcode" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <GridViewStyles>
                                                        <AlternatingRow Enabled="True">
                                                        </AlternatingRow>
                                                    </GridViewStyles>
                                                    <ClientSideEvents EndCallback="function(s, e) {
	//PRI_GLcode_EndCallback(s, e);
}"
                                                        Init="function(s, e) {
	s.GetGridView().SetWidth(650);
}"
                                                        DropDown="function(s, e) {
	//PRI_GLcode_DropDown(s, e);
}" />
                                                </dx:ASPxGridLookup>
                                                <asp:SqlDataSource ID="SagaGlCode" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" OnSelecting="SagaGlCode_Selecting" SelectCommand="SELECT [Id_glcode], [code_glcode] FROM [dummy_gl_code]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:EmptyLayoutItem Width="70%">
                                    </dx:EmptyLayoutItem>
                                    <dx:LayoutItem Caption="kod">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Width="100%" ColCount="2" GroupBoxDecoration="None">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" Width="10%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="ASPxFormLayout1_E13" runat="server" AutoPostBack="False" EnableClientSideAPI="True" Text="Padam" Width="100px">
                                            <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Show();
}" />
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False" Width="90%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="BtnSavePrItem" runat="server" AutoPostBack="False" ClientInstanceName="BtnSavePrItem" EnableClientSideAPI="True" Text="Simpan" Width="100px">
                                            <ClientSideEvents Click="function(s, e) {
	BtnSavePrItem_Click();
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
            </dx:ASPxFormLayout>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
<dx:ASPxTextBox ID="TabItemDetail_EditMode" runat="server" ClientInstanceName="TabItemDetail_EditMode" EnableClientSideAPI="True" Width="170px" Text="0" ClientVisible="False">
</dx:ASPxTextBox>


<dx:ASPxTextBox ID="PRI_ItemNumber" runat="server" ClientInstanceName="PRI_ItemNumber" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


<dx:ASPxTextBox ID="PRI_ProcessId" runat="server" ClientInstanceName="PRI_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>




<dx:ASPxTextBox ID="PRI_Revision" runat="server" ClientInstanceName="PRI_Revision" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>




<dx:ASPxPopupControl ID="PrItemPopupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="PrItemPopupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
    <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol3" runat="server">
            <table style="width: 100%; text-align: center; vertical-align: top;">
                <tr>
                    <td>
                        <dx:ASPxLabel ID="PrItemPopupMsg_Label" runat="server" ClientInstanceName="PrItemPopupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <table style="width: 100%; vertical-align: top; text-align: left;">
                            <tr>
                                <td style="width: 35%"></td>
                                <td style="width: 30%; text-align: center; vertical-align: middle;">
                                    <dx:ASPxButton ID="PrItemPopupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="PrItemPopupMsg_BtnOk" Text="Ok" Width="100px">
                                        <ClientSideEvents Click="function(s, e) {
	PrItemPopupMsg.Hide();
}" />
                                    </dx:ASPxButton>
                                </td>
                                <td style="width: 35%"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>





