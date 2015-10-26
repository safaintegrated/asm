<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KategoriSubKategori_PopupManager.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.KategoriSubKategori.KategoriSubKategori_PopupManager" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_popupManagement_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            if (s.cpMode.toString() == 'LOAD') {
                UserPopupForm.SetEnabled(false);
                Manage_PopupUserManagement_Toolbar(true, false);

                if (EnableUpdate.GetText() == 'True')
                    PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(true);
                else
                    PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(false);

                PopupUserManagement.Show();
            }
            else {
                PopupUserManagement.Hide();
                popupMsg_Label.SetText('Rekod pengguna sistem berjaya dikemaskini.');
                popupMsg.Show();
            }
        }
    }

    function PopupUserManagement_Toolbar_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': SysUser_EditMode(); break;
            case 'btnSave': SysUser_SaveMode(); break;
            case 'btnSave': SysUser_CancelMode(); break;
        }
    }

    function SysUser_EditMode() {
        Manage_PopupUserManagement_Toolbar(false, true);
        UserPopupForm.SetEnabled(true);
    }

    function SysUser_SaveMode() {
        if (UserCre_UserGroupId.GetText() == '') {
            popupMsg_Label.SetText('Nama Kumupulan Pengguna Sistem perlu ditetapkan terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat pengguna sistem.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupManagement.PerformCallback('SAVE');

        }
    }

    function SysUser_CancelMode() {
        LoadingPanel.SetText('Sistem sedang membuka semula maklumat pengguna sistem.  Sila tunggu sebentar..');
    }

    function Manage_PopupUserManagement_Toolbar(btnEdit, btnSave, btnCancel) {
        PopupUserManagement_Toolbar.GetItemByName('btnEdit').SetEnabled(btnEdit);
        PopupUserManagement_Toolbar.GetItemByName('btnSave').SetEnabled(btnSave);
        PopupUserManagement_Toolbar.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>
<dx:ASPxPopupControl ID="PopupUserManagement" ClientInstanceName="PopupUserManagement" runat="server" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pengurusan Pengguna Sistem" MaxHeight="700px" MinHeight="400px" MinWidth="700px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
                        <dx:MenuItem Name="btnDelete" Text="Padam">
                            <Image IconID="edit_delete_16x16">
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
                <dx:ASPxCallbackPanel ID="cbp_popupManagement" runat="server" ClientInstanceName="cbp_popupManagement" OnCallback="cbp_popupManagement_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupManagement_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="UserPopupForm" ClientInstanceName="UserPopupForm" runat="server" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Kategori" ColCount="2" Width="100%">
                                        <Items>
                                            <dx:LayoutItem Caption="Nama" Width="60%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                        <dx:ASPxTextBox ID="UserPopupForm_E1" runat="server" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="VOT" Width="40%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                        <dx:ASPxTextBox ID="UserPopupForm_E2" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Sub-Kategori" Width="100%">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                                        <dx:ASPxButton ID="UserPopupForm_E3" runat="server" Text="Baharu" Width="120px">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False" Width="100%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                                        <dx:ASPxGridView ID="SubCatGrid" runat="server" Width="100%">
                                                        </dx:ASPxGridView>
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
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxTextBox ID="User_Id" ClientInstanceName="User_Id" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>

