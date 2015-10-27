<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Permohonan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.Tab_Permohonan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<style>
    .AddTopPadding 
    {
        padding-top:15px;
    }
.dxgvControl_Office2010Blue,
.dxgvDisabled_Office2010Blue
{
	border: 1px solid #8ba0bc;
	font: 11px Verdana, Geneva, sans-serif;
	background-color: #e4effa;
	color: Black;
	cursor: default;
}
.dxgvTable_Office2010Blue
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxgvTable_Office2010Blue
{
	background-color: White;
	border-width: 0;
	border-collapse: separate!important;
	overflow: hidden;
}
.dxgvFocusedRow_Office2010Blue
{
	background: #faedb6 none;
	color: Black;
}
.dxeHyperlink
{
	font: 12px Tahoma, Geneva, sans-serif;
	color: #0d45b7;
}
.dxgvDataRowAlt_Office2010Blue
{
	background-color: #f4f6f9;
}
    </style>



        














        












        














        







<dx:ASPxCallbackPanel ID="cbpHeader" ClientInstanceName="cbpHeader" runat="server" OnCallback="cbpHeader_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	cbpHeader_EndCallback(s,e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="96%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pemohon" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtPemohonNama" runat="server" ClientInstanceName="txtPemohonNama" Width="100%" CssClass="TextBoxForName">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Kakitangan" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtPemohonNoKakitangan" runat="server" ClientInstanceName="txtPemohonNoKakitangan" CssClass="TextBoxForStaffId" Width="100%">
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
                    <dx:LayoutItem Caption="Jabatan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtPemohonJabatan" runat="server" ClientInstanceName="txtPemohonJabatan" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Process Id" Width="50%" ClientVisible="False">
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
            <dx:LayoutGroup Caption="Maklumat Permohonan" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Jabatan Di Pohon" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glPtjDiPohon" ClientEnabled="true" ClientInstanceName="glPtjDiPohon" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsPtjDiPohon" KeyFieldName="PTJ_Id" TextFormatString="({0}) {1}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
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
                                    <ClientSideEvents EndCallback="function(s, e) {
glStorDiPohon.GetGridView().Refresh();	
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="dsPtjDiPohon" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [PusatTanggungJawab]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Stor Di Pohon" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glStorDiPohon"  ClientEnabled="true" ClientInstanceName="glStorDiPohon"  runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsStor" KeyFieldName="ST_StoreId" TextFormatString="{1}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ST_StoreId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ST_StoreName" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ST_StorePTJId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ST_StoreOfficerEmpSysId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PTJ_Code" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PTJ_Name" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <ClientSideEvents EndCallback="function(s, e) {
glStokDiPohon.GetGridView().Refresh();	
	
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="dsStor" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="glPtjDiPohon" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Stok Dipohon" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glStokDiPohon" ClientEnabled="true" ClientInstanceName="glStokDiPohon"  runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsStokDipohon" KeyFieldName="StockId" TextFormatString="({3}) {4} - {6}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="StoreId" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="DateTime" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="StockRegId" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StockId" ShowInCustomizationForm="True" VisibleIndex="4" ReadOnly="True">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="StockRegNo" ShowInCustomizationForm="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StockDetail" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StoreId1" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StoreName" ShowInCustomizationForm="True" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Balance" ShowInCustomizationForm="True" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CurrentPrice" ShowInCustomizationForm="True" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ParasMenokok" ShowInCustomizationForm="True" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="NoPkBppsBtb" ShowInCustomizationForm="True" VisibleIndex="13">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="dsStokDipohon" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindLatestStockRegistrationByStoreId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="glStorDiPohon" DefaultValue="0" Name="StoreId" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kuantiti Dipohon">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtKuantitiDiPohon" ClientEnabled="true" ClientInstanceName="txtKuantitiDiPohon"  runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Dikehendaki" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="deTarikhDiperlukan" ClientEnabled="true" runat="server" ClientInstanceName="deTarikhDiperlukan" Width="100%" UseMaskBehavior="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tujuan" ColSpan="2" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="mmTujuan"  ClientEnabled="true" ClientInstanceName="mmTujuan"   runat="server" Height="71px" Width="100%">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Permohonan Kepada" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Penerima">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="cbPenerima" runat="server" Width="100%">
                                    <ClientSideEvents ValueChanged="function(s, e) {
	cbPenerimaValueChanged(s,e);
}" />
                                    <Items>
                                        <dx:ListEditItem Text="Stor Ptj" Value="0" />
                                        <dx:ListEditItem Text="Pengguna" Value="1" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="PTJ">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glPermohonanToPtj" runat="server" AutoGenerateColumns="False" ClientInstanceName="glPermohonanToPtj" DataSourceID="dsPtjKepada" KeyFieldName="PTJ_Id" Width="100%">
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
                                    <ClientSideEvents EndCallback="function(s, e) {
glPermohonanToStor.GetGridView().Refresh();	
}
" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="dsPtjKepada" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [PusatTanggungJawab]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nama">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glPermohonanToNama" runat="server" ClientInstanceName="glPermohonanToNama" Width="100%" AutoGenerateColumns="False" DataSourceID="dsEmployee" KeyFieldName="EmployeeSystemId" TextFormatString="{1}; {2}; {3}">
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
                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="dsEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT Employee.EmployeeSystemId,Employee.EmployeeIdNo, Employee.EmployeeName, Employee.EmployeeDesignation FROM Employee"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Stor">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="glPermohonanToStor" runat="server" AutoGenerateColumns="False" ClientInstanceName="glPermohonanToStor" DataSourceID="dsStorKepada" KeyFieldName="ST_StoreId" Width="100%">
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
                                <asp:SqlDataSource ID="dsStorKepada" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_FindAllStoreByPtjId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="glPermohonanToPtj" DefaultValue="0" Name="PtjId" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>



<dx:ASPxPopupControl ID="popupDeleteHeaderConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteHeaderConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteHeaderConfirmation_Label" runat="server" ClientInstanceName="popupDeleteHeaderConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDeleteHeader();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteHeaderConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


        





<dx:ASPxPopupControl ID="popupDeleteGridRowConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteGridRowConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol5" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteGridRowConfirmation_Label" runat="server" ClientInstanceName="popupDeleteGridRowConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteGridRowConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithMemberDelete();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteGridRowConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteGridRowConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


        






<dx:ASPxPopupControl ID="psStok" runat="server" AllowDragging="True" ClientInstanceName="psStok" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Stok" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
        <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectMember();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchEmployee.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ClientSideEvents Closing="function(s, e) {
	//popupSearchLembagaPemeriksa.SetContentUrl('about:blank');
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="glStok" runat="server" AutoGenerateColumns="False" ClientInstanceName="glStok" EnableCallbackAnimation="True" Width="100%" >
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>







        








<dx:ASPxTextBox ID="DeleteStokTemp" runat="server" ClientInstanceName="DeleteStokTemp" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>



        














        












        














        








<dx:ASPxCallbackPanel ID="cbp_AddNewPermohonan" runat="server" ClientInstanceName="cbp_AddNewPermohonan" OnCallback="cbp_AddNewPermohonan_Callback" Width="200px">
       <ClientSideEvents EndCallback="function(s, e) {
	cbp_AddNewPermohonan_EndCallback(s, e);
}" />
</dx:ASPxCallbackPanel>





        














        












        














        







