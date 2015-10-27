<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Verifikasi.Tab_AliranKerja" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function RefreshAliranKerja()
    {
        var AliranKerjaTab = PageControl.GetTab(2);
        AliranKerjaTab.SetVisible(true);
        PEM_WFD_PEMH_RowId.SetText(PEMH_RowId.GetText());
        GridWorkflow.PerformCallback();
    }
</script>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Aliran Kerja Untuk Transaksi Ini" CssClass="FormGroupBoxStyle" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                            <dx:ASPxGridView ID="GridWorkflow" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridWorkflow" DataSourceID="WorkFlowDs" EnableCallbackAnimation="True" OnCustomCallback="GridWorkflow_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="PEM_WFD_Date" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Aliran Kerja" FieldName="PEM_WFD_Workflow" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" ToolTip="30%">
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="PEM_WFD_EmployeeName" ShowInCustomizationForm="True" VisibleIndex="2" Width="30%">
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="PEM_WFD_Notes" ShowInCustomizationForm="True" VisibleIndex="3" Width="30%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                        
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
                            <asp:SqlDataSource ID="WorkFlowDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="WorkFlowDs_Selecting" SelectCommand="SELECT [PEM_WFD_Date], [PEM_WFD_Workflow], [PEM_WFD_EmployeeName], [PEM_WFD_Notes] FROM [V_Pemeriksaan_WorkflowDiary] WHERE ([PEM_WFD_PEMH_RowId] = @PEM_WFD_PEMH_RowId) ORDER BY [PEM_WFD_Date] DESC">
                                <SelectParameters>
                                    <asp:Parameter Name="PEM_WFD_PEMH_RowId" Type="Int32" />
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
    <Paddings Padding="0px" />
    <Border BorderStyle="None" />
</dx:ASPxFormLayout>



<dx:ASPxTextBox ID="PEM_WFD_PEMH_RowId" runat="server" ClientInstanceName="PEM_WFD_PEMH_RowId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>

