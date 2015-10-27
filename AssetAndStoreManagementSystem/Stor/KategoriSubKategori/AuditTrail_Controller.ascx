<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditTrail_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.KategoriSubKategori.AuditTrail_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<script>
    function AuditTrailSelected(P)
    {
        txtProcessId.SetText(P.toString());
        GridHeader.PerformCallback();
        GridBefore.PerformCallback();
        GridAfter.PerformCallback();

    }
</script>

<table style="width:100%; vertical-align:top; text-align:left;">
    <tr>
        <td style="width:30%; vertical-align:top; text-align:left;">
            <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Senarai Audit" Width="100%">                     
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="MasterGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MasterGrid" DataSourceID="MasterDs" KeyFieldName="ProcessId" Width="100%" OnHtmlDataCellPrepared="MasterGrid_HtmlDataCellPrepared">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="ProcessId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kemaskini Oleh" FieldName="ModifiedBy" ShowInCustomizationForm="True" VisibleIndex="1" Width="50%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                    <DataItemTemplate>
                                                        <dx:ASPxHyperLink ID="ModifiedBy" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                                        </dx:ASPxHyperLink>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kategori" FieldName="CatName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="40%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn Caption="Kemaskini Pada" FieldName="ModifiedDate" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                                    </PropertiesDateEdit>
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataDateColumn>
                                            </Columns>
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Styles>
                                                <AlternatingRow Enabled="True">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="MasterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [ProcessId], [ModifiedBy], [CatName], [ModifiedDate] FROM [V_Category_MasterAudit] ORDER BY [ModifiedDate] DESC"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </td>
        <td style="width:70%; vertical-align:top; text-align:left;">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Maklumat Kategori" Width="100%" BackColor="Transparent">
                        <GroupBoxStyle BackColor="Transparent">
                        </GroupBoxStyle>
                        <CellStyle BackColor="Transparent">
                        </CellStyle>
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="GridHeader" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridHeader" DataSourceID="HeaderDs" OnCustomCallback="GridHeader_CustomCallback" EnableCallbackAnimation="True">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
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
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Styles>
                                                <AlternatingRow Enabled="True">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="HeaderDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SP_AuditTrail_CategoryHeader" SelectCommandType="StoredProcedure" OnSelecting="HeaderDs_Selecting">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProcessId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Maklumat Sub-Kategori (Sebelum)" Width="100%" BackColor="Transparent">
                        <GroupBoxStyle BackColor="Transparent">
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="GridBefore" runat="server" AutoGenerateColumns="False" DataSourceID="BeforeDs" Width="100%" ClientInstanceName="GridBefore" OnCustomCallback="GridBefore_CustomCallback" EnableCallbackAnimation="True">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="SubCatName" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kod" FieldName="SubCatCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Aset" FieldName="SubCatGLAsset" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Inventori" FieldName="SubCatGLInventori" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Penyelenggaraan" FieldName="SubCatGLMaintenance" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Alat Ganti" FieldName="SubCatGLSpareParts" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                                    
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Styles>
                                                <AlternatingRow Enabled="True">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="BeforeDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [SubCatName], [SubCatCode], [SubCatGLAsset], [SubCatGLInventori], [SubCatGLMaintenance], [SubCatGLSpareParts] FROM [SubCategory_BeforeImage] WHERE ([ProcessId] = @ProcessId) ORDER BY [SubCatName]" OnSelecting="BeforeDs_Selecting">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProcessId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Maklumat Sub-Kategori (Selepas)" BackColor="Transparent">
                        <GroupBoxStyle BackColor="Transparent">
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="GridAfter" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridAfter" DataSourceID="AfterDs" OnCustomCallback="GridAfter_CustomCallback" EnableCallbackAnimation="True">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Nama" FieldName="SubCatName" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kod" FieldName="SubCatCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Aset" FieldName="SubCatGLAsset" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Inventori" FieldName="SubCatGLInventori" ShowInCustomizationForm="True" VisibleIndex="3" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Penyelenggaraan" FieldName="SubCatGLMaintenance" ShowInCustomizationForm="True" VisibleIndex="4" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="GL Alat Ganti" FieldName="SubCatGLSpareParts" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                                    
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <Styles>
                                                <AlternatingRow Enabled="True">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="AfterDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AuditConnectionString %>" SelectCommand="SELECT [SubCatName], [SubCatCode], [SubCatGLAsset], [SubCatGLInventori], [SubCatGLMaintenance], [SubCatGLSpareParts] FROM [SubCategory_AfterImage] WHERE ([ProcessId] = @ProcessId) ORDER BY [SubCatName]" OnSelecting="AfterDs_Selecting">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProcessId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </td>
    </tr>
</table>

<dx:ASPxTextBox ID="txtProcessId" runat="server" ClientInstanceName="txtProcessId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>


