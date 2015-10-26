<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_PegawaiAset.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.AduanKerosakan.Tab_PegawaiAset" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function cbp_PegawaiAsetPosting_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
        }
        else
        {
            ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            popupMsg_Label.SetText('Aliran kerja untuk proses ini telah dikemaskini.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
            EnableDisablePegawaiAsetForm('false');
            var AliranKerjaTab = PageControl.GetTab(2);
            AliranKerjaTab.SetVisible(true);
            GridAkWorkflow.PerformCallback();
        }
    }

    function EnableDisablePegawaiAsetForm(truefalse)
    {
        if (truefalse == 'true') {
            TabPA_PegawaiAssetComments.SetEnabled(true);
            TabPA_PegawaiAssetConfirmation.SetEnabled(true);
            TabPA_PegawaiAssetRecommendation.SetEnabled(true);
        }
        else
        {
            TabPA_PegawaiAssetComments.SetEnabled(false);
            TabPA_PegawaiAssetConfirmation.SetEnabled(false);
            TabPA_PegawaiAssetRecommendation.SetEnabled(false);
        }
    }


    function cbp_PA_EndCallback(s, e)
    {
        if (TabPA_EditMode.GetText() == '0')
            EnableDisablePegawaiAsetForm('false');
        else
            EnableDisablePegawaiAsetForm('true');
    }
</script>
<dx:ASPxCallbackPanel ID="cbp_PA" runat="server" ClientInstanceName="cbp_PA" EnableCallbackAnimation="True" EnableClientSideAPI="True" OnCallback="cbp_PA_Callback" Width="100%">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_PA_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Pengesahan Pegawai Aset" ColCount="4" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="TabPA_PegawaiAssetName" runat="server" ClientEnabled="False" ClientInstanceName="TabPA_PegawaiAssetName" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pengesahan" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="TabPA_PegawaiAssetConfirmation" runat="server" ClientInstanceName="TabPA_PegawaiAssetConfirmation" DataSourceID="PengesahanDs" EnableClientSideAPI="True" TextField="AK_PengesahanDesc" ValueField="AK_PengesahanId" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="PengesahanDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [AK_PengesahanId], [AK_PengesahanDesc] FROM [AduanKerosakan_PengesahanPegawaiAset] ORDER BY [AK_PengesahanDesc]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Syor" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="TabPA_PegawaiAssetRecommendation" runat="server" ClientInstanceName="TabPA_PegawaiAssetRecommendation" DataSourceID="SyorDs" EnableClientSideAPI="True" TextField="AK_SyorDesc" ValueField="AK_SyorID" ValueType="System.Int32" Width="100%">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SyorDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [AK_SyorID], [AK_SyorDesc] FROM [AduanKerosakan_SyorPegawaiAset] ORDER BY [AK_SyorDesc]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Width="20%">
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Komen &amp; Catatan" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="TabPA_PegawaiAssetComments" runat="server" ClientInstanceName="TabPA_PegawaiAssetComments" EnableClientSideAPI="True" Rows="3" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Width="15%">
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem Width="15%">
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem Width="20%">
                    </dx:EmptyLayoutItem>
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
<dx:ASPxTextBox ID="TabPA_ProcessId" runat="server" ClientInstanceName="TabPA_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


<dx:ASPxTextBox ID="TabPA_EditMode" runat="server" ClientInstanceName="TabPA_EditMode" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


<dx:ASPxCallbackPanel ID="cbp_PegawaiAsetPosting" runat="server" ClientInstanceName="cbp_PegawaiAsetPosting" ClientVisible="False" OnCallback="cbp_PegawaiAsetPosting_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_PegawaiAsetPosting_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



