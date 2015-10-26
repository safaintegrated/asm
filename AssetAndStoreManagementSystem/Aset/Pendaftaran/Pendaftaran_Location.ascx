<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Location.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Location" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

            <dx:ASPxGridView ID="GridAssetInvPenempatan" runat="server" ClientInstanceName="GridAssetInvPenempatan" EnableCallbackAnimation="True" OnCustomCallback="GridAssetInvPenempatan_CustomCallback" Width="100%" AutoGenerateColumns="False" DataSourceID="PenempatanDs" OnAfterPerformCallback="GridAssetInvPenempatan_AfterPerformCallback">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="PD_AssetInvUniqueId" Visible="False" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="RegNumber" GroupIndex="0" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="Dest_EmployeeName" ReadOnly="True" VisibleIndex="2" Width="20%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="Dest_PTJ_Name" ReadOnly="True" VisibleIndex="3" Width="20%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat, Bahagian &amp; Jabatan" FieldName="Dest_Dept_Name" ReadOnly="True" VisibleIndex="4" Width="17%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Dest_Build_Name" ReadOnly="True" VisibleIndex="5" Width="15%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Aras" FieldName="Dest_Floor_Name" ReadOnly="True" VisibleIndex="6" Width="8%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Dest_Space_Name" ReadOnly="True" VisibleIndex="7" Width="12%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="PH_CreatedDate" VisibleIndex="8" Width="8%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy HH:mm">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm"></PropertiesDateEdit>

                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                        
                    </dx:GridViewDataDateColumn>
                </Columns>
                <SettingsBehavior AutoExpandAllGroups="True" />
                <SettingsPager PageSize="15">
                </SettingsPager>
                <Settings GroupFormat="{1} {2}" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Styles>
                    <AlternatingRow Enabled="True">
                    </AlternatingRow>
                </Styles>
</dx:ASPxGridView>

<asp:SqlDataSource ID="PenempatanDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" OnSelecting="PenempatanDs_Selecting" SelectCommand="SP_ListAllPenempatans" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="642FA9FE-C287-48C6-818A-ADA1313D8066" Name="ParentId" Type="String" />
        <asp:Parameter DefaultValue="2" Name="ParentType" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<dx:ASPxTextBox ID="PenempatanParentUniqueId" runat="server" ClientInstanceName="PenempatanParentUniqueId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="PenempatanParentType" runat="server" ClientInstanceName="PenempatanParentType" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>


    

                    
        

