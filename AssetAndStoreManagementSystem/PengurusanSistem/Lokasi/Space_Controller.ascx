<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Space_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.Space_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function Space_ViewRecord(Idx) {
        Space_Id.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod Ruang yang telah dipiih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupSpace.PerformCallback('LOAD');
    }

    function Space_OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupSpace.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupSpace.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupSpace.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupSpace.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupSpace.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupSpace.GetItemByName("btnDelete").SetVisible(false);

    }

    function AddMode_SpaceTab() {
        Space_ScreenMode.SetText('2');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Ruang baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupSpace.PerformCallback('NEW');
    }

    function Toolbar_popupSpace_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': Space_EditMode(); break;
            case 'btnSave': Space_SaveMode(); break;
            case 'btnDelete': Space_DeleteMode(); break;
            case 'btnCancel': Space_CancelMode(); break;
        }
    }

    function Space_EditMode() {
        Space_ManagePopupToolbar(false, true, true, true);
        Form_Space.SetEnabled(true);
    }

    function Space_SaveMode()
    {
        if (Space_Code.GetText() == '' || Space_Name.GetText() == '') {
            popupMsg_Label.SetText('Kod dan Nama perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Ruang.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupSpace.PerformCallback('SAVE');
        }
    }

    function Space_DeleteMode() {
        LoadingPanel.SetText('Sistem sedang memadam rekod Ruang yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupSpace.PerformCallback('DELETE');

    }

    function Space_CancelMode() {
        popupSpace.Hide();
    }

    function cbp_popupSpace_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                Form_Space.SetEnabled(true);
                Space_ManagePopupToolbar(false, true, false, true);
                popupSpace.Show();
            }
            else if (s.cpMode.toString() == 'LOAD') {
                Form_Space.SetEnabled(false);
                Space_ManagePopupToolbar(true, false, false, false);
                popupSpace.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupSpace.Hide();
                popupMsg_Label.SetText('Rekod Ruang telah disimpn dengan jayanya.');
                popupMsg.Show();
                Grid_Space.PerformCallback();
            }
            else {
                popupSpace.Hide();
                popupMsg_Label.SetText('Rekod Ruang telah dipadam dengan jayanya.');
                popupMsg.Show();
                Grid_Space.PerformCallback();
            }
        }
    }

    function Space_ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupSpace.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupSpace.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupSpace.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupSpace.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>



<dx:ASPxGridView ID="Grid_Space" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_Space" DataSourceID="GridDs" KeyFieldName="Space_Id" Width="100%" OnCustomCallback="Grid_Space_CustomCallback" OnHtmlDataCellPrepared="Grid_Space_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Space_Id" VisibleIndex="0" ReadOnly="True" Visible="False">
             <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Space_Code" VisibleIndex="1" Caption="Kod" Width="10%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="Space_Code" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Space_Name" VisibleIndex="2" Caption="Nama" Width="90%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Space_Id], [Space_Code], [Space_Name] FROM [Space] ORDER BY [Space_Code]"></asp:SqlDataSource>


<dx:ASPxTextBox ID="Space_ScreenMode" ClientInstanceName="Space_ScreenMode" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxPopupControl ID="popupSpace" runat="server" ClientInstanceName="popupSpace" EnableClientSideAPI="True" Width="600px" HeaderText="Pengurusan Aras" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupSpace" runat="server" ClientInstanceName="Toolbar_popupSpace" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupSpace_ItemClick(s, e);
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
                <dx:ASPxCallbackPanel ID="cbp_popupSpace" runat="server" ClientInstanceName="cbp_popupSpace" OnCallback="cbp_popupSpace_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupSpace_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="Form_Space" runat="server" ClientInstanceName="Form_Space" Width="100%" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Nama" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                <dx:ASPxTextBox ID="Space_Name" ClientInstanceName="Space_Name" MaxLength="200" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                <dx:ASPxTextBox ID="Space_Code" ClientInstanceName="Space_Code" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SMP" Width="33%" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                <dx:ASPxTextBox ID="Space_Id" ClientInstanceName="Space_Id" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
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





