<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.Tab_AliranKerja_Controller" %>
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
                                    <dx:GridViewDataTextColumn FieldName="LKWFD_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="LKWFD_Date" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Aliran Kerja" FieldName="LKWFD_Workflow" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nama Pekerja" FieldName="LKWFD_EmployeeName" ShowInCustomizationForm="True" VisibleIndex="4" Width="30%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="LKWFD_Status" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="LKWFD_Notes" ShowInCustomizationForm="True" VisibleIndex="6" Width="35%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Versi LK" FieldName="LKWFD_Version" ShowInCustomizationForm="True" VisibleIndex="0" Width="5%">
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
                            <asp:SqlDataSource ID="WorkFlowDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="WorkFlowDs_Selecting" SelectCommand="SELECT [LKWFD_RowId], [LKWFD_Date], [LKWFD_Workflow], [LKWFD_EmployeeName], [LKWFD_Status], [LKWFD_Notes], [LKWFD_Version] FROM [V_LaporanKehilangan_WorkflowDiary] WHERE ([LKH_ProcessId] = @LKH_ProcessId) ORDER BY [LKWFD_Date] DESC">
                                <SelectParameters>
                                    <asp:Parameter Name="LKH_ProcessId" Type="String" />
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



<dx:ASPxTextBox ID="AliranKerja_ProcessId" runat="server" ClientInstanceName="AliranKerja_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>

