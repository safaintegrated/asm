<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Floor_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.Floor_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function Floor_ViewRecord(Idx) {
        Floor_Id.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod Aras yang telah dipiih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupFloor.PerformCallback('LOAD');
    }

    function Floor_OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupFloor.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupFloor.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupFloor.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupFloor.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupFloor.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupFloor.GetItemByName("btnDelete").SetVisible(false);

    }

    function AddMode_FloorTab() {
        Floor_ScreenMode.SetText('2');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Floor baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupFloor.PerformCallback('NEW');
    }

    function Toolbar_popupFloor_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': Floor_EditMode(); break;
            case 'btnSave': Floor_SaveMode(); break;
            case 'btnDelete': Floor_DeleteMode(); break;
            case 'btnCancel': Floor_CancelMode(); break;
        }
    }

    function Floor_EditMode() {
        Floor_ManagePopupToolbar(false, true, true, true);
        Form_Floor.SetEnabled(true);
    }

    function Floor_SaveMode() {
        if (Floor_Code.GetText() == '' || Floor_Name.GetText() == '') {
            popupMsg_Label.SetText('Kod dan Nama perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Aras.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupFloor.PerformCallback('SAVE');
        }
    }

    function Floor_DeleteMode() {
        LoadingPanel.SetText('Sistem sedang memadam rekod Aras yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupFloor.PerformCallback('DELETE');

    }

    function Floor_CancelMode() {
        popupFloor.Hide();
    }

    function cbp_popupFloor_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                Form_Floor.SetEnabled(true);
                Floor_ManagePopupToolbar(false, true, false, true);
                popupFloor.Show();
            }
            else if (s.cpMode.toString() == 'LOAD') {
                Form_Floor.SetEnabled(false);
                Floor_ManagePopupToolbar(true, false, false, false);
                popupFloor.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupFloor.Hide();
                popupMsg_Label.SetText('Rekod Aras telah disimpn dengan jayanya.');
                popupMsg.Show();
                Grid_Floor.PerformCallback();
            }
            else {
                popupFloor.Hide();
                popupMsg_Label.SetText('Rekod Aras telah dipadam dengan jayanya.');
                popupMsg.Show();
                Grid_Floor.PerformCallback();
            }
        }
    }

    function Floor_ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupFloor.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupFloor.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupFloor.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupFloor.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>



<dx:ASPxGridView ID="Grid_Floor" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_Floor" DataSourceID="GridDs" KeyFieldName="Floor_Id" Width="100%" OnCustomCallback="Grid_Floor_CustomCallback" OnHtmlDataCellPrepared="Grid_Floor_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Floor_Id" VisibleIndex="0" ReadOnly="True" Visible="False">
             <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Floor_Code" VisibleIndex="1" Caption="Kod" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="Floor_Code" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Floor_Name" VisibleIndex="2" Caption="Nama" Width="90%">
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
<asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Floor_Id], [Floor_Code], [Floor_Name] FROM [Floor] ORDER BY [Floor_Code]"></asp:SqlDataSource>


<dx:ASPxTextBox ID="Floor_ScreenMode" ClientInstanceName="Floor_ScreenMode" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxPopupControl ID="popupFloor" runat="server" ClientInstanceName="popupFloor" EnableClientSideAPI="True" Width="600px" HeaderText="Pengurusan Aras" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupFloor" runat="server" ClientInstanceName="Toolbar_popupFloor" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupFloor_ItemClick(s, e);
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
                <dx:ASPxCallbackPanel ID="cbp_popupFloor" runat="server" ClientInstanceName="cbp_popupFloor" OnCallback="cbp_popupFloor_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupFloor_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="Form_Floor" runat="server" ClientInstanceName="Form_Floor" Width="100%" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Nama" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                <dx:ASPxTextBox ID="Floor_Name" ClientInstanceName="Floor_Name" MaxLength="200" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                <dx:ASPxTextBox ID="Floor_Code" ClientInstanceName="Floor_Code" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SMP" Width="33%" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                <dx:ASPxTextBox ID="Floor_Id" ClientInstanceName="Floor_Id" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%" ClientVisible="False">
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





