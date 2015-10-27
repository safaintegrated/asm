<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_AliranKerja.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.Tab_AliranKerja" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="96%">
    <Columns>
        <dx:GridViewDataTextColumn Caption="Tarikh Pungutan" VisibleIndex="0" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Aliran Kerja" VisibleIndex="1" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status " VisibleIndex="2" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nota / Catatan" VisibleIndex="5" Width="65%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Sebab-sebab ditolak" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Kuantiti diluluskan" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsPager Visible="False">
    </SettingsPager>
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
</dx:ASPxGridView>