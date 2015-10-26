<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PenggunaSistem_PopupManager.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem.PenggunaSistem_PopupManager" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_PopupUserManagement_EndCallback(s, e)
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
            if (s.cpMode.toString() == 'LOAD')
            {
                UserPopupForm.SetEnabled(false);
                Manage_PopupUserManagement_Toolbar(true, false);

                if (EnableUpdate.GetText() == 'True')
                    PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(true);
                else
                    PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(false);

                PopupUserManagement.Show();
            }
            else
            {
                PopupUserManagement.Hide();
                popupMsg_Label.SetText('Rekod pengguna sistem berjaya dikemaskini.');
                popupMsg.Show();
            }
        }
    }

    function PopupUserManagement_Toolbar_ItemClick(s, e)
    {
        switch (e.item.name)
        {
            case 'btnEdit': SysUser_EditMode(); break;
            case 'btnSave': SysUser_SaveMode(); break;
            case 'btnSave': SysUser_CancelMode(); break;
        }
    }

    function SysUser_EditMode()
    {
        Manage_PopupUserManagement_Toolbar(false, true);
        UserPopupForm.SetEnabled(true);
    }

    function SysUser_SaveMode()
    {
        if (UserCre_UserGroupId.GetText() == '')
        {
            popupMsg_Label.SetText('Nama Kumupulan Pengguna Sistem perlu ditetapkan terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat pengguna sistem.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_PopupUserManagement.PerformCallback('SAVE');

        }
    }

    function SysUser_CancelMode()
    {
        LoadingPanel.SetText('Sistem sedang membuka semula maklumat pengguna sistem.  Sila tunggu sebentar..');
    }

    function Manage_PopupUserManagement_Toolbar(btnEdit, btnSave, btnCancel)
    {
        PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(btnEdit);
        PopupUserManagement_Toolbar.GetItemByName('btnSave').SetEnabled(btnSave);
        PopupUserManagement_Toolbar.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>
<dx:ASPxPopupControl ID="PopupUserManagement" ClientInstanceName="PopupUserManagement" runat="server" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pengurusan Pengguna Sistem" MaxHeight="700px" MinHeight="400px" MinWidth="700px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="PopupUserManagement_Toolbar" runat="server" Width="100%" ClientInstanceName="PopupUserManagement_Toolbar" EnableClientSideAPI="True">
                    <ClientSideEvents ItemClick="function(s, e) {
	PopupUserManagement_Toolbar_ItemClick(s, e);
}" />
                    <Items>
                        <dx:MenuItem Name="btnEdit" Text="Kemaskini">
                            <Image IconID="edit_edit_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnSave" Text="Simpan">
                            <Image IconID="save_save_16x16">
                            </Image>
                        </dx:MenuItem>
                        <dx:MenuItem Name="btnCancel" Text="Batal">
                            <Image IconID="actions_cancel_16x16">
                            </Image>
                        </dx:MenuItem>
                    </Items>
                </dx:ASPxMenu>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <dx:ASPxCallbackPanel ID="cbp_PopupUserManagement" runat="server" ClientInstanceName="cbp_PopupUserManagement" OnCallback="cbp_PopupUserManagement_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_PopupUserManagement_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="UserPopupForm" ClientInstanceName="UserPopupForm" runat="server" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Staf">
                                        <Items>
                                            <dx:LayoutItem Caption="Nama">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="User_Name" runat="server" Text="ASPxLabel">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Id">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="User_EmployeeId" runat="server" Text="ASPxLabel">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Jawatan">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="Dsgt_Name" runat="server" Text="ASPxLabel">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Pusat Tanggungjawab">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxLabel ID="PTJ_FullName" runat="server" Text="ASPxLabel">
                                                        </dx:ASPxLabel>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Konfigurasi Pengguna">
                                        <Items>
                                            <dx:LayoutItem Caption="Kumpulan Pengguna Sistem">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="UserCre_UserGroupId" runat="server" ClientInstanceName="UserCre_UserGroupId" DataSourceID="UserGroupDs" EnableClientSideAPI="True" TextField="UserDefinedId" ValueField="UserGroupId" ValueType="System.Int32" Width="80%">
                                                        </dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="UserGroupDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [UserDefinedId], [UserGroupId] FROM [SystemUserGroup] WHERE ([ActiveIndicator] = @ActiveIndicator) ORDER BY [UserDefinedId]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="True" Name="ActiveIndicator" Type="Boolean" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Akses Semua PTJ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxCheckBox ID="UserCre_AllPtj" runat="server" CheckState="Unchecked" ClientInstanceName="UserCre_AllPtj" EnableClientSideAPI="True">
                                                        </dx:ASPxCheckBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="Grid_PopupUserManagement" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_PopupUserManagement" Width="100%" OnHtmlDataCellPrepared="Grid_PopupUserManagement_HtmlDataCellPrepared">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Pilih" FieldName="RoleCount" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxCheckBox ID="RoleCount" EnableClientSideAPI="true" runat="server"></dx:ASPxCheckBox>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Fungsi" FieldName="RoleName" ShowInCustomizationForm="True" VisibleIndex="1" Width="90%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="RoleId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
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
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:ASPxFormLayout>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxTextBox ID="User_Id" ClientInstanceName="User_Id" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>


