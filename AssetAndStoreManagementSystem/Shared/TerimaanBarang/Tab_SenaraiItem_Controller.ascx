<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_SenaraiItem_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Shared.TerimaanBarang.Tab_SenaraiItem_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function CalculateRowBalance(i)
    {
        var PRI_Qty = ASPxClientControl.GetControlCollection().GetByName('PRI_Qty' + i.toString());
        var GRND_ReceivedPreviously = ASPxClientControl.GetControlCollection().GetByName('GRND_ReceivedPreviously' + i.toString());
        var GRND_ReceivedToDate = ASPxClientControl.GetControlCollection().GetByName('GRND_ReceivedToDate' + i.toString());
        var GRND_Rejected = ASPxClientControl.GetControlCollection().GetByName('GRND_Rejected' + i.toString());
        var Balance = ASPxClientControl.GetControlCollection().GetByName('Balance' + i.toString());
        
        Balance.SetNumber(PRI_Qty.GetNumber() - GRND_ReceivedPreviously.GetNumber() - GRND_ReceivedToDate.GetNumber() - GRND_Rejected.GetNumber());
    }

    function GridGrnDetailsEnableDisable(Enable)
    {
        var GRND_RowId
        var GRND_UnitPrice
        var GRND_Maintenance
        var GRND_DamagedNotes
        var GRND_OtherNotes
        var GRND_ReceivedToDate
        var GRND_Rejected

        for (var i = 0; i < GridGrnDetails.GetVisibleRowsOnPage() ; i++) {
            GRND_RowId = ASPxClientControl.GetControlCollection().GetByName('GRND_RowId' + i.toString());
            GRND_UnitPrice = ASPxClientControl.GetControlCollection().GetByName('GRND_UnitPrice' + i.toString());
            GRND_Maintenance = ASPxClientControl.GetControlCollection().GetByName('GRND_Maintenance' + i.toString());
            GRND_DamagedNotes = ASPxClientControl.GetControlCollection().GetByName('GRND_DamagedNotes' + i.toString());
            GRND_OtherNotes = ASPxClientControl.GetControlCollection().GetByName('GRND_OtherNotes' + i.toString());
            GRND_ReceivedToDate = ASPxClientControl.GetControlCollection().GetByName('GRND_ReceivedToDate' + i.toString());
            GRND_Rejected = ASPxClientControl.GetControlCollection().GetByName('GRND_Rejected' + i.toString());

            if (Enable == 'true') {
                GRND_RowId.SetEnabled(true);
                GRND_UnitPrice.SetEnabled(true);
                GRND_Maintenance.SetEnabled(true);
                GRND_DamagedNotes.SetEnabled(true);
                GRND_OtherNotes.SetEnabled(true);
                GRND_ReceivedToDate.SetEnabled(true);
                GRND_Rejected.SetEnabled(true);
            }
            else {
                GRND_RowId.SetEnabled(false);
                GRND_UnitPrice.SetEnabled(false);
                GRND_Maintenance.SetEnabled(false);
                GRND_DamagedNotes.SetEnabled(false);
                GRND_OtherNotes.SetEnabled(false);
                GRND_ReceivedToDate.SetEnabled(false);
                GRND_Rejected.SetEnabled(false);
            }
        }
    }

    function GridGrnDetails_EndCallback(s, e)
    {
        if (Senarai_Status.GetText() == "2")
            GridGrnDetailsEnableDisable('true');
        else
            GridGrnDetailsEnableDisable('false');
    }

</script>

            <dx:ASPxGridView ID="GridGrnDetails" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="GridGrnDetails" DataSourceID="GrnItemsDs" OnCustomCallback="GridGrnDetails_CustomCallback" OnHtmlDataCellPrepared="GridGrnDetails_HtmlDataCellPrepared" KeyFieldName="GRNH_RowId">
                <ClientSideEvents EndCallback="function(s, e) {
	GridGrnDetails_EndCallback(s, e);
}" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="GRNH_ProcessId" ReadOnly="True" VisibleIndex="0" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRNH_Revision" ReadOnly="True" VisibleIndex="1" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRNH_PrNumber" ReadOnly="True" VisibleIndex="2" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_RowId" ReadOnly="True" VisibleIndex="3" Caption="Terima" Width="4%">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxCheckBox ID="GRND_RowId" EnableClientSideAPI="true"  runat="server"></dx:ASPxCheckBox>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PRI_Desc" ReadOnly="True" VisibleIndex="4" Caption="Keterangan" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_Type" ReadOnly="True" VisibleIndex="5" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_UnitPrice" VisibleIndex="6" Caption="Kos Seunit (RM)" Width="8%">
                         <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxSpinEdit ID="GRND_UnitPrice" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%">
                            </dx:ASPxSpinEdit>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="GRND_Maintenance" VisibleIndex="12" Caption="Selenggara" Width="5%">
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxCheckBox ID="GRND_Maintenance" EnableClientSideAPI="true" runat="server"></dx:ASPxCheckBox>
                        </DataItemTemplate>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_DamagedNotes" VisibleIndex="13" Caption="Perihal Kerosakan" Width="15%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxMemo ID="GRND_DamagedNotes" EnableClientSideAPI="true" runat="server" Rows="3" Width="100%">
                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                            </dx:ASPxMemo>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_OtherNotes" VisibleIndex="14" Caption="Nota" Width="15%">
                           <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                        <DataItemTemplate>
                            <dx:ASPxMemo ID="GRND_OtherNotes" EnableClientSideAPI="true" runat="server" Rows="3" Width="100%">
                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                            </dx:ASPxMemo>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Kuantiti" VisibleIndex="11">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Dipesan" FieldName="PRI_Qty" ReadOnly="True" VisibleIndex="0" Width="8%">
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                <DataItemTemplate>
                                    <dx:ASPxSpinEdit ID="PRI_Qty" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n0" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%" ClientEnabled="false">
                                    </dx:ASPxSpinEdit>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Telah Diterima" FieldName="GRND_ReceivedPreviously" ReadOnly="True" VisibleIndex="1" Width="8%">
                                 <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                 <DataItemTemplate>
                                    <dx:ASPxSpinEdit ID="GRND_ReceivedPreviously" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n0" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%" ClientEnabled="false">
                                    </dx:ASPxSpinEdit>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Terimaan" FieldName="GRND_ReceivedToDate" ReadOnly="True" VisibleIndex="2" Width="8%">
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                <DataItemTemplate>
                                    <dx:ASPxSpinEdit ID="GRND_ReceivedToDate" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n0" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%">
                                    </dx:ASPxSpinEdit>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ditolak" FieldName="GRND_Rejected" ReadOnly="True" VisibleIndex="3" Width="8%">
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                 <DataItemTemplate>
                                    <dx:ASPxSpinEdit ID="GRND_Rejected" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n0" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%">
                                    </dx:ASPxSpinEdit>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Baki" FieldName="Balance" ReadOnly="True" VisibleIndex="4" Width="8%">
                                 <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                 <DataItemTemplate>
                                    <dx:ASPxSpinEdit ID="Balance" EnableClientSideAPI="true" runat="server" Number="0" DisplayFormatString="n0" HorizontalAlign="Right" SpinButtons-ShowIncrementButtons="false" Width="100%" ClientEnabled="false">
                                    </dx:ASPxSpinEdit>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn FieldName="GRND_ItemNumber" Visible="False" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Styles>
                    <AlternatingRow Enabled="True">
                    </AlternatingRow>
                </Styles>
            </dx:ASPxGridView>
        

<asp:SqlDataSource ID="GrnItemsDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="GrnItemsDs_Selecting" SelectCommand="SP_GRN_LoadItem" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="ProcessId" Type="String" />
        <asp:Parameter Name="Revision" Type="Int32" />
        <asp:Parameter Name="PrNumber" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<dx:ASPxTextBox ID="Senarai_ProcessId" ClientInstanceName="Senarai_ProcessId" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="Senarai_Revision" ClientInstanceName="Senarai_Revision" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="Senarai_PrNumber" ClientInstanceName="Senarai_PrNumber" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="Senarai_Status" ClientInstanceName="Senarai_Status" EnableClientSideAPI="true" runat="server" Width="170px" ClientVisible="False">
</dx:ASPxTextBox>