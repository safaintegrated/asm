﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Lookup_KodBidang_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.SharedControls.Lookup_KodBidang.Lookup_KodBidang_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<script>
    function cbp_SelectedKodBiang_EndCallback(s, e) {
        if (s.cpErrMsg.toString() == '')
        { cbp_VendorKodBidang.PerformCallback("LOADKODBIDANG"); }
        else
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }
</script>

<dx:ASPxPopupControl ID="Popup_LookupKodBidang" runat="server" AllowDragging="True" ClientInstanceName="Popup_LookupKodBidang" EnableClientSideAPI="True" HeaderText="Carian Kod Bidang" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="1000px">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterTemplate>
        <div style="width:100%; vertical-align:top; text-align:center; padding-top:8px; padding-bottom:8px;">
            <dx:ASPxButton ID="SelectButton" ClientInstanceName="SelectButton" AutoPostBack="False" runat="server" Text="Ok" Theme="SoftOrange" EnableClientSideAPI="True" Width="100px">
                <ClientSideEvents Click="function(s, e) {
	cbp_SelectedKodBiang.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>
    </FooterTemplate>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridLookupKodBidang" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridLookupKodBidang" DataSourceID="KodBidangDs" KeyFieldName="ItemCode" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Cat" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Kategori" Width="30%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SubCat" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Sub-Kategori" Width="30%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="Item" ShowInCustomizationForm="True" VisibleIndex="3" Width="25%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kod" FieldName="ItemCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Pilih" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="5%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AutoExpandAllGroups="True" />
        <Settings GroupFormat="{1} {2}" ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="KodBidangDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [MasterKodBidang] ORDER BY [Cat], [SubCat], [Item]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxCallbackPanel ID="cbp_SelectedKodBiang" runat="server" ClientInstanceName="cbp_SelectedKodBiang" ClientVisible="False" OnCallback="cbp_SelectedKodBiang_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SelectedKodBiang_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>


