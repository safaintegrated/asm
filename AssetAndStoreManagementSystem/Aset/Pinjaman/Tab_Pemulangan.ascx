<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Pemulangan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pinjaman.Tab_Pemulangan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function chkAOreturn_CheckedChanged(s, e) {
        if (chkAOreturn.GetChecked())
        { btnAOreturn.SetEnabled(true); }
        else
        { btnAOreturn.SetEnabled(false); }
    }

    function cbp_Return_EndCallback(s, e)
    {
        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'APPROVE') {
                PengeluaranAssetOfficerName.SetEnabled(false);
                PengeluaranDate.SetEnabled(false);
                btnAssetOfficerWithdraw.SetEnabled(false);
                cbp_Ref.PerformCallback();
                GridPrWorkflow.PerformCallback();
                EnableDisableGrid('false');
                popupMsg_Label.SetText('Status Permohonan Pinjaman telah berjaya dikemaskini.');
                popupMsg.Show();                
            }
            else if (s.cpMode.toString() == 'CHECK')
            {
                if (s.cpIsAssetOfficer.toString() == '0') {
                    chkAOreturn.SetEnabled(false);
                    btnAOreturn.SetEnabled(false);
                    EnableDisableGrid('false');
                }
                else
                {
                    chkAOreturn.SetEnabled(true);
                    btnAOreturn.SetEnabled(false);
                    EnableDisableGrid('true');
                }
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                chkAOreturn.SetEnabled(false);
                btnAOreturn.SetEnabled(false);
                EnableDisableGrid('false');
            }
        }
    }

    function EnableDisableGrid(truefalse)
    {
        var PPD_ReturnNotes;
        var PPD_ReturnStatus;

        for (var i = 0; i < GridReturnList.GetVisibleRowsOnPage() ; i++)
        {
            PPD_ReturnNotes = ASPxClientControl.GetControlCollection().GetByName('PPD_ReturnNotes' + i.toString());
            PPD_ReturnStatus = ASPxClientControl.GetControlCollection().GetByName('PPD_ReturnStatus' + i.toString());

            if (truefalse == 'true')
            {
                PPD_ReturnNotes.SetEnabled(true);
                PPD_ReturnStatus.SetEnabled(true);
            }
            else
            {
                PPD_ReturnNotes.SetEnabled(false);
                PPD_ReturnStatus.SetEnabled(false);
            }
        }
    }
</script>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Senarai Pemulangan Aset" Width="100%">
            <Items>
                <dx:LayoutItem ShowCaption="False" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                            <dx:ASPxGridView ID="GridReturnList" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridReturnList" DataSourceID="ReturnDs" KeyFieldName="PPD_ProcessId" OnCustomCallback="GridReturnList_CustomCallback" OnHtmlDataCellPrepared="GridReturnList_HtmlDataCellPrepared">
                                <Columns>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" Width="26%" FieldName="AssInvDesc" ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="14%" FieldName="AssInvRegNum" ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="2" FieldName="PPD_ProcessId" ReadOnly="True" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="3" FieldName="PPD_Revision" ReadOnly="True" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_AssetType" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_AssetInvUniqueId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriPtj" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriDept" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriBuild" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriFloor" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriSpace" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PPD_OriEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status Aset" FieldName="PPD_ReturnStatus" ShowInCustomizationForm="True" VisibleIndex="12" Width="10%">
                                        <DataItemTemplate>
                                            <dx:ASPxComboBox ID="PPD_ReturnStatus" runat="server" DataSourceID="StatusDs" EnableClientSideAPI="True" TextField="StatusName" ValueField="StatusId" ValueType="System.Int32" Width="100%">
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="StatusDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [Master_AssetStatus] WHERE [StatusId] IN (1,2,4) ORDER BY [StatusName]"></asp:SqlDataSource>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Catatan" FieldName="PPD_ReturnNotes" ShowInCustomizationForm="True" VisibleIndex="13" Width="50%">
                                        <DataItemTemplate>
                                            <dx:ASPxTextBox ID="PPD_ReturnNotes" runat="server" EnableClientSideAPI="True" Width="100%">
                                            </dx:ASPxTextBox>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PTJ_Name" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Dept_Name" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Build_Name" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Floor_Name" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Space_Name" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                                    </dx:GridViewDataTextColumn>
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
                            <asp:SqlDataSource ID="ReturnDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="ReturnDs_Selecting" SelectCommand="SELECT * FROM [V_PermohonanPinjaman_Detail] WHERE (([PPD_ProcessId] = @PPD_ProcessId) AND ([PPD_Revision] = @PPD_Revision)) ORDER BY [AssInvRegNum]">
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



<dx:ASPxCallbackPanel ID="cbp_Return" runat="server" ClientInstanceName="cbp_Return" EnableCallbackAnimation="True" OnCallback="cbp_Return_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
cbp_Return_EndCallback(s, e);	
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
                                <dx:ASPxCheckBox ID="chkAOreturn" runat="server" CheckState="Unchecked" Text="Saya mengaku bahawa maklumat pemulangan aset ini adalah benar." ClientInstanceName="chkAOreturn" EnableClientSideAPI="True">
                                    <ClientSideEvents CheckedChanged="function(s, e) {
	chkAOreturn_CheckedChanged(s, e);
}" />
                                </dx:ASPxCheckBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnAOreturn" runat="server" Text="Ok" Width="100px" ClientInstanceName="btnAOreturn" EnableClientSideAPI="True" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	cbp_Return.PerformCallback('APPROVE');
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nama" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="TxtAOreturn" runat="server" Width="40%" ClientEnabled="False" ClientInstanceName="TxtAOreturn" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="DateAOreturn" runat="server" Width="120px" ClientInstanceName="DateAOreturn" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True">
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

<dx:ASPxTextBox ID="RetProcessId" runat="server" ClientInstanceName="RetProcessId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="RetRevision" runat="server" ClientInstanceName="RetRevision" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>


