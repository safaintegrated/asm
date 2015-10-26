<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Transfer.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Transfer" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

                <dx:ASPxGridView runat="server" AutoGenerateColumns="False" Width="100%" CssClass="AppFont" ID="ASPxGridView1"><Columns>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="20%" Caption="Rujukan" VisibleIndex="0">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="15%" Caption="Tarikh" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="65%" Caption="Lokasi Asal" VisibleIndex="2">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
</Columns>

<SettingsPager Mode="ShowAllRecords" Visible="False"></SettingsPager>

<SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False"></SettingsDataSecurity>

<Styles>
<AlternatingRow Enabled="True"></AlternatingRow>
</Styles>
</dx:ASPxGridView>


            

