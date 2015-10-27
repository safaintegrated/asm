<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pelupusan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PelupusanOld.Tab_Pelupusan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>

    function FillPelupuanInfo(Values) {
        txtStoreId.SetText(Values);
    }

    function BtnSubmit_Click() {
        //alert('1');
        cbpPelupusanStor.PerformCallback('REFRESH_SENARAI_STOR_PELUPUSAN');

    }

    function ButtonSubmitEndCallBack() {
        //   alert('ending');


        //ST_Grid_DaftarStock.GetGridView().Refresh();
        //  alert("end 2");
    }

    function EnableDisablePelupusanTab(truefalse) {
        if (truefalse == 'true') {

            deTarikhPelupusan.SetEnabled(true);
            txtStatus.SetEnabled(true);
            txtPelupusanDaftarStok.SetEnabled(true);
            txtKeteranganStok.SetEnabled(true);
            txtHargaSeunit.SetEnabled(true);
            txtKuantitiDilupuskan.SetEnabled(true);
            txtNilaiPerolehan.SetEnabled(true);
            txtHasilPerolehan.SetEnabled(true);
            txtKaedahDanNilai.SetEnabled(true);
           
        }
        else {

            deTarikhPelupusan.SetEnabled(false);
            txtStatus.SetEnabled(false);
            txtPelupusanDaftarStok.SetEnabled(false);
            txtKeteranganStok.SetEnabled(false);
            txtHargaSeunit.SetEnabled(false);
            txtKuantitiDilupuskan.SetEnabled(false);
            txtNilaiPerolehan.SetEnabled(false);
            txtHasilPerolehan.SetEnabled(false);
            txtKaedahDanNilai.SetEnabled(false);
            
        }
    }

    function HideLoadingPanel() {
        alert('before HideLoadingPanel');
        LoadingPanel.Hide();
        alert('after HideLoadingPanel');
    }

</script>

 
<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Pelupusan Stok" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Senarai Stok" Width="50%" ColCount="2">
                    <Items>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtPelupusan1" runat="server" Width="170px" ClientInstanceName="txtPelupusan1" OnTextChanged="txtPelupusan1_TextChanged">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtPelupusan2" runat="server" Width="170px" ClientInstanceName="txtPelupusan2" OnTextChanged="txtPelupusan2_TextChanged">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Nama Stor" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridLookup ID="glNamaStorPelupusan" runat="server" AutoGenerateColumns="False" ClientInstanceName="glNamaStorPelupusan" DataSourceID="NamaStorPelupusan" KeyFieldName="ST_StoreId">
                                        <GridViewProperties>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents EndCallback="function(s, e) {
	gvSenaraiStorPelupusan.GetGridView().Refresh();

}" ValueChanged="function(s, e) {
	var GV = glNamaStorPelupusan.GetGridView();
	GV.GetRowValues(GV.GetFocusedRowIndex(), 'ST_StoreId', FillPelupusanInfo);
}" />
                                    </dx:ASPxGridLookup>
                                    <asp:SqlDataSource ID="NamaStorPelupusan" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="select [ST_StoreId],[ST_StoreName] from [Store] order by [ST_StoreName] "></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtStoreId" runat="server" Width="170px" ClientInstanceName="txtStoreId">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxButton ID="ASPxFormLayout1_E1" runat="server" Text="Jana Senarai Stok Pelupusan" OnClick="btnSubmitClick">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxGridView ID="gvSenaraiStorPelupusan" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvSenaraiStorPelupusan" DataSourceID="SenaraiStorPelupusan" KeyFieldName="StockReg_Id" OnCustomCallback="gvSenaraiStorPelupusan_CustomCallback" Width="100%">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="StockReg_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Stock_Detail" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Balance" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Status Pelupusan" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="SenaraiStorPelupusan" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_Store_FindStokPelupusan" SelectCommandType="StoredProcedure" OnSelecting="SenaraiStorPelupusan_Selecting">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="glNamaStorPelupusan" Name="StoreId" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                    </Items>
                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Maklumat Stok Yang Dilupuskan" Width="100%" GroupBoxDecoration="HeadingLine" Visible="False">
                                    <Items>
                                        <dx:LayoutItem Width="100%" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="No Daftar Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="1" Width="25%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Harga Seunit" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Kuantiti dilupuskan" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Nilai Perolehan" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Hasil Pelupusan" ShowInCustomizationForm="True" VisibleIndex="5" Width="25%">
                                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Kaedah dan Nilai Perolehan" ShowInCustomizationForm="True" VisibleIndex="6" Width="20%">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>

                <dx:LayoutGroup Caption="Maklumat Pelarasan Stok" RowSpan="2" ColCount="2" Width="50%">
                    <Items>
                        <dx:LayoutItem Caption="Tarikh">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="deTarikhPelupusan" runat="server" ClientInstanceName="deTarikhPelupusan" OnDateChanged="deTarikhPelupusan_DateChanged">
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Status">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtStatus" runat="server" ClientInstanceName="txtStatus" OnTextChanged="txtStatus_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Daftar Stok">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtPelupusanDaftarStok" runat="server" ClientInstanceName="txtPelupusanDaftarStok" OnTextChanged="txtPelupusanDaftarStok_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Keterangan Stok">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtKeteranganStok" runat="server" ClientInstanceName="txtKeteranganStok" OnTextChanged="txtKeteranganStok_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Harga Seunit">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtHargaSeunit" runat="server" ClientInstanceName="txtHargaSeunit" OnTextChanged="txtHargaSeunit_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Kuantiti Dilupuskan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtKuantitiDilupuskan" runat="server" ClientInstanceName="txtKuantitiDilupuskan" OnTextChanged="txtKuantitiDilupuskan_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Nilai Perolehan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtNilaiPerolehan" runat="server" ClientInstanceName="txtNilaiPerolehan" OnTextChanged="txtNilaiPerolehan_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Hasil Perolehan">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtHasilPerolehan" runat="server" ClientInstanceName="txtHasilPerolehan" OnTextChanged="txtHasilPerolehan_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Kaedah dan Nilai">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtKaedahDanNilai" runat="server" ClientInstanceName="txtKaedahDanNilai" OnTextChanged="txtKaedahDanNilai_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>

            </Items>
        </dx:LayoutGroup>
    </Items>
    <settingsitems horizontalalign="Left" verticalalign="Top" />
    <settingsitemcaptions horizontalalign="Left" location="Top" verticalalign="Top" />
    <paddings padding="0px" />
    <border borderstyle="None"></border>
</dx:ASPxFormLayout>




















<dx:ASPxCallbackPanel ID="cbpPelupusanStor" runat="server" ClientInstanceName="cbpPelupusanStor" ClientVisible="False" OnCallback="cbpPelupusanStor_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback= "function(s, e) {
	HideLoadingPanel();
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



































