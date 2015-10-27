<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KEWPA05_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKEWPA.KEWPA05.KEWPA05_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_Print_EndCallback(s, e)
    { window.open('../../../Report/Viewer/Index.aspx'); }

    function btnGenerate_Click() {
        if (cb_PTJ.GetText() == '' || cb_Year.GetText() == '')
        { alert('Sila pilih PYJ dan Tahun terlebih dahulu.'); }
        else
        { MainGrid.PerformCallback(); }
    }

    function MainToolbar_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnPrint': Print(); break;
        }
    }

    function Print() {
        if (cb_PTJ.GetText() == '' || cb_Year.GetText() == '')
        { alert('Sila pilih PYJ dan Tahun terlebih dahulu.'); }
        else
        {
            cbp_Print.PerformCallback();
        }
    }
</script>
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="100%" HeaderText="KEWPA 4">
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="MainToolbar" runat="server" Width="100%" ClientInstanceName="MainToolbar" EnableClientSideAPI="True">
                    <ClientSideEvents ItemClick="function(s, e) {
	MainToolbar_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnPrint" Text="Cetak">
                            <Image IconID="print_print_32x32">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutItem Caption="Pusat Tanggungjawab">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                    <dx:ASPxComboBox ID="cb_PTJ" runat="server" DataSourceID="PtjDs" TextField="PTJ_FullName" ValueField="PTJ_SagaCode" Width="50%" ClientInstanceName="cb_PTJ" EnableClientSideAPI="True">
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="PtjDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_SagaCode], [PTJ_FullName] FROM [PusatTanggungJawab] ORDER BY [PTJ_FullName]"></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tahun Belian">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                    <dx:ASPxComboBox ID="cb_Year" runat="server" DataSourceID="YearDs" TextField="RECEIVEYEAR" ValueField="RECEIVEYEAR" ValueType="System.Int32" ClientInstanceName="cb_Year" EnableClientSideAPI="True">
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="YearDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" SelectCommand="SELECT distinct([RECEIVEYEAR]) [RECEIVEYEAR]
  FROM [AMS_DB].[dbo].[V_AssetInventoryRegistration_MainInformation]
  where [RECEIVEYEAR] IS NOT NULL
  order by [RECEIVEYEAR]"></asp:SqlDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                    <dx:ASPxButton ID="btnGenerate" runat="server" Text="Jana" AutoPostBack="False" ClientInstanceName="btnGenerate" EnableClientSideAPI="True" Width="140px">
                                        <ClientSideEvents Click="function(s, e) {
	btnGenerate_Click();
}" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxGridView ID="MainGrid" runat="server" AutoGenerateColumns="False" DataSourceID="GridDs" KeyFieldName="AIRMI_UniqueId" Width="100%" ClientInstanceName="MainGrid" OnCustomCallback="MainGrid_CustomCallback">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AIRMI_UniqueId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Bil." FieldName="RowNum" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AIRMI_RegistrationNumber" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama Aset" FieldName="AIRMI_Desc" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarikh Perolehan" FieldName="AIRMI_ReceivedDate" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Harga Perolehan Asal" FieldName="AIRMI_PurchasePrice" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" SelectCommand="select
[AIRMI_UniqueId]
,ROW_NUMBER() OVER(ORDER BY [AIRMI_RegistrationNumber]) as RowNum
,[AIRMI_RegistrationNumber]
,[AIRMI_Desc]
,[AIRMI_ReceivedDate]
,[AIRMI_PurchasePrice]
from V_AssetInventoryRegistration_MainInformation
where 1=1" OnSelecting="GridDs_Selecting"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxCallbackPanel ID="cbp_Print" runat="server" ClientInstanceName="cbp_Print" ClientVisible="False" OnCallback="cbp_Print_Callback" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Print_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent2" runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>