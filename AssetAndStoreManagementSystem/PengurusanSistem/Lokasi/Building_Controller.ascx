<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Building_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.Building_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function Build_ViewRecord(Idx) {
        Build_Id.SetText(Idx.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod Bangunan yang telah dipiih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupBuild.PerformCallback('LOAD');
    }

    function Build_OnLoadManagePopupToolbar() {
        if (EnableUpdate.GetText() == 'True')
            Toolbar_popupBuild.GetItemByName("btnEdit").SetVisible(true);
        else
            Toolbar_popupBuild.GetItemByName("btnEdit").SetVisible(false);


        if (EnableCreate.GetText() == 'True')
            Toolbar_popupBuild.GetItemByName("btnSave").SetVisible(true);
        else
            Toolbar_popupBuild.GetItemByName("btnSave").SetVisible(false);


        if (EnableDelete.GetText() == 'True')
            Toolbar_popupBuild.GetItemByName("btnDelete").SetVisible(true);
        else
            Toolbar_popupBuild.GetItemByName("btnDelete").SetVisible(false);

    }

    function AddMode_BuildTab() {
        Build_ScreenMode.SetText('2');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima rekod Bangunan baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupBuild.PerformCallback('NEW');
    }

    function Toolbar_popupBuild_ItemClick(s, e) {
        switch (e.item.name) {
            case 'btnEdit': Build_EditMode(); break;
            case 'btnSave': Build_SaveMode(); break;
            case 'btnDelete': Build_DeleteMode(); break;
            case 'btnCancel': Build_CancelMode(); break;
        }
    }

    function Build_EditMode() {
        Build_ManagePopupToolbar(false, true, true, true);
        Form_Build.SetEnabled(true);
    }

    function Build_SaveMode() {
        if (Build_Code.GetText() == '' || Build_Name.GetText() == '') {
            popupMsg_Label.SetText('Kod dan Nama perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
        }
        else {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Bangunan.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_popupBuild.PerformCallback('SAVE');
        }
    }

    function Build_DeleteMode() {
        LoadingPanel.SetText('Sistem sedang memadam rekod Bangunan yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_popupBuild.PerformCallback('DELETE');

    }

    function Build_CancelMode() {
        popupBuild.Hide();
    }

    function cbp_popupBuild_EndCallback(s, e) {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else {
            if (s.cpMode.toString() == 'NEW') {
                Form_Build.SetEnabled(true);
                Build_ManagePopupToolbar(false, true, false, true);
                popupBuild.Show();
            }
            else if (s.cpMode.toString() == 'LOAD') {
                Form_Build.SetEnabled(false);
                Build_ManagePopupToolbar(true, false, false, false);
                popupBuild.Show();
            }
            else if (s.cpMode.toString() == 'SAVE') {
                popupBuild.Hide();
                popupMsg_Label.SetText('Rekod Bangunan telah disimpn dengan jayanya.');
                popupMsg.Show();
                Grid_Build.PerformCallback();
            }
            else {
                popupBuild.Hide();
                popupMsg_Label.SetText('Rekod Bangunan telah dipadam dengan jayanya.');
                popupMsg.Show();
                Grid_Build.PerformCallback();
            }
        }
    }

    function Build_ManagePopupToolbar(btnEdit, btnSave, btnDelete, btnCancel) {
        Toolbar_popupBuild.GetItemByName('btnEdit').SetEnabled(btnEdit);
        Toolbar_popupBuild.GetItemByName('btnSave').SetEnabled(btnSave);
        Toolbar_popupBuild.GetItemByName('btnDelete').SetEnabled(btnDelete);
        Toolbar_popupBuild.GetItemByName('btnCancel').SetEnabled(btnCancel);
    }
</script>



<dx:ASPxGridView ID="Grid_Build" runat="server" AutoGenerateColumns="False" ClientInstanceName="Grid_Build" DataSourceID="GridDs" KeyFieldName="Build_Id" Width="100%" OnCustomCallback="Grid_Build_CustomCallback" OnHtmlDataCellPrepared="Grid_Build_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Build_Id" VisibleIndex="0" ReadOnly="True" Visible="False">
             <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Build_Code" VisibleIndex="1" Caption="Kod" Width="10%">
             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"> </CellStyle>
            <Settings AutoFilterCondition="Contains" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="Build_Code" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Build_Name" VisibleIndex="2" Caption="Nama" Width="90%">
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
<asp:SqlDataSource ID="GridDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [Build_Id], [Build_Code], [Build_Name] FROM [Building] ORDER BY [Build_Code]"></asp:SqlDataSource>


<dx:ASPxTextBox ID="Build_ScreenMode" ClientInstanceName="Build_ScreenMode" EnableClientSideAPI="true" ClientVisible="false"  runat="server" Width="170px">
</dx:ASPxTextBox>



<dx:ASPxPopupControl ID="popupBuild" runat="server" ClientInstanceName="popupBuild" EnableClientSideAPI="True" Width="600px" HeaderText="Pengurusan Rekod Bangunan dan Blok" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td>
                <dx:ASPxMenu ID="Toolbar_popupBuild" runat="server" ClientInstanceName="Toolbar_popupBuild" EnableClientSideAPI="True" Width="100%">
                    <ClientSideEvents ItemClick="function(s, e) {
	Toolbar_popupBuild_ItemClick(s, e);
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
                <dx:ASPxCallbackPanel ID="cbp_popupBuild" runat="server" ClientInstanceName="cbp_popupBuild" OnCallback="cbp_popupBuild_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_popupBuild_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <dx:ASPxFormLayout ID="Form_Build" runat="server" ClientInstanceName="Form_Build" Width="100%" ColCount="3">
                                <Items>
                                    <dx:LayoutItem Caption="Nama" Width="100%" ColSpan="3">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                <dx:ASPxTextBox ID="Build_Name" ClientInstanceName="Build_Name" MaxLength="200" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                <dx:ASPxTextBox ID="Build_Code" ClientInstanceName="Build_Code" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Kod SMP" Width="33%" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                <dx:ASPxTextBox ID="Build_Id" ClientInstanceName="Build_Id" MaxLength="50" EnableClientSideAPI="true" runat="server" Width="100%" ClientVisible="False">
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





