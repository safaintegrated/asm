<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Penempatan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Penempatan.Tab_Penempatan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function CheckHeader()
    {
        if (PH_EmpId.GetText() == '' || PH_PtjId.GetText() == '') {
            popupMsg_Label.SetText('Maklumat Kakitangan dan Pusat Tanggungjawab untuk penempatan diperlukan.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
        else { return true; }
    }

    function CheckDetails()
    {
        if (GridPenempatanList.GetVisibleRowsOnPage() > 0)
        { return true; }
        else
        {
            popupMsg_Label.SetText('Tiada aset alih yang dipilih untuk proses ini.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
    }

    function DeleteDetail(ID,RefNumber)
    {
        TempDeleteId.SetText(ID.toString());
        popupDeleteConfirmation_Label.SetText('Padam rekod aset alih <b>' + RefNumber.toString() + '</b>.<br>Anda pasti?');
        popupDeleteConfirmation.Show();
        popupDeleteConfirmation_BtnOk.Focus();
    }

    function ProceedWithDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod aset alih yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Penempatan.PerformCallback('DELETEDETAIL');
    }

    function SelectAssetInv()
    {
        LoadingPanel.SetText('Sistem sedang menambah rekod aset alih yang telah dipilih untuk proses penempatan.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_Penempatan.PerformCallback('ADDDETAIL');
    }

    function RefreshAssetLocation()
    {
        if (GridPenempatanList.GetVisibleRowsOnPage() > 0)
        {
            LoadingPanel.SetText('Sistem sedang memuat semula penempatan terkini untuk senarai aset alih.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_Penempatan.PerformCallback('REFRESH');
        }
        else
        {
            popupMsg_Label.SetText('Tiada aset alih telah dipilih untuk proses penempatan ini.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function ShowAssetInvPopup()
    {
        popupSearchAssetInv.SetWidth(screen.width * 0.85);
        popupSearchAssetInv.Show();
        GridSearchAssetInv.PerformCallback('OPEN');        
    }

    function cbp_Penempatan_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (s.cpMode.toString() == 'ADD')
            { ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true'); }
            else if (s.cpMode.toString() == 'ADDDETAIL')
            { popupSearchAssetInv.Hide(); }
            else if (s.cpMode.toString() == 'DELETEDETAIL')
            { popupDeleteConfirmation.Hide(); }
            else if (s.cpMode.toString() == 'SAVE')
            {
                GridPenempatanListEnableDisable('false');
                EnableDisableForm('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');

                popupMsg_Label.SetText('Rekod penempatan aset alih telah disimpan dengan jayanya.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
            else if (s.cpMode.toString() == 'POST')
            {
                GridPenempatanListEnableDisable('false');
                EnableDisableForm('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');

                popupMsg_Label.SetText('Rekod penempatan aset alih telah dihantar dengan jayanya.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                GridPenempatanListEnableDisable('false');
                EnableDisableForm('false');
                popupSearchPenempatan.Hide();

                if (PH_Status.GetText() == '')
                {
                    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true')
                }
                else if (PH_Status.GetText() == '2')
                {
                    ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true', 'true');
                }
                else if (PH_Status.GetText() == '3')
                { ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'true', 'true', 'true', 'true', 'true'); }
            }
        }
    }

    function EnableDisableForm(EnableDisable)
    {
        if (EnableDisable == 'true')
        {
            LinkLookupAssetInv.SetEnabled(true);
            LinkRefreshAssetLocation.SetEnabled(true);
            PH_PtjId.SetEnabled(true);
            PH_DeptId.SetEnabled(true);
            PH_BuildId.SetEnabled(true);
            PH_FloorId.SetEnabled(true);
            PH_SpaceID.SetEnabled(true);
            PH_EmpId.SetEnabled(true);
        }
        else
        {
            LinkLookupAssetInv.SetEnabled(false);
            LinkRefreshAssetLocation.SetEnabled(false);
            PH_PtjId.SetEnabled(false);
            PH_DeptId.SetEnabled(false);
            PH_BuildId.SetEnabled(false);
            PH_FloorId.SetEnabled(false);
            PH_SpaceID.SetEnabled(false);
            PH_EmpId.SetEnabled(false);
        }
    }

    function GridPenempatanListEnableDisable(Enable) {
        var PD_AssetInvUniqueId;

        for (var i = 0; i < GridPenempatanList.GetVisibleRowsOnPage() ; i++) {
            PD_AssetInvUniqueId = ASPxClientControl.GetControlCollection().GetByName('PD_AssetInvUniqueId' + i.toString());

            if (Enable == 'true')
            { PD_AssetInvUniqueId.SetVisible(true); }
            else
            { PD_AssetInvUniqueId.SetVisible(false); }
        }
    }

</script>

<dx:ASPxCallbackPanel ID="cbp_Penempatan" runat="server" ClientInstanceName="cbp_Penempatan" EnableClientSideAPI="True" OnCallback="cbp_Penempatan_Callback" Width="100%" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Penempatan_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="Ref_RefProcessId" runat="server" ColCount="3" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Penempatan Baru" ColCount="3" ColSpan="2" Width="80%">
                <Items>
                    <dx:LayoutItem Caption="Nama Pegawai" Width="34%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_EmpId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_EmpId" DataSourceID="EmpDs" EnableClientSideAPI="True" KeyFieldName="User_Id" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="User_Id" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ID Staf" FieldName="User_EmployeeId" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nama Staf" FieldName="User_Salutation" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(750);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [User_Id], [User_EmployeeId], [User_Salutation] FROM [V_User] WHERE ([User_StatusCode] = @User_StatusCode) ORDER BY [User_EmployeeId]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="User_StatusCode" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_PtjId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_PtjId" DataSourceID="PTJ_Ds" EnableClientSideAPI="True" KeyFieldName="PTJ_SagaCode" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="PTJ_SagaCode" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="PTJ_SmpCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(450);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="PTJ_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_SagaCode], [PTJ_SmpCode], [PTJ_FullName] FROM [PusatTanggungJawab] ORDER BY [PTJ_SmpCode]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat, Bahagian dan Jabatan" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_DeptId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_DeptId" DataSourceID="DeptDs" EnableClientSideAPI="True" KeyFieldName="Dept_Id" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Dept_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="Dept_Code" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(450);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="DeptDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Dept_Id], [Dept_Code], [Dept_Name] FROM [Department] ORDER BY [Dept_Code]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Bangunan dan Blok" Width="34%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_BuildId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_BuildId" DataSourceID="BuildingDs" EnableClientSideAPI="True" KeyFieldName="Build_Id" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Build_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="Build_Code" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(450);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="BuildingDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Build_Id], [Build_Code], [Build_Name] FROM [Building] ORDER BY [Build_Code]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Aras" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_FloorId" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_FloorId" DataSourceID="FloorDs" EnableClientSideAPI="True" KeyFieldName="Floor_Id" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Floor_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="Floor_Code" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(450);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="FloorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Floor_Id], [Floor_Code], [Floor_Name] FROM [Floor] ORDER BY [Floor_Code]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ruang" Width="33%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="PH_SpaceID" runat="server" AutoGenerateColumns="False" ClientInstanceName="PH_SpaceID" DataSourceID="SpaceDs" EnableClientSideAPI="True" KeyFieldName="Space_Id" TextFormatString="{2}" Width="100%">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Space_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kod" FieldName="Space_Code" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="85%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(450);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="SpaceDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Space_Id], [Space_Code], [Space_Name] FROM [Space] ORDER BY [Space_Code]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Rujukan" RowSpan="2" Width="20%">
                <Items>
                    <dx:LayoutItem Caption="No. Rujukan" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PH_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="PH_RefNumber" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Status">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PH_StatusText" runat="server" ClientEnabled="False" ClientInstanceName="PH_StatusText" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="PH_CreatedDate" runat="server" ClientEnabled="False" ClientInstanceName="PH_CreatedDate" EnableClientSideAPI="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nama Penyedia" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeName" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeName" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PTJ_Name" runat="server" ClientEnabled="False" ClientInstanceName="PTJ_Name" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat Emel" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeEmail" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeEmail" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Telefon" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeTelephone" runat="server" ClientEnabled="False" ClientInstanceName="EmployeeTelephone" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PH_ProcessId" runat="server" ClientInstanceName="PH_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PH_CreatedBy" runat="server" ClientInstanceName="PH_CreatedBy" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PH_Status" runat="server" ClientInstanceName="PH_Status" EnableClientSideAPI="True" Width="170px" ClientVisible="False" OnTextChanged="PH_Status_TextChanged">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Aset Di Dalam Penempatan Ini" ColCount="2" ColSpan="2" Width="80%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" Width="8%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxHyperLink ID="LinkLookupAssetInv" runat="server" ClientInstanceName="LinkLookupAssetInv" CssClass="myHyperlink" EnableTheming="True" Text="Carian Aset.." NavigateUrl="javascript: ShowAssetInvPopup();">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="92%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxHyperLink ID="LinkRefreshAssetLocation" runat="server" ClientInstanceName="LinkRefreshAssetLocation" EnableClientSideAPI="True" Text="Muat Semula Penempatan Aset Alih" CssClass="myHyperlink" NavigateUrl="javascript: RefreshAssetLocation();">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridView ID="GridPenempatanList" ClientInstanceName="GridPenempatanList" runat="server" AutoGenerateColumns="False" Width="100%" OnHtmlDataCellPrepared="GridPenempatanList_HtmlDataCellPrepared">
                                    <Columns>
                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0" FieldName="PD_ProcessId" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" FieldName="PD_AssetType" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="17" Width="4%" FieldName="PD_AssetInvUniqueId">
                                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="PD_AssetInvUniqueId" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" runat="server" Text="ASPxHyperLink">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>      
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriPtj" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriDept" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriBuild" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriFloor" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriSpace" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PD_OriEmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="8" Width="14%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="9" Width="14%">
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="16">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="14%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="14%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="10%">
                                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>      
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


<dx:ASPxPopupControl ID="popupSearchAssetInv" runat="server" AllowDragging="True" ClientInstanceName="popupSearchAssetInv" EnableClientSideAPI="True" HeaderText="Carian Aset Alih" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectAssetInv();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchAssetInv.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridSearchAssetInv" runat="server" ClientInstanceName="GridSearchAssetInv" Width="100%" AutoGenerateColumns="False" DataSourceID="SearchDs" KeyFieldName="AssInvUniqueId" EnableCallbackAnimation="True" OnAfterPerformCallback="GridSearchAssetInv_AfterPerformCallback" OnCustomCallback="GridSearchAssetInv_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="12%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="11%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="AIRMI_PoNumber" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. GRN" FieldName="AIRMI_GRNnumber" ShowInCustomizationForm="True" VisibleIndex="5" Width="7%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_DeptId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_BuildId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_FloorId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_SpaceID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_EmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="16">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="9%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="9%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                        
                    </dx:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
            </dx:GridViewBandColumn>
            <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="2%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetInvType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" SelectCommand="SELECT * FROM [V_LookupAssetAndInventoryLatestLocation] ORDER BY [AssInvRegNum]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
        <dx:ASPxTextBox runat="server" Width="170px" ClientInstanceName="TempDeleteId" EnableClientSideAPI="True" ID="TempDeleteId" ClientVisible="False"></dx:ASPxTextBox>
<dx:ASPxPopupControl ID="popupDeleteConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteConfirmation_Label" runat="server" ClientInstanceName="popupDeleteConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDelete();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteConfirmation.Hide();
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


        



