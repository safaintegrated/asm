<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Permohonan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PermohonanStok.Tab_Permohonan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<style>
    .AddTopPadding 
    {
        padding-top:15px;
    }
</style>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="96%">
    <Items>
        <dx:LayoutGroup Caption="Maklumat Pemohon" Width="100%">
            <Items>
                <dx:LayoutItem Caption="Nama" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" CssClass="TextBoxForName">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="No. Kakitangan" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" CssClass="TextBoxForStaffId">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" CssClass="TextBoxPusatTanggungjawab">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Maklumat Permohonan" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem Caption="Tujuan" Width="60%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo ID="ASPxFormLayout1_E4" runat="server" Rows="3" Width="100%">
                                <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                            </dx:ASPxMemo>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Tarikh Diperlukan" Width="40%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E3" runat="server" CssClass="DateEditorInForm">
                            </dx:ASPxDateEdit>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="100%" CssClass="AddTopPadding" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server" CssClass="AddTopPadding">
                            <dx:ASPxHyperLink ID="ASPxFormLayout1_E2" runat="server" Text="Carian Stok">
                            </dx:ASPxHyperLink>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem ShowCaption="False" Width="100%" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Kod Stok" ShowInCustomizationForm="True" VisibleIndex="0" Width="15%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keterangan" ShowInCustomizationForm="True" VisibleIndex="1" Width="55%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Unit Pengukuran" ShowInCustomizationForm="True" VisibleIndex="2" Width="15%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Kuantiti Dipohon" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="4" Width="5%">
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
</dx:ASPxFormLayout>

