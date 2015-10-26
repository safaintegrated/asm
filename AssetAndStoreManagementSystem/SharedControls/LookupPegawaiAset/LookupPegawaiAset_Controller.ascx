<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LookupPegawaiAset_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.SharedControls.LookupPegawaiAset.LookupPegawaiAset_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<script>
    function PegawaiAsetSelected()
    {
        GridLookupPegawaiAset.GetRowValues(GridLookupPegawaiAset.GetFocusedRowIndex(), 'EmployeeName;EmployeeId;EmployeeDesignation;EmployeeGrade;EmployeePTJ;EmployeeTelephone;EmployeeEmail;UserSystemId', ReturnValuesToParent);
    }

    function ReturnValuesToParent(Values)
    {
        var parent = window.parent;
        parent.RetrievePegawaiAsetValues(Values[0].toString(), Values[1].toString(), Values[2].toString(), Values[3].toString(), Values[4].toString(), Values[5].toString(), Values[6].toString(), Values[7].toString());
    }
</script>
<dx:ASPxGridView ID="GridLookupPegawaiAset" runat="server" AutoGenerateColumns="False" DataSourceID="LookupPegawaiAsetDs" Width="100%" ClientInstanceName="GridLookupPegawaiAset" OnCustomCallback="GridLookupPegawaiAset_CustomCallback" OnHtmlDataCellPrepared="GridLookupPegawaiAset_HtmlDataCellPrepared" KeyFieldName="UserSystemId">
    <Columns>
        <dx:GridViewDataTextColumn Caption="ID Pekerja" FieldName="EmployeeId" VisibleIndex="1" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="UserSystemId" ReadOnly="True" Visible="False" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama" FieldName="EmployeeName" VisibleIndex="0" Width="25%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="EmployeeName" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" VisibleIndex="2" Width="18%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="EmployeePTJ" ReadOnly="True" VisibleIndex="3" Width="25%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeEmail" Visible="False" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Mula Lantikan" FieldName="StartDate" ReadOnly="True" VisibleIndex="4" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Tamat Lantikan" FieldName="EndDate" ReadOnly="True" VisibleIndex="5" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Aktif" FieldName="ActiveStatus" ReadOnly="True" VisibleIndex="6" Width="8%">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EmployeeGrade" ReadOnly="True" Visible="False" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="EmployeeTelephone" ReadOnly="True" Visible="False" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior AllowFocusedRow="True" />
    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Styles>
        <AlternatingRow Enabled="True">
        </AlternatingRow>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="LookupPegawaiAsetDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [V_PegawaiAset] ORDER BY [EmployeeName]"></asp:SqlDataSource>

