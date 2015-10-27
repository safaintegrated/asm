<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pengeluaran.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.Tab_Pengeluaran" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<style>
    .AddTopPadding 
    {
        padding-top:15px;
    }
</style>

<dx:ASPxCallbackPanel ID="cbpKelulusan" EnableClientSideAPI="true" runat="server" ClientInstanceName="cbpKelulusan" Width="100%" OnCallback="cbpKelulusan_Callback">
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="96%">
        <Items>
            <dx:LayoutGroup Caption="Butiran Permohonan" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtKelulusanProcessId" runat="server" ClientInstanceName="txtKelulusanProcessId" Width="170px">
                                </dx:ASPxTextBox>
                                <dx:ASPxTextBox ID="txtKelulusanProcessIdTemp" runat="server" ClientInstanceName="txtKelulusanProcessIdTemp" Width="170px">
                                </dx:ASPxTextBox>
                                <dx:ASPxGridView ID="gvStokRequested" runat="server" AutoGenerateColumns="False" ClientInstanceName="gvStokRequested" DataSourceID="dsStokRequested" KeyFieldName="ProcessId" OnCustomCallback="gvStokRequested_CustomCallback" Width="100%">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="No Permohonan" FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ProcessIdTemp" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmpSysId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Tujuan" FieldName="Purpose" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh Permohonan" FieldName="CreationDate" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh Diperlukan" FieldName="RequiredDate" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" ShowInCustomizationForm="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PtjDiPohon" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StorDiPohon" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="StokDiPohon" ShowInCustomizationForm="True" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="KuantitDiPohon" ShowInCustomizationForm="True" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="EmployeeIdNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Visible="False">
                                    </SettingsPager>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsStokRequested" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SP_GetPermohonanStockByProcessId" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtKelulusanProcessId" DefaultValue="0" Name="ProcessId" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Kelulusan" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama Pegawai" CssClass="AddTopPadding" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="AddTopPadding">
                                <dx:ASPxTextBox ID="txtKelulusanNama" runat="server" AutoPostBack="True" ClientInstanceName="txtKelulusanNama" CssClass="TextBoxForName">
                                </dx:ASPxTextBox>
                                <dx:ASPxTextBox ID="txtKelulusanEmpSysId" runat="server" ClientInstanceName="txtKelulusanEmpSysId" CssClass="TextBoxForName">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Jawatan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtKelulusanJawatan" runat="server" ClientInstanceName="txtKelulusanJawatan" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Jabatan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtKelulusanJabatan" runat="server" ClientInstanceName="txtKelulusanJabatan" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tindakan" Visible="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="cbKelulusanTindakan" runat="server" ClientInstanceName="cbKelulusanTindakan" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Tidak Lulus" Value="0" />
                                        <dx:ListEditItem Text="Lulus" Value="1" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kuantiti Diluluskan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtKelulusanKuantiti" runat="server" ClientInstanceName="txtKelulusanKuantiti" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnLulus" runat="server" Text="Lulus" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	KemaskiniLulus();
 //('2');
//SelectedIndex == 2 ? ProcessStateType.Lulus;
}" />
                                </dx:ASPxButton>
                                &nbsp;&nbsp;&nbsp;
                                <dx:ASPxButton ID="btnTidakLulus" runat="server" Text="Tidak Lulus" Width="100px" OnClick="btnTidakLulus_Click">
                                    <ClientSideEvents Click="function(s, e) {
	KemaskiniTidakLulus();
}" />
                                </dx:ASPxButton>
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


