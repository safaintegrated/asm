<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Maintenance.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Maintenance" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

                        <dx:ASPxGridView runat="server" AutoGenerateColumns="False" Width="100%" ID="ASPxGridView1"><Columns>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Tarikh Penyelenggaraan Terakhir" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="70%" Caption="Pegawai Penyelenggara Terakhir" VisibleIndex="1">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Kekerapan Penyelenggaraan" VisibleIndex="2">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Tarikh Penyelenggaraan Seterusnya" VisibleIndex="3">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
</Columns>

<SettingsPager Visible="False"></SettingsPager>

<SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False"></SettingsDataSecurity>

<Styles>
<AlternatingRow Enabled="True"></AlternatingRow>
</Styles>
</dx:ASPxGridView>


                    

