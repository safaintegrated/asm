<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditTrail_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Lokasi.AuditTrail_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function GridAuditListing_EndCallback(s, e)
    {
        PopupAuditTrail.SetWidth(screen.width * 0.85);

        if (AuditTrailType.GetText() == '0')
            PopupAuditTrail.SetHeaderText('Senarai Audit Lokasi - Pusat Tanggungjawab');
        else if (AuditTrailType.GetText() == '1')
            PopupAuditTrail.SetHeaderText('Senarai Audit Lokasi - Pusat, Bahagian dan Jabatan');
        else if (AuditTrailType.GetText() == '2')
            PopupAuditTrail.SetHeaderText('Senarai Audit Lokasi - Bangunan dan Blok');
        else if (AuditTrailType.GetText() == '3')
            PopupAuditTrail.SetHeaderText('Senarai Audit Lokasi - Aras');
        else
            PopupAuditTrail.SetHeaderText('Senarai Audit Lokasi - Ruang');

        PopupAuditTrail.Show();
    }

    function AuditDetailSelected(ProcessId)
    {
        AuditTrailProcessId.SetText(ProcessId.toString());
        GridAuditDetails.PerformCallback();
    }
</script>
<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="900px" HeaderText="Senarai Audit" AllowDragging="True" Height="480px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <ClientSideEvents Closing="function(s, e) {
	AuditTrailType.SetText('');
AuditTrailProcessId.SetText('');
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="FormAuditTrail" runat="server" ClientInstanceName="FormAuditTrail" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Audit" Width="40%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="GridAuditListing" runat="server" ClientInstanceName="GridAuditListing" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditMasterDs" KeyFieldName="ProcessId" OnCustomCallback="GridAuditListing_CustomCallback" OnHtmlDataCellPrepared="GridAuditListing_HtmlDataCellPrepared">
                                    <ClientSideEvents EndCallback="function(s, e) {
	GridAuditListing_EndCallback(s, e);
}" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="ModifiedBy" runat="server" EnableClientSideAPI="True" Text="ASPxHyperLink" />
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="ModifiedDate" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="AuditMasterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_Location_AuditMaster" OnSelecting="AuditMasterDs_Selecting" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Type" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Data Audit" Width="60%">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxGridView ID="GridAuditDetails" runat="server" ClientInstanceName="GridAuditDetails" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditTrailDetailDs" EnableCallbackAnimation="True" OnCustomCallback="GridAuditDetails_CustomCallback">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Medan" FieldName="ColumnName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="20%">
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="40%">
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="40%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <SettingsLoadingPanel Mode="Disabled" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                    <Styles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="AuditTrailDetailDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_Location_AuditDetails" SelectCommandType="StoredProcedure" OnSelecting="AuditTrailDetailDs_Selecting">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
                                        <asp:Parameter DefaultValue="c" Name="ProcessId" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxTextBox ID="AuditTrailType" runat="server" ClientInstanceName="AuditTrailType" EnableClientSideAPI="True" Width="170px" ClientVisible="false">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="AuditTrailProcessId" runat="server" ClientInstanceName="AuditTrailProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="false">
</dx:ASPxTextBox>
