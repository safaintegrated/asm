<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PTJ_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.PTJ_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function PTJ_ViewRecord(Idx)
    {
        PTJ_SagaCode.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod PTJ yang telah dipiih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPTJ.PerformCallback('LOAD');
    }

    function PTJ_OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupPTJ.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupPTJ.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupPTJ.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupPTJ.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupPTJ.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupPTJ.GetItemByName("btnDelete").SetVisible(false);

    }

    function AddMode_PTJTab()
    {
        PTJ_ScreenMode.SetText('2');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod PTJ baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPTJ.PerformCallback('NEW');
    }

    function Toolbar_popupPTJ_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': PTJ_EditMode(); break;
            case 'btnSave': PTJ_SaveMode(); break;
            case 'btnDelete': PTJ_DeleteMode(); break;
            case 'btnCancel': PTJ_CancelMode(); break;
        }
    }

    function PTJ_EditMode() {
        PTJ_ManagePopupToolbar(false, true, true, true);
        Form_PTJ.SetEnabled(true);
    }

    function PTJ_SaveMode() {
        if (PTJ_SagaCode.GetText() == '' || PTJ_SmpCode.GetText() == '' || PTJ_FullName.GetText() == '') {
            popupMsg_Label.SetText('Kod SAGA, Kod SMP dan Nama perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat PTJ.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupPTJ.PerformCallback('SAVE');
        }
    }

    function PTJ_DeleteMode()
    {
        LoadingPanel.SetText('Sistem sedang memadam rekod PTJ yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupPTJ.PerformCallback('DELETE');

    }

    function PTJ_CancelMode()
    {
        popupPTJ.Hide();
    }

    function cbp_popupPTJ_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'NEW')
            {  
                Form_PTJ.SetEnabled(true);
                PTJ_ManagePopupToolbar(false, true, false, true);
                popupPTJ.Show();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                Form_PTJ.SetEnabled(false);
                PTJ_ManagePopupToolbar(true, false, false, false);
                popupPTJ.Show();
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                popupPTJ.Hide();
                popupMsg_Label.SetText('Rekod  PTJ telah disimpn dengan jayanya.');
                popupMsg.Show();
                Grid_PTJ.PerformCallback();
            }
            else
            {
                popupPTJ.Hide();
                popupMsg_Label.SetText('Rekod  PTJ telah dipadam dengan jayanya.');
                popupMsg.Show();
                Grid_PTJ.PerformCallback();
            }
        }
    }

    function PTJ_ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupPTJ.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupPTJ.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupPTJ.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupPTJ.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>



<dx:ASPxGridView ID="Grid_PTJ" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_PTJ" DataSourceID="GridDs" KeyFieldName="PTJ_SmpCode" Width="100%" OnCustomCallback="Grid_PTJ_CustomCallback" OnHtmlDataCellPrepared="Grid_PTJ_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn Caption="Kod SAGA" FieldName="PTJ_SagaCode" VisibleIndex="0">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="PTJ_SagaCode" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Kod SMP" FieldName="PTJ_SmpCode" ReadOnly="True" VisibleIndex="1">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Singkatan" FieldName="PTJ_ShortName" VisibleIndex="2">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <Settings AutoFilterCondition="Contains" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama PTJ" FieldName="PTJ_FullName" VisibleIndex="3">
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
<asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_SagaCode], [PTJ_SmpCode], [PTJ_ShortName], [PTJ_FullName] FROM [PusatTanggungJawab] ORDER BY [PTJ_SagaCode]"></asp:SqlDataSource>


<dx:ASPxTextBox ID="PTJ_ScreenMode" ClientInstanceName="PTJ_ScreenMode" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxPopupControl ID="popupPTJ" runat="server" ClientInstanceName="popupPTJ" EnableClientSideAPI="True" Width="600px" HeaderText="Pengurusan Rekod PTJ" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupPTJ" runat="server" ClientInstanceName="Toolbar_popupPTJ" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupPTJ_ItemClick(s, e);
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
                <dx:ASPxCallbackPanel ID="cbp_popupPTJ" runat="server" ClientInstanceName="cbp_popupPTJ" OnCallback="cbp_popupPTJ_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupPTJ_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="Form_PTJ" runat="server" ClientInstanceName="Form_PTJ" Width="100%" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Nama" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PTJ_FullName" ClientInstanceName="PTJ_FullName" MaxLength="200" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SAGA" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PTJ_SagaCode" ClientInstanceName="PTJ_SagaCode" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SMP" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PTJ_SmpCode" ClientInstanceName="PTJ_SmpCode" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Singkatan" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PTJ_ShortName" ClientInstanceName="PTJ_ShortName" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
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




