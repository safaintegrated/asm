<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PengeluaranStokController.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PengeluaranStok.PengeluaranStokController" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Pengeluaran Stok" ShowCollapseButton="True" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PengeluaranStokKeStorPTJ.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table style="width: 100%; vertical-align: top; text-align: left; padding-top: 10px">
                <tr>
                    <td colspan="2" style="width: 100%; vertical-align: top; text-align: left;">
                        <dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
                            <Tabs>
                                <dx:RibbonTab Name="Utama" Text="Utama">
                                    <Groups>
                                        <dx:RibbonGroup Text="Pengurusan Rekod" Name="Pengurusan Rekod">
                                            <Items>
                                                <dx:RibbonButtonItem BeginGroup="True" Name="Kemaskini" Size="Large" Text="Kemaskini">
                                                    <LargeImage IconID="edit_edit_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                                                    <LargeImage IconID="actions_add_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Simpan" Size="Large" Text="Simpan">
                                                    <LargeImage IconID="save_save_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Hantar" Size="Large" Text="Hantar">
                                                    <LargeImage IconID="mail_send_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Padam" Size="Large" Text="Padam">
                                                    <LargeImage IconID="edit_delete_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Batal" Size="Large" Text="Batal">
                                                    <LargeImage IconID="actions_deletelist_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                 <dx:RibbonDropDownButtonItem Name="Cetak" Size="Large" Text="Cetak">
                                                    <Items>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs1" Text="KEWPS-1">
                                                        </dx:RibbonDropDownButtonItem>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs2" Text="KEWPS-2">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <%-- <dx:RibbonDropDownButtonItem Name="CetakKewPs3A" Text="KEWPS-3A">
                                                        </dx:RibbonDropDownButtonItem>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs3B" Text="KEWPS-3B">
                                                        </dx:RibbonDropDownButtonItem>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs4" Text="KEWPS-4">
                                                        </dx:RibbonDropDownButtonItem>--%>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs9" Text="KEWPS-9">
                                                        </dx:RibbonDropDownButtonItem>
                                                         <dx:RibbonDropDownButtonItem Name="CetakKewPs10" Text="KEWPS-10">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <dx:RibbonDropDownButtonItem Name="CetakKewPs11" Text="KEWPS-11">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <dx:RibbonDropDownButtonItem Name="CetakKewPs12" Text="KEWPS-12">
                                                        </dx:RibbonDropDownButtonItem>
                                                       
                                                    </Items>
                                                    <LargeImage IconID="print_print_32x32">
                                                    </LargeImage>
                                                </dx:RibbonDropDownButtonItem>

                                                <dx:RibbonDropDownButtonItem Name="Carian" Size="Large" Text="Carian">
                                                    <Items>
                                                        <dx:RibbonDropDownButtonItem Name="CarianPermohonan" Text="Cari Permohonan">
                                                        </dx:RibbonDropDownButtonItem>
                                                        <%--<dx:RibbonDropDownButtonItem Name="CarianPengeluaran" Text="Cari Pengeluaran">
                                                        </dx:RibbonDropDownButtonItem>--%>
                                                    </Items>
                                                    <LargeImage IconID="find_find_32x32">
                                                    </LargeImage>
                                                </dx:RibbonDropDownButtonItem>
                                                <dx:RibbonButtonItem Name="Audit" Size="Large" Text="Audit">
                                                    <LargeImage IconID="arrange_bringtofrontoftext_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Tutup" Size="Large" Text="Tutup">
                                                    <LargeImage IconID="actions_close_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                            </Items>
                                        </dx:RibbonGroup>
                                    </Groups>
                                </dx:RibbonTab>
                                <dx:RibbonTab Name="Lampiran" Text="Muatnaik">
                                    <Groups>
                                        <dx:RibbonGroup Name="Muatnaik" Text="">
                                            <Items>
                                                <dx:RibbonButtonItem Size="Large" Text="Lampiran" Name="Lampiran">
                                                    <LargeImage IconID="mail_attachment_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Gambar" Size="Large" Text="Gambar">
                                                    <LargeImage IconID="content_image_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Impot" Size="Large" Text="Import">
                                                    <LargeImage IconID="actions_download_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                            </Items>
                                        </dx:RibbonGroup>
                                    </Groups>
                                </dx:RibbonTab>
                                <dx:RibbonTab Name="Laporan" Text="Laporan">
                                    <Groups>
                                        <dx:RibbonGroup>
                                        </dx:RibbonGroup>
                                    </Groups>
                                </dx:RibbonTab>
                                <dx:RibbonTab Name="Kelulusan" Text="Kelulusan">
                                    <Groups>
                                        <dx:RibbonGroup>
                                            <Items>
                                                <dx:RibbonButtonItem Name="Lulus" Size="Large" Text="Lulus">
                                                    <LargeImage IconID="actions_apply_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                                <dx:RibbonButtonItem Name="Kuiri" Size="Large" Text="Kuiri">
                                                    <LargeImage IconID="support_knowledgebasearticle_32x32">
                                                    </LargeImage>
                                                </dx:RibbonButtonItem>
                                            </Items>
                                        </dx:RibbonGroup>
                                    </Groups>
                                </dx:RibbonTab>
                            </Tabs>
                            <Styles>
                                <Item Width="70px">
                                </Item>
                            </Styles>
                            <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
                        </dx:ASPxRibbon>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80%; vertical-align: top; text-align: left; padding-top: 10px">
                        <%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

                        <dx:ASPxCallbackPanel ID="cbp" ClientInstanceName="cbp" runat="server" OnCallback="cbp_Callback">
                            <ClientSideEvents EndCallback="function(s, e) {
	cbp_EndCallback(s,e);
}" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxFormLayout ID="formMain" runat="server" Width="96%" ClientInstanceName="formMain">
                                        <Items>
                                            <dx:LayoutGroup Caption="Maklumat Permohonan" ColCount="3">
                                                <Items>
                                                    <dx:LayoutItem Caption="No Pemesanan" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtNoPermohonan" runat="server" ClientInstanceName="txtNoPermohonan" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Permohonan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="dePermohonanTarikh" runat="server" ClientInstanceName="dePermohonanTarikh">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Dikehendaki" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="dePermohonanTarikhDiKehendaki" runat="server" Width="100%" ClientEnabled="true" ClientInstanceName="dePermohonanTarikhDiKehendaki">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Stok Yang Dipohon" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanStok" runat="server" Width="100%" ClientEnabled="true" ClientInstanceName="glPermohonanStok" AutoGenerateColumns="False" DataSourceID="dsStockRegistration" KeyFieldName="Stock_Id">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Stock_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Stock_Detail" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UomId" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="CurrentBalance" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsStockRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStockRegistrationByStoreId" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="glPermohonanStor" DefaultValue="0" Name="StoreId" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:SqlDataSource ID="dsStok" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT [Stock_Id], [Stock_RegisterNo], [Stock_Detail], [UomId] FROM [StockStore]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kuantiti Dipohon" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPermohonanKuantitiDiPohon" runat="server" Width="100%" ClientInstanceName="txtPermohonanKuantitiDiPohon">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Unit">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanUnit" runat="server" AutoGenerateColumns="False" DataSourceID="dsUnit" KeyFieldName="UomId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="UomId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="UomDescription" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsUnit" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [MasterUnitOfMeasurement] WHERE ([UomId] = @UomId)">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="glPermohonanStok" DefaultValue="0" Name="UomId" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jabatan Yang Di Pohon" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanPtj" runat="server" ClientInstanceName="glPermohonanPtj" Width="100%" ClientEnabled="true" AutoGenerateColumns="False" DataSourceID="dsPtj" KeyFieldName="PTJ_Id">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents ValueChanged="function(s, e) {
	glPermohonanStor.GetGridView().Refresh();
}" />
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsPtj" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [PusatTanggungJawab]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Stor Yang Di Pohon" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanStor" runat="server" ClientEnabled="true" ClientInstanceName="glPermohonanStor" Width="100%" AutoGenerateColumns="False" DataSourceID="dsStorDiPohon" KeyFieldName="ST_StoreId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StorePTJId" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreOfficerEmpSysId" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents ValueChanged="function(s, e) {
	glPermohonanStok.GetGridView().Refresh();
}" />
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsStorDiPohon" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="glPermohonanPtj" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:EmptyLayoutItem>
                                                    </dx:EmptyLayoutItem>
                                                    <dx:LayoutItem Caption="Destinasi">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="cbPermohonanToJenis" runat="server" ClientInstanceName="cbPermohonanToJenis">
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Ke Stor PTJ" Value="0" />
                                                                        <dx:ListEditItem Text="Ke Pengguna" Value="1" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:EmptyLayoutItem ColSpan="2">
                                                    </dx:EmptyLayoutItem>
                                                    <dx:LayoutItem Caption="Kepada Jabatan ">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanToPtj" ClientEnabled="true" ClientInstanceName="glPermohonanToPtj" runat="server" AutoGenerateColumns="False" DataSourceID="dsPtj" KeyFieldName="PTJ_Id" Width="100%">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents ValueChanged="function(s, e) {
	glPermohonanToStor.GetGridView().Refresh();
}
" />
                                                                </dx:ASPxGridLookup>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kepada Stor">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanToStor" ClientEnabled="true" ClientInstanceName="glPermohonanToStor" runat="server" AutoGenerateColumns="False" DataSourceID="dsPermohonanToStor" KeyFieldName="ST_StoreId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StorePTJId" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ST_StoreOfficerEmpSysId" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsPermohonanToStor" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="glPermohonanToPtj" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kepada Pegawai">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPermohonanToNama" ClientEnabled="true" ClientInstanceName="glPermohonanToNama"  runat="server" AutoGenerateColumns="False" DataSourceID="dsPermohonanToNama" KeyFieldName="EmployeeSystemId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsPermohonanToNama" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [EmployeeSystemId], [EmployeeName], [EmployeeDesignation], [EmployeePTJ], [EmployeeIdNo] FROM [Employee]"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tujuan" ColSpan="2" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxMemo ID="mmPermohonanTujuan" runat="server" ClientInstanceName="mmPermohonanTujuan" Height="71px" Width="100%">
                                                                </dx:ASPxMemo>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Process Id" Width="100%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtNoPemohon" runat="server" ClientInstanceName="txtNoPemohon" Width="170px">
                                                                </dx:ASPxTextBox>
                                                                <dx:ASPxTextBox ID="txtProcessIdTemp" runat="server" ClientInstanceName="txtProcessIdTemp" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Pemohon" ColCount="2" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem Caption="Nama Pegawai">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glPemohonNama" runat="server" AutoGenerateColumns="False" ClientInstanceName="glPemohonNama" DataSourceID="dsEmployee" KeyFieldName="EmployeeSystemId" OnValueChanged="glPemohonNama_ValueChanged">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <ClientSideEvents ValueChanged="function(s, e) {
	var GV = glPemohonNama.GetGridView();
	GV.GetRowValues(GV.GetFocusedRowIndex(), 'EmployeeName;EmployeeDesignation;PTJ_Name;EmployeeIdNo', FillPemohon);
}
" />
                                                                </dx:ASPxGridLookup>
                                                                <asp:SqlDataSource ID="dsEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT Employee.EmployeeSystemId, Employee.EmployeeName, Employee.EmployeeDesignation, Employee.EmployeePTJ, PusatTanggungJawab.PTJ_Id, PusatTanggungJawab.PTJ_Name, Employee.EmployeeIdNo FROM Employee CROSS JOIN PusatTanggungJawab"></asp:SqlDataSource>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="No. Kakitangan" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPemohonNoKakitangan" runat="server" ClientInstanceName="txtPemohonNoKakitangan" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jawatan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPemohonJawatan" runat="server" ClientInstanceName="txtPemohonJawatan" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jabatan" Width="50%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPemohonJabatan" runat="server" ClientInstanceName="txtPemohonJabatan" Width="100%" CssClass="TextBoxForStaffId">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Kelulusan" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Nama">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridLookup ID="glKelulusanNama" runat="server" Width="100%" ClientEnabled="true" ClientInstanceName="glKelulusanNama" AutoGenerateColumns="False" DataSourceID="dsEmployee" KeyFieldName="EmployeeSystemId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="No. Kakitangan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtKelulusanNoKakitangan" ClientEnabled="true" ClientInstanceName="txtKelulusanNoKakitangan" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jawatan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtKelulusanJawatan" ClientInstanceName="txtKelulusanJawatan" ClientEnabled="true" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jabatan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtKelulusanJabatan" ClientEnabled="true" ClientInstanceName="txtKelulusanJabatan" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kuantiti Diluluskan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtKelulusanKuantiti" ClientEnabled="true" ClientInstanceName="txtKelulusanKuantiti" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Diluluskan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="deKelulusanTarikh" ClientEnabled="true" ClientInstanceName="deKelulusanTarikh" runat="server">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Maklumat Pengeluaran" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Nama">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" Enabled="True">
                                                                <dx:ASPxGridLookup ID="glPengeluarNama" runat="server" Width="100%" ClientEnabled="true" ClientInstanceName="glPengeluarNama" AutoGenerateColumns="False" DataSourceID="dsEmployee" KeyFieldName="EmployeeSystemId">
                                                                    <GridViewProperties>
                                                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                    </GridViewProperties>
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="False" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:ASPxGridLookup>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="No. Kakitangan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPengeluarNoKakitangan" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jawatan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPengeluarJawatan" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Jabatan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPengeluarJabatan" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Kuantiti Dikeluarkan">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="txtPermohonanKuantitiDiKeluarkan" runat="server" ClientInstanceName="txtPermohonanKuantitiDiKeluarkan" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Catatan" ColSpan="2" RowSpan="2">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxMemo ID="mmPermohonanCatatan" runat="server" ClientInstanceName="mmPermohonanCatatan" Height="71px" Width="170px">
                                                                </dx:ASPxMemo>
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
                        <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
                        </dx:ASPxLoadingPanel>
                        <dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
                            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
                            </HeaderImage>
                            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
                            <ContentCollection>
                                <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol3" runat="server">
                                    <table style="width: 100%; text-align: center; vertical-align: top;">
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 10px;">
                                                <table style="width: 100%; vertical-align: top; text-align: left;">
                                                    <tr>
                                                        <td style="width: 35%"></td>
                                                        <td style="width: 30%; text-align: center; vertical-align: middle;">
                                                            <dx:ASPxButton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
                                                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
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



                        <dx:ASPxPopupControl ID="popupDeleteHeaderConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteHeaderConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
                            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
                            </HeaderImage>
                            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
                            <ContentCollection>
                                <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol4" runat="server">
                                    <table style="width: 100%; text-align: center; vertical-align: top;">
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="popupDeleteHeaderConfirmation_Label" runat="server" ClientInstanceName="popupDeleteHeaderConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 10px;">
                                                <table style="width: 100%; vertical-align: top; text-align: left;">
                                                    <tr>
                                                        <td style="width: 15%"></td>
                                                        <td style="width: 35%; text-align: right; vertical-align: middle; padding-right: 6px;">
                                                            <dx:ASPxButton ID="popupDeleteHeaderConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnOk" Text="Ok" Width="100px">
                                                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDeleteHeader();
}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="width: 35%; text-align: left; vertical-align: middle; padding-left: 6px;">
                                                            <dx:ASPxButton ID="popupDeleteHeaderConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnCancel" Text="Batal" Width="100px">
                                                                <ClientSideEvents Click="function(s, e) {
	popupDeleteHeaderConfirmation.Hide();
}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="width: 15%"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>








                        <dx:ASPxPopupControl ID="popupDeleteGridRowConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteGridRowConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px">
                            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
                            </HeaderImage>
                            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
                            <ContentCollection>
                                <dx:PopupControlContentControl ID="Popupcontrolcontentcontrol5" runat="server">
                                    <table style="width: 100%; text-align: center; vertical-align: top;">
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="popupDeleteGridRowConfirmation_Label" runat="server" ClientInstanceName="popupDeleteGridRowConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 10px;">
                                                <table style="width: 100%; vertical-align: top; text-align: left;">
                                                    <tr>
                                                        <td style="width: 15%"></td>
                                                        <td style="width: 35%; text-align: right; vertical-align: middle; padding-right: 6px;">
                                                            <dx:ASPxButton ID="popupDeleteGridRowConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnOk" Text="Ok" Width="100px">
                                                                <ClientSideEvents Click="function(s, e) {
	ProceedWithMemberDelete();
}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="width: 35%; text-align: left; vertical-align: middle; padding-left: 6px;">
                                                            <dx:ASPxButton ID="popupDeleteGridRowConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnCancel" Text="Batal" Width="100px">
                                                                <ClientSideEvents Click="function(s, e) {
	popupDeleteGridRowConfirmation.Hide();
}" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td style="width: 15%"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                        <dx:ASPxPopupControl ID="popupSearchPermohonan" runat="server" AllowDragging="True" ClientInstanceName="popupSearchPermohonan" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Permohonan" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
                            <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
                            </HeaderImage>
                            <FooterContentTemplate>
                                <div style="width: 100%; padding: 8px 0px 8px 0px; text-align: center; margin-left: auto; margin-right: auto;">
                                    &nbsp;
                                </div>
                            </FooterContentTemplate>
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server">
                                    <dx:ASPxGridView ID="gvPermohonan" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvPermohonan" DataSourceID="dsPermohonanStok" EnableCallbackAnimation="True" KeyFieldName="ProcessId" Width="100%" OnCustomCallback="gvPermohonan_CustomCallback" OnHtmlDataCellPrepared="gvPermohonan_HtmlDataCellPrepared">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <dx:ASPxHyperLink ID="hlProcessId" runat="server" ClientInstanceName="hlProcessId" Text="ASPxHyperLink" />
                                                </DataItemTemplate>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ProcessIdTemp" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="EmpSysId" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Purpose" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="CreationDate" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataDateColumn FieldName="RequiredDate" ShowInCustomizationForm="True" VisibleIndex="6">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="PtjDiPohon" ShowInCustomizationForm="True" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="StorDiPohon" ShowInCustomizationForm="True" VisibleIndex="9">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="StokDiPohon" ShowInCustomizationForm="True" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="KuantitDiPohon" ShowInCustomizationForm="True" VisibleIndex="11">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowFilterRow="True" />
                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                        <Styles>
                                            <AlternatingRow Enabled="True">
                                            </AlternatingRow>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsPermohonanStok" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllPermohonanStok" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                    </td>
                    <td style="width: 20%; vertical-align: top; text-align: left; padding-top: 46px">
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Visible="False">
                            <Items>
                                <dx:LayoutGroup Caption="Rujukan" Width="100%">
                                    <Items>
                                        <dx:LayoutItem Caption="No. Rujukan " Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="90%">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh " Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" Width="60%">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Status" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="90%">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                            <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                            <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                        </dx:ASPxFormLayout>
                    </td>
                </tr>
            </table>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>




<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" OnCallback="cbp_Report_Callback" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {


	window.open('../../Report/Viewer/Index.aspx');
}
" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>





