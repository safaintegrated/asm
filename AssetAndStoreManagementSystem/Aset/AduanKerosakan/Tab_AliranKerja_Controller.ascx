<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.AduanKerosakan.Tab_AliranKerja_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Aliran Kerja Untuk Transaksi Ini" CssClass="FormGroupBoxStyle" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                            <dx:ASPxGridView ID="GridAkWorkflow" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridAkWorkflow" DataSourceID="WorkFlowDs" EnableCallbackAnimation="True" OnCustomCallback="GridAkWorkflow_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="AK_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="AK_Date" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Aliran Kerja" FieldName="PRWFD_Workflow" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Pekerja" FieldName="AK_EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4" Width="30%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="AK_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="AK_Notes" ShowInCustomizationForm="True" VisibleIndex="6" Width="40%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Versi PB" FieldName="AK_Version" ShowInCustomizationForm="True" VisibleIndex="0" Width="5%" Visible="False">
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
                            <asp:SqlDataSource ID="WorkFlowDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="WorkFlowDs_Selecting" SelectCommand="SELECT [AK_RowId], [AK_Date], [PRWFD_Workflow], [AK_EmployeeName], [AK_Status], [AK_Notes], [AK_Version] FROM [V_AduanKerosakan_WorkflowDiary] WHERE ([AK_ProcessId_ProcessId] = @AK_ProcessId_ProcessId) ORDER BY [AK_Date] DESC">
                                <SelectParameters>
                                    <asp:Parameter Name="AK_ProcessId_ProcessId" Type="String" />
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



<dx:ASPxTextBox ID="AK_ProcessId_ProcessId" runat="server" ClientInstanceName="AK_ProcessId_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>

