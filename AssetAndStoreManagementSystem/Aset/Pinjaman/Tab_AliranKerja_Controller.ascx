<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Tab_AliranKerja_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Aliran Kerja Untuk Transaksi Ini" CssClass="FormGroupBoxStyle" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="GridPrWorkflow" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridPrWorkflow" DataSourceID="WorkFlowDs" EnableCallbackAnimation="True" OnCustomCallback="GridPrWorkflow_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="PPWD_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="PPWD_Date" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Aliran Kerja" FieldName="PPWD_Workflow" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Pekerja" FieldName="PPWD_EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4" Width="25%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="PPWD_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="PPWD_Notes" ShowInCustomizationForm="True" VisibleIndex="6" Width="40%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Versi PP" FieldName="PPWD_Version" ShowInCustomizationForm="True" VisibleIndex="0" Width="5%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
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
                            <asp:SqlDataSource ID="WorkFlowDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="WorkFlowDs_Selecting" SelectCommand="SELECT [PPWD_RowId], [PPWD_Date], [PPWD_Workflow], [PPWD_EmployeeName], [PPWD_Status], [PPWD_Notes], [PPWD_Version] FROM [V_PermohonanPinjaman_WorkflowDiary] WHERE ([PP_ProcessId] = @PP_ProcessId) ORDER BY [PPWD_Date] DESC">
                                <SelectParameters>
                                    <asp:Parameter Name="PP_ProcessId" Type="String" />
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



<dx:ASPxTextBox ID="Wf_ProcessId" runat="server" ClientInstanceName="Wf_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>




