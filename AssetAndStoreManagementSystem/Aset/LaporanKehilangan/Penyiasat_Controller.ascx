<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Penyiasat_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.Penyiasat_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_SavePostPP_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'POST')
            {
                GridPPEnableDisable('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                GridAkWorkflow.PerformCallback();                
                LookupPP.SetEnabled(false);
                PP_EditMode.SetText('0');

                if (OpenFromMyTask.GetText() == '1')
                { opener.RefreshGrid(); }

                if (s.cpMailError.toString() == '') {
                    popupMsg_Label.SetText('Pegawai Penyiasat untuk Laporan Kehilangan ini telah berjaya dilantik.');
                    popupMsg.Show();
                }
                else
                {
                    popupMsg_Label.SetText('Lantikan Pegawai Penyiasat telah berjaya disimpan tetapi sistem menghadapi masalah ketika menghantar emel notifikasi kepada pegawai-pegawai penyiasat yang dilantik.<br><br>Masalah: ' + s.cpMailError.toString());
                    popupMsg.Show();
                }
               
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                ManageMainRibbonUtamaTab('false', 'false', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Pegawai Penyiasat untuk Laporan Kehilangan ini telah berjaya disimpan.');
                popupMsg.Show();
            }
        }
    }

    function SelectPegawaiPenyiasat()
    {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod pegawai penyiasat yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        GridSelectedPegawaiPenyiasat.PerformCallback('ADD');
    }

    function SelectInvestigator()
    {
        popupSearchPegawaiPenyiasat.SetWidth(screen.width * 0.7);
        popupSearchPegawaiPenyiasat.Show();
        GridSearchPegawaiPenyiasat.PerformCallback();
    }

    function GridSelectedPegawaiPenyiasat_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'LOAD')
            {
                if (PP_EditMode.GetText() == '0')
                    GridPPEnableDisable('false');
                else
                    GridPPEnableDisable('true');
            }
            else if (s.cpMode.toString() == 'ADD')
            { popupSearchPegawaiPenyiasat.Hide(); }
            else if (s.cpMode.toString() == 'DELETE')
            { popupDeleteConfirmation.Hide(); }
        }
    }

    function GridPPEnableDisable(truefalse)
    {
        var LKIB_InvestigatorEmpId;
        var LKIB_Role;

        for (var i = 0; i < GridSelectedPegawaiPenyiasat.GetVisibleRowsOnPage() ; i++)
        {
            LKIB_InvestigatorEmpId = ASPxClientControl.GetControlCollection().GetByName('LKIB_InvestigatorEmpId' + i.toString());
            LKIB_Role = ASPxClientControl.GetControlCollection().GetByName('LKIB_Role' + i.toString());

            if (truefalse == 'true')
            {
                LKIB_InvestigatorEmpId.SetVisible(true);
                LKIB_Role.SetEnabled(true);
            }
            else
            {
                LKIB_InvestigatorEmpId.SetVisible(false);
                LKIB_Role.SetEnabled(false);
            }
        }
    }

    function DeletePegawaiPenyiasat(EmpId)
    {
        TempDeletePP.SetText(EmpId.toString());
        popupDeleteConfirmation.Show();
    }

    function ProceedWithDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod pengawai penyiasat yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        GridSelectedPegawaiPenyiasat.PerformCallback('DELETE');
    }

    function CheckPPGrid()
    {
        var lpass = true;
        var LKIB_Role;

        for (var i = 0; i < GridSelectedPegawaiPenyiasat.GetVisibleRowsOnPage() ; i++)
        {
            LKIB_Role = ASPxClientControl.GetControlCollection().GetByName('LKIB_Role' + i.toString());

            if (LKIB_Role.GetText() == '')
            {
                lpass = false;
                popupMsg_Label.SetText('Sila pastikan peranan untuk kesemua Pegawai Penyiasat telah diisi.<br>Sila semak dan cuba sekali lagi.');
                popupMsg.Show();
            }

            if (!lpass)
                break;
        }

        return lpass;
    }
</script>


<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                    <dx:ASPxHyperLink ID="LookupPP" runat="server" Text="Pilih pegawai penyiasat.." ClientInstanceName="LookupPP" CssClass="myHyperlink" EnableClientSideAPI="True" NavigateUrl="javascript: SelectInvestigator();">
                    </dx:ASPxHyperLink>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
        <dx:LayoutItem ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server">
                    <dx:ASPxGridView ID="GridSelectedPegawaiPenyiasat" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridSelectedPegawaiPenyiasat" EnableCallbackAnimation="True" KeyFieldName="LKIB_ProcessId" OnCustomCallback="GridSelectedPegawaiPenyiasat_CustomCallback" OnHtmlDataCellPrepared="GridSelectedPegawaiPenyiasat_HtmlDataCellPrepared">
                                                                                    <ClientSideEvents EndCallback="function(s, e) {
	GridSelectedPegawaiPenyiasat_EndCallback(s, e);
}" />
                                                                                    <Columns>
                                                                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0" FieldName="LKIB_ProcessId" ReadOnly="True" Visible="False">
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" FieldName="LKIB_Rev" ReadOnly="True" Visible="False">
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="10" Width="4%" FieldName="LKIB_InvestigatorEmpId" ReadOnly="True">
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>     
                                                                                            <DataItemTemplate>
                                                                                                <dx:ASPxHyperLink ID="LKIB_InvestigatorEmpId" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink" ImageUrl="~/Public/Images/GridIcons/GridDelete.png">
                                                                                                </dx:ASPxHyperLink>
                                                                                            </DataItemTemplate>                                                                                       
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="3" Width="21%" FieldName="EmployeeName" ReadOnly="True">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="4" Width="12%" FieldName="EmployeeDesignation" ReadOnly="True">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="5" Width="5%" FieldName="EmployeeGrade" ReadOnly="True">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Alamat Emel" ShowInCustomizationForm="True" VisibleIndex="6" Width="15%" FieldName="LKIB_Email">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="No. Telefon" ShowInCustomizationForm="True" VisibleIndex="7" Width="7%" FieldName="LKIB_Telephone">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn FieldName="LKIB_Department" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="20%">
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Peranan" FieldName="LKIB_Role" ShowInCustomizationForm="True" VisibleIndex="9" Width="11%">
                                                                                            <DataItemTemplate>
                                                                                                <dx:ASPxComboBox ID="LKIB_Role" runat="server" DataSourceID="RoleDs" EnableClientSideAPI="True" TextField="LKPP_RoleName" ValueField="LKPP_RoleId" ValueType="System.Int32" Width="100%">
                                                                                                </dx:ASPxComboBox>
                                                                                                <asp:SqlDataSource ID="RoleDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [LaporanKehilangan_PegawaiPenyiasatRole] ORDER BY [LKPP_RoleName]"></asp:SqlDataSource>
                                                                                            </DataItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                                                        </dx:GridViewDataTextColumn>
                                                                                    </Columns>
                                                                                    <SettingsBehavior AllowFocusedRow="True" />
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
</dx:ASPxFormLayout>

<dx:ASPxPopupControl ID="popupSearchPegawaiPenyiasat" runat="server" AllowDragging="True" ClientInstanceName="popupSearchPegawaiPenyiasat" EnableClientSideAPI="True" HeaderText="Carian Aset Alih" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectPegawaiPenyiasat();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchPegawaiPenyiasat.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearchPegawaiPenyiasat" runat="server" ClientInstanceName="GridSearchPegawaiPenyiasat" Width="100%" AutoGenerateColumns="False" DataSourceID="SearchDs" EnableCallbackAnimation="True" OnAfterPerformCallback="GridSearchPegawaiPenyiasat_AfterPerformCallback" OnCustomCallback="GridSearchPegawaiPenyiasat_CustomCallback" KeyFieldName="EmployeeId">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="EmployeeId" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Nama" Width="28%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Jawatan" Width="15%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeDepartment" ShowInCustomizationForm="True" VisibleIndex="6" ReadOnly="True" Caption="Pusat, Bahagian dan Jabatan" Width="27%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeDepartmentId" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeEmail" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Alamat Emel" Width="15%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeGrade" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Gred" Width="5%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ShowInCustomizationForm="True" VisibleIndex="8" Caption="No. Telefon" Width="5%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Pilih" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="2" Width="5%">
                 <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewCommandColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [EmployeeId], [EmployeeName], [EmployeeDesignation], [EmployeeDepartment], [EmployeeDepartmentId], [EmployeeEmail], [EmployeeGrade], [EmployeeTelephone] FROM [V_Employee_PTJ] WHERE ([EmployeeStatusBoolean] = @EmployeeStatusBoolean) ORDER BY [EmployeeName]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="EmployeeStatusBoolean" Type="Boolean" />
            </SelectParameters>
    </asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxTextBox ID="PP_RefNumber" ClientInstanceName="PP_RefNumber" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>
<dx:ASPxTextBox ID="TempDeletePP" ClientInstanceName="TempDeletePP" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>
<dx:ASPxTextBox ID="PP_ProcessId" ClientInstanceName="PP_ProcessId" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>
<dx:ASPxTextBox ID="PP_Rev" ClientInstanceName="PP_Rev" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px"></dx:ASPxTextBox>
<dx:ASPxTextBox ID="PP_EditMode" ClientInstanceName="PP_EditMode" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px" Text="0"></dx:ASPxTextBox>
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


        




<dx:ASPxCallbackPanel ID="cbp_SavePostPP" runat="server" ClientInstanceName="cbp_SavePostPP" ClientVisible="False" OnCallback="cbp_SavePostPP_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SavePostPP_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



        




