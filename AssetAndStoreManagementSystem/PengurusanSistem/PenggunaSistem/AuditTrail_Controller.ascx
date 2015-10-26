<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditTrail_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.PenggunaSistem.AuditTrail_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>





<dx:ASPxPopupControl ID="PopupAuditTrail" runat="server" ClientInstanceName="PopupAuditTrail" EnableClientSideAPI="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="1000px" HeaderText="Senarai Audit Pengguna Sistem" AllowDragging="True" Height="650px" ScrollBars="Auto" ShowPageScrollbarWhenModal="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Audit.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxFormLayout ID="FormAuditTrail" runat="server" ClientInstanceName="FormAuditTrail" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Senarai Audit" Width="40%" RowSpan="2">
                <Items>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                <dx:ASPxGridView ID="GridAuditListing" runat="server" ClientInstanceName="GridAuditListing" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditMasterDs" KeyFieldName="ProcessId" OnCustomCallback="GridAuditListing_CustomCallback" OnHtmlDataCellPrepared="GridAuditListing_HtmlDataCellPrepared">
                                    <ClientSideEvents EndCallback="function(s, e) {
	PopupAuditTrail.Show();
}" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="80%">
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="ModifiedBy" runat="server" EnableClientSideAPI="True" Text="ASPxHyperLink" />
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="ModifiedDate" ShowInCustomizationForm="True" VisibleIndex="2" Width="20%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
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
                                <asp:SqlDataSource ID="AuditMasterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [ProcessId], [ModifiedBy], [ModifiedDate] FROM [SystemUser_AuditMaster] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Data Audit" Width="60%">
                <Items>
                    <dx:LayoutItem Caption="Maklumat Pengguna Sistem">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                <dx:ASPxGridView ID="GridAuditHeaderDetails" runat="server" ClientInstanceName="GridAuditHeaderDetails" Width="100%" AutoGenerateColumns="False" DataSourceID="AuditHeaderDs" EnableCallbackAnimation="True" OnCustomCallback="GridAuditHeaderDetails_CustomCallback">
                                    <ClientSideEvents EndCallback="function(s, e) {
	GridAuditDetails.PerformCallback();
}" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="RowControl" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Medan" FieldName="ColumnName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="30%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="35%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="35%">
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
                                <asp:SqlDataSource ID="AuditHeaderDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_SystemUser_Information" SelectCommandType="StoredProcedure" OnSelecting="AuditHeaderDs_Selecting">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="XX" Name="ProcessId" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Peranan Pengguna Sistem">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                <dx:ASPxGridView ID="GridAuditDetails" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridAuditDetails" EnableCallbackAnimation="True" OnCustomCallback="GridAuditDetails_CustomCallback" Width="100%" DataSourceID="AuditDetailDs">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Peranan" FieldName="RoleName" ShowInCustomizationForm="True" VisibleIndex="0" Width="70%">
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Sebelum" FieldName="Before" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataCheckColumn Caption="Selepas" FieldName="After" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                        </dx:GridViewDataCheckColumn>
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
                                <asp:SqlDataSource ID="AuditDetailDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_SystemUser_Role" SelectCommandType="StoredProcedure" OnSelecting="AuditDetailDs_Selecting">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="xx" Name="ProcessId" Type="String" />
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