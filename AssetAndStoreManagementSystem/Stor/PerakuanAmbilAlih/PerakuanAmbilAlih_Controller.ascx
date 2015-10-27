<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PerakuanAmbilAlih_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PerakaunAmbilAlih.PerakuanAmbilAlih_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name) {
            case 'Kemaskini': KemaskiniClicked(); break;
            case 'Lulus': LulusClicked(); break;
            case 'Kuiri': KuiriClicked(); break;
            case 'Tutup': TutupClicked(); break;
            case 'Tambah': TambahClicked(); break;
            case 'Simpan': SimpanClicked(); break;
            case 'Hantar': HantarClicked(); break;
            case 'Padam': PadamClicked(); break;
            case 'Batal': BatalCicked(); break;
            case 'Cetak': CetakClicked(); break;
            case 'Carian': CarianClicked(); break;
            case 'Audit': AuditClicked(); break;
            case 'Lampiran': LampiranClicked(); break;
            case 'Gambar': GambarClicked(); break;
            case 'Impot': ImpotClicked(); break;
        }
    }

    function FillStockInfo(Values)
    {
        alert(Values)
        //Stock_Id.SetText(Values[0].toString());
        alert('1')
        Stock_RegisterNo.SetText(Values[0].toString());
        alert('2')
        Stock_Status.SetText(Values[1].toString());
        alert('3')
        Stock_Price.SetText(Values[2].toString());
        alert('4')
        Stock_Detail.SetText(Values[3].toString());
        alert('5')
        Stock_Suggestion.SetText(Values[4].toString());
        
        //Stock_Balance.SetText(Values[3].toString());
       
        
        
    }


    function EmpGridLookup_RowClick(s,e)
    {

    }

    function EmpGridLookupOnGetRoValues(values)
    {
        alert('6')
        Stock_RegisterNo.SetText(Values);
        alert('7')
        Stock_Status.SetText(Values);
        alert('8')
        Stock_Price.SetText(Values);
        alert('9')
        Stock_Detail.SetText(Values);
        //alert('3')
        //Stock_Balance.SetText(Values);
        alert('10')
        Stock_QuantityRecord.SetText(Values);
        
    }

   function LembagaPemeriksaSelected(U)
    {
       alert('TRY')
       DaftarStor.SetText(Id.toString());
       LoadingPanel.SetText('Sistem sedang membuka maklumat ambil alih yang dipilih. Sila tunggu..')
       LoadingPanel.Show();
       cbp.PerfomCallBack('LOAD')
   }


    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked()
    { }

    function TambahClicked()
    { }

    function SimpanClicked()
    { }

    function HantarClicked()
    { }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    { }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

    function LampiranClicked()
    { }

    function GambarClicked()
    { }

    function ImpotClicked()
    { }
</script>

<p>
    ==========</p>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Perakuan Ambil-Alih" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/PerakuanAmbilAlih.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
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
                        <dx:RibbonButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                            <LargeImage IconID="find_find_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
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
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="85%" CssClass="MainFormSecondRowLeftColumnAddTopPadding">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        
                        <dx:ASPxFormLayout ID="NamaPegawaiStorBaru" runat="server" Width="100%">
                            <Items>
                                <dx:LayoutGroup Caption="Maklumat Pegawai Stor Semasa &amp; Baru" Width="100%">
                                    <Items>
                                        <dx:LayoutItem Caption="No Daftar Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridLookup ID="Stock_RegisterNo" runat="server" AutoGenerateColumns="False" ClientInstanceName="Stock_RegisterNo" DataSourceID="SqlDataSourceSenaraiStok" KeyFieldName="Stock_Id" TextFormatString="{0}" EnableClientSideAPI="True">
                                                        <GridViewProperties>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        </GridViewProperties>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="Stock_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Stock_RegisterNo" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Stock_Status" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Stock_Price" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Stock_QuantityRecord" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <ClientSideEvents DropDown="function(s, e) {
	s.GetGridView().SetWidth(650)
}" Init="function(s, e) {
	s.GetGridView().SetWidth(650)
}" ValueChanged="function(s, e)
 {
	var GV=Stock_RegisterNo.GetGridView();
GV.GetRowValues(GV.GetFocusedRowIndex(),'Stock_RegisterNo;Stock_Status;Stock_Price;Stock_Detail;Stock_QuantityRecord',FillStockInfo);
}" />
                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlDataSourceSenaraiStok" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="Select [Stock_Id],[Stock_RegisterNo],[Stock_Status],[Stock_Price],[Stock_QuantityRecord] from [Stock] order by [Stock_RegisterNo]"></asp:SqlDataSource>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Status Pemeriksaan" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="Stock_Status" runat="server" ClientInstanceName="Stock_Status" OnTextChanged="Stock_Status_TextChanged" Width="170px" EnableClientSideAPI="True">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Harga Seunit">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="Stock_Price" runat="server" ClientInstanceName="Stock_Price" OnTextChanged="Stock_Price_TextChanged" Width="170px" EnableClientSideAPI="True">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Keterangan Stok">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="Stock_Detail" runat="server" ClientInstanceName="Stock_Detail" OnTextChanged="Stock_Detail_TextChanged" Width="170px" EnableClientSideAPI="True" ClientVisible="False">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Kuantiti Direkod">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="Stock_QuantityRecord" runat="server" ClientInstanceName="Stock_QuantityRecord" OnTextChanged="Stock_QuantityRecord_TextChanged" Width="170px" EnableClientSideAPI="True">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Kuantiti Fizikal">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxSpinEdit ID="Stock_QuantityPhysical" runat="server" Number="0" ClientInstanceName="Stock_QuantityPhysical">
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Catatan dan Cadangan">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxMemo ID="Stock_Suggestion" runat="server" Height="71px" Width="170px" ClientInstanceName="Stock_Suggestion">
                                                    </dx:ASPxMemo>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Senarai Stok Yang Diperiksa" Width="100%">
                                    <Items>
                                        <dx:LayoutItem Caption="Nama Stor" CssClass="FormLayoutItemAdd10pxTopPadding" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridLookup ID="NamaStor" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="ST_StoreId" OnTextChanged="NamaStor_TextChanged" TextFormatString=" {1}">
                                                        <GridViewProperties>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        </GridViewProperties>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ST_StoreAdd1" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ST_StoreAdd2" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ST_StorePhoneNumber" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="Select [ST_StoreId],[ST_StoreName],[ST_StoreAdd1],[ST_StoreAdd2],[ST_StorePhoneNumber]from [Store] order by [ST_StoreName]"></asp:SqlDataSource>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tarikh Laporan" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit ID="TarikhLaporan" runat="server">
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Nama Pegawai Stor Semasa">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridLookup ID="NamaPegawaiStorSemasa" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="EmployeeSystemId" MultiTextSeparator="" OnTextChanged="NamaPegawaiStorSemasa_TextChanged" style="margin-top: 0px" TextFormatString="{2}">
                                                        <GridViewProperties>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        </GridViewProperties>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeId" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="Select [EmployeeSystemId],[EmployeeId],[EmployeeName],[EmployeeDesignation] from [Employee] order by [EmployeeName]"></asp:SqlDataSource>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Nama Pegawai Stor Baru" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridLookup ID="NamaPegawaiBaru" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="EmployeeSystemId" MultiTextSeparator="" TextFormatString="{2}">
                                                        <GridViewProperties>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                        </GridViewProperties>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeId" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridLookup>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="select [EmployeeSystemId],[EmployeeId],[EmployeeName],[EmployeeDesignation] from [Employee] order by [EmployeeName] "></asp:SqlDataSource>
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
                        
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False" Width="15%" CssClass="MainFormSecondRowRightColumnAddTopPadding10px">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Rujukan">
                            <Items>
                                <dx:LayoutItem Caption="No. Rujukan">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" CssClass="Reference_ReferenceNumber">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" CssClass="Reference_Date">
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
</dx:ASPxRoundPanel>

