<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pemeriksaan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Verifikasi.Tab_Pemeriksaan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function PEMH_LembagaPemeriksaUniqueId_ValueChanged()
    {
        if (PEMH_LembagaPemeriksaUniqueId.GetText() != '')
        {
            LoadingPanel.SetText('Sistem sedang menyenaraikan semua ahli Lembaga Pemeriksa.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_TabPemeriksaan.PerformCallback('INVESTIGATOR');
        }
    }

    function FillStockInfo(Values) {

        Stock_Id.SetText(Values[0].toString());

        Stock_QuantityRecord.SetText(Values[1].toString());

        //Stock_Balance.SetText(Values[2].toString());

        //Stock_Status.SetText(Values[3].toString());

    }

    //function EmpGridLookupOnGetRoValues(values) {

    //    Stock_Id.SetText(Values);
    //    // alert('2')
    //    Stock_QuantityRecord.SetText(Values);
    //    //alert('3')
    //    //Stock_Balance.SetText(Values);
    //    ////alert('4')
    //    //Stock_Status.SetText(Values);

    //}


    function btnGenerateAssInvList_Click() {
        LoadingPanel.SetText('Sistem sedang mennyenaraikan semua aset alih mengikut kriteria carian.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_TabPemeriksaan.PerformCallback('ASSETINV');
    }

    function cbp_TabPemeriksaan_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'SAVE')
            {
                EnableDisablePemeriksaanTab('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'false', 'true');
                popupMsg_Label.SetText('Rekod Pemeriksaan telah disimpan dengan jayanya.');
                popupMsg.Show();
                RefreshReferenceSection();
            }
            else if (s.cpMode.toString() == 'POST')
            {
                EnableDisablePemeriksaanTab('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');          
                RefreshReferenceSection();
                RefreshAliranKerja();

                if (s.cpMailErr.toString() == '')
                { popupMsg_Label.SetText('Rekod Pemeriksaan telah dihantar dengan jayanya.'); }
                else
                { popupMsg_Label.SetText(s.cpMailErr.toString()); }

                popupMsg.Show();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                RefreshReferenceSection();
                popupSearch.Hide();
                EnableDisablePemeriksaanTab('false');
                ManagePage();
            }
        }
    }

    function ManagePage()
    {
        if (PEMH_Status.GetText() == "2")
        {
            ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
        else if (PEMH_Status.GetText() == "37")
        {
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
            PEM_WFD_PEMH_RowId.SetText(PEMH_RowId.GetText());
            GridWorkflow.PerformCallback();
            RefreshAliranKerja();

            var HasilPemeriksaan = PageControl.GetTab(1);
            HasilPemeriksaan.SetVisible(true);
            Result_RowId.SetText(PEMH_RowId.GetText());
            Result_CsvFileName.SetText('');
        }
    }

    function CheckPemeriksaanForm()
    {
        if (PEMH_Name.GetText() == '' || PEMH_StartDate.GetText() == '' || PEMH_EndDate.GetText() == '' || PEMH_LembagaPemeriksaUniqueId.GetText() == '')
        {
            popupMsg_Label.SetText('Nama Pemeriksaan, Tarikh Mula, Tarikh Tamat dan Nama Lembaga Pemeriksa perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function CheckAssetInvList()
    {
        if (GridAssInvList.GetVisibleRowsOnPage() == 0)
        {
            popupMsg_Label.SetText('Sila pastikan senarai aset alih telah dijana.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            return false;
        }
        else
            return true;
    }

    function EnableDisablePemeriksaanTab(truefalse)
    {
        if (truefalse == 'true')
        {
            PEMH_Name.SetEnabled(true);
            PEMH_Desc.SetEnabled(true);
            PEMH_StartDate.SetEnabled(true);
            PEMH_EndDate.SetEnabled(true);
            PEMH_LembagaPemeriksaUniqueId.SetEnabled(true);
            PEMH_PTJ.SetEnabled(true);
            PEMH_Dept.SetEnabled(true);
            PEMH_Block.SetEnabled(true);
            PEMH_Floor.SetEnabled(true);
            PEMH_Space.SetEnabled(true);
            btnGenerateAssInvList.SetEnabled(true);
        }
        else
        {
            PEMH_Name.SetEnabled(false);
            PEMH_Desc.SetEnabled(false);
            PEMH_StartDate.SetEnabled(false);
            PEMH_EndDate.SetEnabled(false);
            PEMH_LembagaPemeriksaUniqueId.SetEnabled(false);
            PEMH_PTJ.SetEnabled(false);
            PEMH_Dept.SetEnabled(false);
            PEMH_Block.SetEnabled(false);
            PEMH_Floor.SetEnabled(false);
            PEMH_Space.SetEnabled(false);
            btnGenerateAssInvList.SetEnabled(false);
        }
    }
</script>

<dx:ASPxCallbackPanel ID="cbp_TabPemeriksaan" runat="server" ClientInstanceName="cbp_TabPemeriksaan" OnCallback="cbp_TabPemeriksaan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_TabPemeriksaan_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>       
            <dx:LayoutGroup Caption="Maklumat Pemeriksaan" ColCount="3" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama Pemverifikasi" Width="70%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxTextBox ID="PEMH_Name" ClientInstanceName="PEMH_Name" runat="server" Width="100%" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Mula" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxDateEdit ID="PEMH_StartDate" ClientInstanceName="PEMH_StartDate" runat="server" Width="100%" EnableClientSideAPI="True" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Tamat" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxDateEdit ID="PEMH_EndDate" ClientInstanceName="PEMH_EndDate" runat="server" Width="100%" EnableClientSideAPI="True" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Keterangan" ColSpan="3" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                <dx:ASPxMemo ID="PEMH_Desc" ClientInstanceName="PEMH_Desc" runat="server" Height="71px" Width="100%" EnableClientSideAPI="True">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No Daftar Stok" Width="30%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PEMH_DaftarStor" runat="server" AutoGenerateColumns="False" ClientInstanceName="Stock_Id" DataSourceID="Stor" KeyFieldName="Stock_Id" TextFormatString="{0}" MultiTextSeparator="">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Stock_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Stock_QuantityRecord" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <ClientSideEvents DropDown="function(s, e) {
	s.GetGridView().SetWidth(650)
}" Init="function(s, e) {
	s.GetGridView().SetWidth(650)
}" ValueChanged="function(s, e) {
	var GV=PEMH_DaftarStor.GetGridView();
GV.GetRowValues(GV.GetFocusedRowIndex(),'Stock_Id;Stock_QuantityRecord',FillStockInfo);

}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="Stor" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="select [Stock_Id],[Stock_QuantityRecord] from [Stock] order by [Stock_Id]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kuantiti Direkod" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PEMH_KuantitiDirekod" runat="server" ClientInstanceName="Stock_QuantityRecord" Width="170px" OnTextChanged="Stock_QuantityRecord_TextChanged">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kuantiti Fizikal" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PEMH_KuantitiFizikal" runat="server" ClientInstanceName="PEMH_KuantitiFizikal" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="70%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                <dx:ASPxTextBox ID="PEMH_RowId" runat="server" ClientVisible="False" EnableClientSideAPI="True" Width="170px" ClientInstanceName="PEMH_RowId">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                <dx:ASPxTextBox ID="PEMH_Status" runat="server" ClientVisible="False" EnableClientSideAPI="True" Width="170px" ClientInstanceName="PEMH_Status">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PEMH_RefNumber" ClientInstanceName="PEMH_RefNumber" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Lembaga Pemeriksa" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama Lembaga" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                <dx:ASPxComboBox ID="PEMH_LembagaPemeriksaUniqueId" runat="server" ClientInstanceName="PEMH_LembagaPemeriksaUniqueId" DataSourceID="InspectorDs" EnableClientSideAPI="True" TextField="LPH_LembagaName" ValueField="LPH_UniqueId" CssClass="ComboBoxLembagaPemeriksa">
                                    <ClientSideEvents ValueChanged="function(s, e) {
	PEMH_LembagaPemeriksaUniqueId_ValueChanged();
}" />
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="InspectorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [LPH_UniqueId], [LPH_LembagaName] FROM [LembagaPemeriksa_Header] ORDER BY [LPH_LembagaName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Width="100%" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server">
                                <dx:ASPxGridView ID="GridInvestigator" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridInvestigator">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%" FieldName="LPD_EmpName">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="1" Width="10%" FieldName="LPD_EmpDesignation">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" FieldName="LPD_EmpGrade">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Emel" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%" FieldName="LPD_EmpEmail">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Telefon" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%" FieldName="LPD_Telephone">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Peranan" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%" FieldName="MIR_Desc">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="LPD_MIR_Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="LPD_EmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
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
            <dx:LayoutGroup Caption="Lokasi Pemeriksaan" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server">
                                <dx:ASPxComboBox ID="PEMH_PTJ" runat="server" ClientInstanceName="PEMH_PTJ" DataSourceID="PtjDs" EnableClientSideAPI="True" TextField="PTJ_Name" ValueField="PTJ_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="PtjDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_Id], [PTJ_Name] FROM [PusatTanggungJawab] ORDER BY [PTJ_Name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat, Jabatan dan Bahagian" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server">
                                <dx:ASPxComboBox ID="PEMH_Dept" runat="server" ClientInstanceName="PEMH_Dept" DataSourceID="DeptDs" EnableClientSideAPI="True" TextField="Dept_Name" ValueField="Dept_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="DeptDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Dept_Id], [Dept_Name] FROM [Department] ORDER BY [Dept_Name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Bangunan dan Blok" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server">
                                <dx:ASPxComboBox ID="PEMH_Block" runat="server" ClientInstanceName="PEMH_Block" DataSourceID="BlockDs" EnableClientSideAPI="True" TextField="Build_Name" ValueField="Build_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="BlockDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Build_Id], [Build_Name] FROM [Building] ORDER BY [Build_Name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Aras" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server">
                                <dx:ASPxComboBox ID="PEMH_Floor" runat="server" ClientInstanceName="PEMH_Floor" DataSourceID="FloorDs" EnableClientSideAPI="True" TextField="Floor_Name" ValueField="Floor_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="FloorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Floor_Id], [Floor_Name] FROM [Floor] ORDER BY [Floor_Name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ruang" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server">
                                <dx:ASPxComboBox ID="PEMH_Space" runat="server" ClientInstanceName="PEMH_Space" DataSourceID="SpaceDs" EnableClientSideAPI="True" TextField="Space_Name" ValueField="Space_Id" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SpaceDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Space_Id], [Space_Name] FROM [Space] ORDER BY [Space_Name]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Width="50%">
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem ColSpan="2" Width="100%">
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="" ColSpan="2" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server">
                                <dx:ASPxButton ID="btnGenerateAssInvList" runat="server" AutoPostBack="False" ClientInstanceName="btnGenerateAssInvList" EnableClientSideAPI="True" Text="Jana Senarai" Theme="SoftOrange" Width="150px">
                                    <ClientSideEvents Click="function(s, e) {
btnGenerateAssInvList_Click();	
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem ColSpan="2" Width="100%">
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server">
                                <dx:ASPxGridView ID="GridAssInvList" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridAssInvList" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="No Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%" FieldName="AssInvRegNum">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan Aset" ShowInCustomizationForm="True" VisibleIndex="1" Width="60%" FieldName="AssInvDesc">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status KEWPA2/KEWPA3" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%" FieldName="StatusName">
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
            
            
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


