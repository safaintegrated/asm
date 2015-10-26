<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pengeluaran.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Tab_Pengeluaran" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function chkAssetOfficer_CheckedChanged(s, e)
    {
        if (chkAssetOfficer.GetChecked())
        { btnAssetOfficerWithdraw.SetEnabled(true);}
        else
        { btnAssetOfficerWithdraw.SetEnabled(false); }
    }

    function cbp_AssetOfficerWithdraw_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'APPROVE')
            {
                PengeluaranAssetOfficerName.SetEnabled(false);
                PengeluaranDate.SetEnabled(false);
                btnAssetOfficerWithdraw.SetEnabled(false);
                cbp_Ref.PerformCallback();
                GridPrWorkflow.PerformCallback();
                popupMsg_Label.SetText('Status Permohonan Pinjaman telah berjaya dikemaskini.');
                popupMsg.Show();
            }
        }
    }

</script>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Pengeluaran Aset" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="GridWithdrawalList" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridWithdrawalList" Width="100%" DataSourceID="WithdrawListDs" OnCustomCallback="GridWithdrawalList_CustomCallback">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="PPD_ProcessId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_AssetType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Padam" FieldName="PPD_AssetInvUniqueId" ShowInCustomizationForm="True" VisibleIndex="17" Width="4%" Visible="False">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                          
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriPtj" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">                                           
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriDept" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriBuild" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriFloor" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriSpace" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPD_OriEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="8" Width="14%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="9" Width="18%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="16">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="14%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="14%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                    <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                            <asp:SqlDataSource ID="WithdrawListDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SELECT * FROM [V_PermohonanPinjaman_Detail] WHERE (([PPD_ProcessId] = @PPD_ProcessId) AND ([PPD_Revision] = @PPD_Revision)) ORDER BY [AssInvRegNum]" OnSelecting="WithdrawListDs_Selecting">
                                <SelectParameters>
                                    <asp:Parameter Name="PPD_ProcessId" Type="String" />
                                    <asp:Parameter Name="PPD_Revision" Type="Int32" />
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

<dx:ASPxCallbackPanel ID="cbp_AssetOfficerWithdraw" runat="server" ClientInstanceName="cbp_AssetOfficerWithdraw" EnableCallbackAnimation="True" OnCallback="cbp_AssetOfficerWithdraw_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_AssetOfficerWithdraw_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Perakuan" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxCheckBox ID="chkAssetOfficer" runat="server" CheckState="Unchecked" ClientInstanceName="chkAssetOfficer" EnableClientSideAPI="True" Text="Saya mengaku bahawa maklumat pengeluaran aset ini adalah benar.">
                                    <ClientSideEvents CheckedChanged="function(s, e) {
	chkAssetOfficer_CheckedChanged(s, e);
}" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnAssetOfficerWithdraw" runat="server" AutoPostBack="False" ClientInstanceName="btnAssetOfficerWithdraw" EnableClientSideAPI="True" Text="Ok" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	cbp_AssetOfficerWithdraw.PerformCallback('APPROVE');
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nama" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PengeluaranAssetOfficerName" runat="server" ClientEnabled="False" EnableClientSideAPI="True" Width="40%" ClientInstanceName="PengeluaranAssetOfficerName">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="PengeluaranDate" runat="server" ClientEnabled="False" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="120px" ClientInstanceName="PengeluaranDate">
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
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxTextBox ID="txtWithdrawProcessId" runat="server" ClientInstanceName="txtWithdrawProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="txtWithdrawRev" runat="server" ClientInstanceName="txtWithdrawRev" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


