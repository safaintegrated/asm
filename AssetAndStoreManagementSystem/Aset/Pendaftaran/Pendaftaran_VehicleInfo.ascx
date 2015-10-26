<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_VehicleInfo.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_VehicleInfo" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<dx:ASPxCallbackPanel ID="cbp_VehicleInfo" runat="server" ClientInstanceName="cbp_VehicleInfo" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <PanelCollection>
<dx:PanelContent runat="server">
     <dx:ASPxFormLayout runat="server" Width="100%" ID="ASPxFormLayout2"><Items>
<dx:LayoutGroup Caption="Maklumat Kenderaan" GroupBoxDecoration="HeadingLine"><Items>
<dx:LayoutItem ShowCaption="False"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                            <dx:ASPxFormLayout runat="server" ColCount="3" Width="50%" CssClass="AppFont" ID="ASPxFormLayout1"><Items>
<dx:LayoutItem Caption="No. Pendaftaran" Width="33%"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                                <dx:ASPxTextBox runat="server" Width="170px" ID="ASPxFormLayout1_E3"></dx:ASPxTextBox>


                                                            </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
<dx:LayoutItem Caption="No. Enjin" Width="33%"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                                <dx:ASPxTextBox runat="server" ID="ASPxFormLayout1_E2"></dx:ASPxTextBox>


                                                            </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
<dx:LayoutItem Caption="No. Chasis" Width="34%"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                                                <dx:ASPxTextBox runat="server" ID="ASPxFormLayout1_E1"></dx:ASPxTextBox>


                                                            </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>

<SettingsItems VerticalAlign="Top" HorizontalAlign="Left"></SettingsItems>

<SettingsItemCaptions Location="Top" HorizontalAlign="Left" VerticalAlign="Top"></SettingsItemCaptions>
</dx:ASPxFormLayout>


                                        </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>
</dx:LayoutGroup>
<dx:LayoutGroup Caption="Senarai Polisi Insurans &amp; Cukai Jalan" GroupBoxDecoration="HeadingLine"><Items>
<dx:LayoutItem ShowCaption="False"><LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                            <dx:ASPxGridView runat="server" AutoGenerateColumns="False" Width="100%" ID="ASPxGridView2"><Columns>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="No Polisi Insuran" VisibleIndex="0">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Caption="Tarikh Mula Polisi" ToolTip="10%" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Tarikh Luput Polisi" VisibleIndex="2">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Tarikh Mula Cukai Jalan" VisibleIndex="3">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Tarikh Luput Cukai Jalan" VisibleIndex="4">
<PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="40%" Caption="Nama Syarikat Insuran" VisibleIndex="5">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="10%" Caption="Jumlah Lindungan (RM)" VisibleIndex="6">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True"></HeaderStyle>

<CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
</dx:GridViewDataTextColumn>
</Columns>

<SettingsPager Mode="ShowAllRecords" Visible="False"></SettingsPager>

<SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False"></SettingsDataSecurity>

<Styles>
<AlternatingRow Enabled="True"></AlternatingRow>
</Styles>
</dx:ASPxGridView>


                                        </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
</Items>
</dx:LayoutGroup>
</Items>
</dx:ASPxFormLayout>

        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>