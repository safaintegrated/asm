<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Penempatan.Lookup.Lookup_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function PenempatanSelected(P)
    {
        var parent = window.parent;
        parent.LoadSelectedPenempatan(P.toString());
    }

</script>

<dx:ASPxGridView ID="GridSearchPenempatan" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearchPenempatan" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="PH_ProcessId" Width="100%" OnHtmlDataCellPrepared="GridSearchPenempatan_HtmlDataCellPrepared">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="PH_ProcessId" ReadOnly="True" Visible="False" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_CreatedBy" Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Tarikh" FieldName="PH_CreatedDate" VisibleIndex="2" Width="7%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="No. Rujukan" FieldName="PH_RefNumber" VisibleIndex="3" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_PtjId" Visible="False" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_DeptId" Visible="False" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_BuildId" Visible="False" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_FloorId" Visible="False" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_SpaceID" Visible="False" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_EmpId" Visible="False" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PH_Status" Visible="False" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status" FieldName="PH_StatusText" ReadOnly="True" VisibleIndex="11" Width="7%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="PH_StatusText" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeName" ReadOnly="True" Visible="False" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ReadOnly="True" VisibleIndex="13" Width="14%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeEmail" ReadOnly="True" Visible="False" VisibleIndex="14">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ReadOnly="True" Visible="False" VisibleIndex="15">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="CreatorPtjId" ReadOnly="True" Visible="False" VisibleIndex="16">
        </dx:GridViewDataTextColumn>
        <dx:GridViewBandColumn Caption="Lokasi Baharu" VisibleIndex="23">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="Dest_PTJ_Name" ReadOnly="True" VisibleIndex="1" Width="14%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="Dest_EmployeeName" ReadOnly="True" VisibleIndex="0" Width="14%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dest_Dept_Name" ReadOnly="True" VisibleIndex="2" Width="10%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Dest_Build_Name" ReadOnly="True" VisibleIndex="3" Width="10%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Aras" FieldName="Dest_Floor_Name" ReadOnly="True" VisibleIndex="4" Width="6%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Dest_Space_Name" ReadOnly="True" VisibleIndex="5" Width="10%">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                    
                </dx:GridViewDataTextColumn>
            </Columns>
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
        </dx:GridViewBandColumn>
    </Columns>
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" SelectCommand="SP_Penempatan_SearchRecord" SelectCommandType="StoredProcedure" OnSelecting="SearchDs_Selecting">
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="CurrUser" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

