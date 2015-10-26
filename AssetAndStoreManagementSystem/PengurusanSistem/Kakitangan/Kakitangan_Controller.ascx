<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Kakitangan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.PengurusanSistem.Kakitangan.Kakitangan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<script>
    function cbp_Report_EndCallback(s, e) 
    {
        PopupPrint.SetWidth(screen.width * 0.8);
        PopupPrint.SetHeight(screen.width * 0.45);
        PopupPrint.SetContentUrl('../../Report/Index.aspx');
        PopupPrint.Show();
    }

    function OnPageLoad()
    {
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        ManageMainRibbonUtamaTab('false', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'false', 'true');
    }

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) 
    {
            if (Kemaskini == 'true')
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Kemaskini").SetEnabled(false);

            if (Tambah == 'true')
                MainRibbon.GetItemByName("Tambah").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Tambah").SetEnabled(false);

            if (Simpan == 'true')
                MainRibbon.GetItemByName("Simpan").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Simpan").SetEnabled(false);

            if (Hantar == 'true')
                MainRibbon.GetItemByName("Hantar").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Hantar").SetEnabled(false);

            if (Padam == 'true')
                MainRibbon.GetItemByName("Padam").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Padam").SetEnabled(false);

            if (Batal == 'true')
                MainRibbon.GetItemByName("Batal").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Batal").SetEnabled(false);

            if (Cetak == 'true')
                MainRibbon.GetItemByName("Cetak").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Cetak").SetEnabled(false);

            if (Carian == 'true')
                MainRibbon.GetItemByName("Carian").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Carian").SetEnabled(false);

            if (Audit == 'true')
                MainRibbon.GetItemByName("Audit").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Audit").SetEnabled(false);

            if (Tutup == 'true')
                MainRibbon.GetItemByName("Tutup").SetEnabled(true);
            else
                MainRibbon.GetItemByName("Tutup").SetEnabled(false);
        }

    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name)
        {            
            case 'Tutup': TutupClicked(); break;             
            case 'Cetak': CetakClicked(); break;
        }
    }

    function TutupClicked() {
        window.close();
        return true;
    }

    function CetakClicked()
        { cbp_Report.PerformCallback(); }
    
</script>
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Kakitangan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Kakitangan.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%">
        <tr>
            <td>
                <dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
                    <Items>
                        <dx:RibbonButtonItem Name="KEW.PA-1" Size="Large" Text="KEW.PA-1">
                            <LargeImage IconID="reports_report_32x32">
                            </LargeImage>
                        </dx:RibbonButtonItem>
                    </Items>
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
</dx:ASPxRibbon>
            </td>
        </tr>
         <tr>
            <td style="padding-top:10px;">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                    <Items>
<dx:LayoutItem ShowCaption="False">
    <LayoutItemNestedControlCollection>
<dx:LayoutItemNestedControlContainer runat="server">
    <dx:ASPxGridView ID="GridEmployee" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridEmployee" DataSourceID="EmpDs" KeyFieldName="User_Id" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="User_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ID Staf" FieldName="User_EmployeeId" ShowInCustomizationForm="True" VisibleIndex="1">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="User_Name" ShowInCustomizationForm="True" VisibleIndex="2">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. KP" FieldName="User_NRIC" ShowInCustomizationForm="True" VisibleIndex="3">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Emel" FieldName="User_EmailAddress" ShowInCustomizationForm="True" VisibleIndex="4">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Tel. Bimbit" FieldName="User_Handphone" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Tel. Pejabat" FieldName="User_OfficeNumber" ShowInCustomizationForm="True" VisibleIndex="6">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="Dsgt_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Gred" FieldName="User_DesignationGrade" ShowInCustomizationForm="True" VisibleIndex="8">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_FullName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AutoExpandAllGroups="True" />
        <SettingsPager PageSize="20">
        </SettingsPager>
        <Settings GroupFormat="{1} {2}" ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [User_Id], [User_EmployeeId], [User_Name], [User_NRIC], [User_EmailAddress], [User_Handphone], [User_OfficeNumber], [Dsgt_Name], [User_DesignationGrade], [PTJ_FullName] FROM [V_User] WHERE ([User_StatusCode] = @User_StatusCode) ORDER BY [User_EmployeeId]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="User_StatusCode" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        </dx:LayoutItemNestedControlContainer>
</LayoutItemNestedControlCollection>
</dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
             </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxPopupControl ID="PopupPrint" runat="server" AllowDragging="True" ClientInstanceName="PopupPrint" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Cetakan Senarai Staf" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowResize="True">
    <ClientSideEvents Closing="function(s, e) {
PopupPrint.SetContentUrl('about:blank');	
}" />
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxCallbackPanel ID="cbp_Report" runat="server" ClientInstanceName="cbp_Report" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_Report_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_Report_EndCallback(s, e);

}" />
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>