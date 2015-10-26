﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tugasan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PenggunaSistem.Tugasan.Tugasan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function Pr_Approval(ProcessId, Revision)
    {
        window.open('../../Shared/PermohonanBelian/Index.aspx?ProcessId='+ ProcessId.toString() +'*'+Revision.toString());
    }

    function GRN_Approval(ProcessId, Revision) {
        window.open('../../Shared/TerimaanBarang/Index.aspx?ProcessId=' + ProcessId.toString() + '*' + Revision.toString());
    }

    function AK_Approval(ProcessId)
    { window.open('../../Aset/AduanKerosakan/Index.aspx?ProcessId=' + ProcessId.toString()); }

    function RefreshGrid()
    {
        MyTaskGrid.PerformCallback();
    }

    function PP_Approval(ProcessId, Revision) {
        window.open('../../Aset/Pinjaman/Index.aspx?ProcessId=' + ProcessId.toString() + '*' + Revision.toString());
    }

    function LK_Approval(ProcessId, Revision) {
        window.open('../../Aset/LaporanKehilangan/Index.aspx?ProcessId=' + ProcessId.toString() + '*' + Revision.toString());
    }

</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Tugasan" ShowCollapseButton="true" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/MyTask.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left;"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%" ClientEnabled="False">
    <Tabs>
        <dx:RibbonTab Name="Utama" Text="Utama">
            <Groups>
                <dx:RibbonGroup Text="Pengurusan Rekod" Name="Pengurusan Rekod">
                    <Items>
                        <dx:RibbonButtonItem BeginGroup="True" Name="Kemaskini" Size="Large" Text="Kemaskini">
                            <LargeImage IconID="edit_edit_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tambah" Size="Large" Text="Tambah">
                            <LargeImage IconID="actions_add_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Simpan" Size="Large" Text="Simpan">
                            <LargeImage IconID="save_save_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Hantar" Size="Large" Text="Hantar">
                            <LargeImage IconID="mail_send_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Padam" Size="Large" Text="Padam">
                            <LargeImage IconID="edit_delete_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Batal" Size="Large" Text="Batal">
                            <LargeImage IconID="actions_deletelist_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Cetak" Size="Large" Text="Cetak">
                            <LargeImage IconID="print_print_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Carian" Size="Large" Text="Carian">
                            <LargeImage IconID="find_find_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Audit" Size="Large" Text="Audit">
                            <LargeImage IconID="arrange_bringtofrontoftext_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Tutup" Size="Large" Text="Tutup">
                            <LargeImage IconID="actions_close_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Lampiran" Text="Muatnaik">
            <Groups>
                <dx:RibbonGroup Name="Muatnaik" Text="">
                    <Items>
                        <dx:RibbonButtonItem Size="Large" Text="Lampiran" Name="Lampiran">
                            <LargeImage IconID="mail_attachment_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Gambar" Size="Large" Text="Gambar">
                            <LargeImage IconID="content_image_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Impot" Size="Large" Text="Import">
                            <LargeImage IconID="actions_download_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Laporan" Text="Laporan">
            <Groups>
                <dx:RibbonGroup>
                    
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
        <dx:RibbonTab Name="Kelulusan" Text="Kelulusan">
            <Groups>
                <dx:RibbonGroup>
                    <Items>
                        <dx:RibbonButtonItem Name="Lulus" Size="Large" Text="Lulus">
                            <LargeImage IconID="actions_apply_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                        <dx:RibbonButtonItem Name="Kuiri" Size="Large" Text="Kuiri">
                            <LargeImage IconID="support_knowledgebasearticle_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
                </dx:RibbonGroup>
            </Groups>
        </dx:RibbonTab>
    </Tabs>
    <Styles>
        <Item Width="70px">
        </Item>
    </Styles>
    <ClientSideEvents CommandExecuted="function(s, e) {
	MainRibbon_CommandExecuted(s, e);
}" />
</dx:ASPxRibbon></td>
        </tr>
        <tr>
            <td style="width:100%; vertical-align:top; text-align:left;padding-top:10px;">
                <dx:ASPxGridView ID="MyTaskGrid" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="MyTaskDs" ClientInstanceName="MyTaskGrid" EnableCallbackAnimation="True" KeyFieldName="MT_Ref" OnCustomCallback="MyTaskGrid_CustomCallback" OnHtmlDataCellPrepared="MyTaskGrid_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="0" FieldName="MT_ProcessId" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" FieldName="MT_Revision" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="No. Rujukan" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%" FieldName="MT_Ref" ReadOnly="True">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                            <DataItemTemplate>
                                <dx:ASPxHyperLink ID="MT_Ref" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                                </dx:ASPxHyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarikh Dihantar" FieldName="MT_Date" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Dihantar Oleh" ShowInCustomizationForm="True" VisibleIndex="4" Width="40%" FieldName="MT_SubmittedBy" ReadOnly="True">
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="MT_Description" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="40%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MT_Type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsLoadingPanel Mode="Disabled" />
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Styles>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="MyTaskDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_TransactionConnectionString %>" OnSelecting="MyTaskDs_Selecting" SelectCommand="SELECT [MT_ProcessId], [MT_Revision], [MT_Ref], [MT_Date], [MT_SubmittedBy], [MT_Description], [MT_Type] FROM [V_MyTask] WHERE ([MT_Receipient] = @MT_Receipient) ORDER BY [MT_Date] DESC">
                    <SelectParameters>
                        <asp:Parameter Name="MT_Receipient" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

