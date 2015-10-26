<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Department_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.Department_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function PBJ_ViewRecord(Idx) {
        PBJ_SmpCode.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod Pusat, Bahagian dan Jabatan yang telah dipiih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPBJ.PerformCallback('LOAD');
    }

    function PBJ_OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupPBJ.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupPBJ.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupPBJ.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupPBJ.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupPBJ.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupPBJ.GetItemByName("btnDelete").SetVisible(false);

    }

    function AddMode_PBJTab() {
        PBJ_ScreenMode.SetText('2');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod PBJ baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPBJ.PerformCallback('NEW');
    }

    function Toolbar_popupPBJ_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': PBJ_EditMode(); break;
            case 'btnSave': PBJ_SaveMode(); break;
            case 'btnDelete': PBJ_DeleteMode(); break;
            case 'btnCancel': PBJ_CancelMode(); break;
        }
    }

    function PBJ_EditMode() {
        PBJ_ManagePopupToolbar(false, true, true, true);
        Form_PBJ.SetEnabled(true);
    }

    function PBJ_SaveMode() {
        if (PBJ_SmpCode.GetText() == '' || PBJ_Name.GetText() == '' || PBJ_ParentSagaCode.GetText() == '') {
            popupMsg_Label.SetText('PTJ, Kod SMP dan Nama perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat PBJ.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupPBJ.PerformCallback('SAVE');
        }
    }

    function PBJ_DeleteMode() {
        LoadingPanel.SetText('Sistem sedang memadam rekod PBJ yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPBJ.PerformCallback('DELETE');

    }

    function PBJ_CancelMode() {
        popupPBJ.Hide();
    }

    function cbp_popupPBJ_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                Form_PBJ.SetEnabled(true);
                PBJ_ManagePopupToolbar(false, true, false, true);
                popupPBJ.Show();
            }
            else if (s.cpMode.toString() == 'LOAD') {
                Form_PBJ.SetEnabled(false);
                PBJ_ManagePopupToolbar(true, false, false, false);
                popupPBJ.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupPBJ.Hide();
                popupMsg_Label.SetText('Rekod  PBJ telah disimpn dengan jayanya.');
                popupMsg.Show();
                Grid_PBJ.PerformCallback();
            }
            else {
                popupPBJ.Hide();
                popupMsg_Label.SetText('Rekod  PBJ telah dipadam dengan jayanya.');
                popupMsg.Show();
                Grid_PBJ.PerformCallback();
            }
        }
    }

    function PBJ_ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupPBJ.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupPBJ.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupPBJ.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupPBJ.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>



<dx:ASPxGridView ID="Grid_PBJ" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_PBJ" DataSourceID="GridDs" KeyFieldName="PBJ_SmpCode" Width="100%" OnCustomCallback="Grid_PBJ_CustomCallback" OnHtmlDataCellPrepared="Grid_PBJ_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ReadOnly="True" VisibleIndex="0">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Kod SMP" FieldName="PBJ_SmpCode" ReadOnly="True" VisibleIndex="1">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="PBJ_SmpCode" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Ringkasan" FieldName="PBJ_ShortName" VisibleIndex="2">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama" FieldName="PBJ_Name" VisibleIndex="3">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
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
<asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_FullName], [PBJ_SmpCode], [PBJ_ShortName], [PBJ_Name] FROM [V_PusatBahagianJabatan] ORDER BY [PBJ_SmpCode]"></asp:SqlDataSource>


<dx:ASPxTextBox ID="PBJ_ScreenMode" ClientInstanceName="PBJ_ScreenMode" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxPopupControl ID="popupPBJ" runat="server" ClientInstanceName="popupPBJ" EnableClientSideAPI="True" Width="600px" HeaderText="Pengurusan Rekod PBJ" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupPBJ" runat="server" ClientInstanceName="Toolbar_popupPBJ" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupPBJ_ItemClick(s, e);
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
                <dx:ASPxCallbackPanel ID="cbp_popupPBJ" runat="server" ClientInstanceName="cbp_popupPBJ" OnCallback="cbp_popupPBJ_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupPBJ_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="Form_PBJ" runat="server" ClientInstanceName="Form_PBJ" Width="100%" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                <dx:ASPxComboBox ID="PBJ_ParentSagaCode" runat="server" ClientInstanceName="PBJ_ParentSagaCode" DataSourceID="SqlDataSource1" EnableClientSideAPI="True" TextField="PTJ_FullName" ValueField="PTJ_SagaCode" Width="100%">
                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_SagaCode], [PTJ_FullName] FROM [PusatTanggungJawab] ORDER BY [PTJ_FullName]"></asp:SqlDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nama" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                <dx:ASPxTextBox ID="PBJ_Name" runat="server" ClientInstanceName="PBJ_Name" EnableClientSideAPI="True" MaxLength="200" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SMP" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PBJ_SmpCode" runat="server" ClientInstanceName="PBJ_SmpCode" EnableClientSideAPI="True" MaxLength="50" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Singkatan" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                <dx:ASPxTextBox ID="PBJ_ShortName" runat="server" ClientInstanceName="PBJ_ShortName" EnableClientSideAPI="True" MaxLength="50" Width="100%">
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





