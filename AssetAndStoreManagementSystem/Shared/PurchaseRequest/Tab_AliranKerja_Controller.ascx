<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.PurchaseRequest.Tab_AliranKerja_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Aliran Kerja Untuk Transaksi Ini" CssClass="FormGroupBoxStyle" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                            <dx:ASPxGridView ID="GridPRWorkflow" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridPRWorkflow" DataSourceID="WorkFlowDs" EnableCallbackAnimation="True" OnCustomCallback="GridPrWorkflow_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="PRWFD_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PR_ProcessId" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="PRWFD_Date" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Aliran Kerja" FieldName="PRWFD_Workflow" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Pekerja" FieldName="PRWFD_EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PRWFD_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="PRWFD_Notes" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Versi TB" FieldName="PRWFD_Version" ShowInCustomizationForm="True" VisibleIndex="1">
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
                            <asp:SqlDataSource ID="WorkFlowDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="WorkFlowDs_Selecting" SelectCommand="SELECT * FROM [PermohonanBelian_WorkflowDiary]">
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



<dx:ASPxTextBox ID="Wf_ProcessId" runat="server" ClientInstanceName="Wf_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
