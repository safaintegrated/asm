<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AJKPemeriksaanPelupusan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.AJKPemeriksaanPelupusan.AJKPemeriksaanPelupusan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    //display after insert data untuk tambah (AddMember)
    function SelectMember()
    {
        LoadingPanel.SetText('Sistem sedang mendaftar Ali Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        alert('1');
        cbpAJKPemeriksaanPelupusan.PerformCallback('ADDMEMBER')
        alert('2');
    }

    function LookupAhliLembaga()
    {
        popupSearchEmployee.SetWidth(screen.width * 0.85);
        popupSearchEmployee.Show();
        gvAJKPemeriksaanPelupusan.PerformCallback();
    }

    function BeforeDeleteMember(EmpId, EmpName)
    {
        DeleteMemberTemp.SetText(EmpId.toString());
        popupDeleteGridRowConfirmation_Label.SetText('Padam ahli lembaga ini (' + EmpName.toString() + ')?');
        popupDeleteGridRowConfirmation.Show();
        popupDeleteGridRowConfirmation_BtnOk.Focus();
    }

    function ProceedWithMemberDelete()
    {
        LoadingPanel.SetText('Sistem sedang memadam Ali Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_LembagaPemeriksa.PerformCallback('DELETEMEMBER')
    }

    function LoadSelectedLembaga(U)
    {
        LPH_UniqueId.SetText(U.toString());
        LoadingPanel.SetText('Sistem sedang membuka maklumat Lembaga Pemeriksa yang telah dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_LembagaPemeriksa.PerformCallback('LOAD');
    }

    function cbp_SavePostDelete_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '') {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {            
            if (s.cpMode.toString() == 'SAVE') {
                EnableDisableHeaderForm('false');
                EnableDisableLembagaMembersGrid('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah disimpan dengan jayanya.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
                cbp_LembagaPemeriksa.PerformCallback('REFRESHSTATUS');
            }
            else if (s.cpMode.toString() == 'POST') {
                EnableDisableHeaderForm('false');
                EnableDisableLembagaMembersGrid('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah dihantar dengan jayanya.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
                cbp_LembagaPemeriksa.PerformCallback('REFRESHSTATUS');
            }
        }
    }

    function cbp_LembagaPemeriksa_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
        else
        {
            if (s.cpMode.toString() == 'LOAD')
            {
                EnableDisableHeaderForm('false');
                EnableDisableLembagaMembersGrid('false');

                if (LPH_UniqueId.GetText() == '')
                    ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                else
                    ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupSearchLembagaPemeriksa.Hide();
            }
            else if (s.cpMode.toString() == 'ADD')
            {
                EnableDisableHeaderForm('true');
                EnableDisableLembagaMembersGrid('true');
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
                LPH_LembagaName.Focus();
            }
            else if (s.cpMode.toString() == 'ADDMEMBER')
            { popupSearchEmployee.Hide(); }
            else if (s.cpMode.toString() == 'DELETEMEMBER')
            { popupDeleteGridRowConfirmation.Hide(); }            
            else if (s.cpMode.toString() == 'DELETEHEADER')
            {
                EnableDisableHeaderForm('false');
                EnableDisableLembagaMembersGrid('false');
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                popupMsg_Label.SetText('Rekod Lembaga Pemeriksa telah dipadam dengan jayanya.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }
            else if (s.cpMode.toString() == 'REFRESHSTATUS')
            {
                EnableDisableHeaderForm('false');
                EnableDisableLembagaMembersGrid('false');
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
            }
        }
    }

    function ProceedWithDeleteHeader()
    {
        LoadingPanel.SetText('Sistem sedang memadam maklumat Lembaga Pemeriksa yang dipilih.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbp_LembagaPemeriksa.PerformCallback('DELETEHEADER')
    }

    function OnPageLoadEvents() {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
        MainRibbon.GetItemByName("Lampiran").SetEnabled(false);
        MainRibbon.GetItemByName("Gambar").SetEnabled(false);
        MainRibbon.GetItemByName("Impot").SetEnabled(false);
        MainRibbon.GetItemByName("Lulus").SetEnabled(false);
        MainRibbon.GetItemByName("Kuiri").SetEnabled(false);
        EnableDisableHeaderForm('false');
    }

    function EnableDisableHeaderForm(EnableDisable)
    {
        if (EnableDisable == 'true') {
            LPH_LembagaName.SetEnabled(true);
            LPH_AssignedPtj.SetEnabled(true);
            LPH_AssignYear.SetEnabled(true);
            LPH_StartDate.SetEnabled(true);
            LPH_EndDate.SetEnabled(true);
            LinkLookupEmployee.SetEnabled(true);
        }
        else {
            LPH_LembagaName.SetEnabled(false);
            LPH_AssignedPtj.SetEnabled(false);
            LPH_AssignYear.SetEnabled(false);
            LPH_StartDate.SetEnabled(false);
            LPH_EndDate.SetEnabled(false);
            LinkLookupEmployee.SetEnabled(false);
        }
    }

    function MainRibbon_CommandExecuted(s, e) {
        switch (e.item.name) {
            case 'Kemaskini': KemaskiniClicked(); break;
            case 'Lulus': LulusClicked(); break;
            case 'Kuiri': KuiriClicked(); break;
            case 'Tutup': TutupClicked(); break;
            case 'Tambah': TambahClicked(); break;
            case 'Simpan': SimpanClicked(); break;
            case 'Hantar': HantarClicked(); break;
            case 'Padam': PadamClicked(); break;
            case 'Batal': BatalCicked(); break;
            case 'Cetak': CetakClicked(); break;
            case 'Carian': CarianClicked(); break;
            case 'Audit': AuditClicked(); break;
            case 'Lampiran': LampiranClicked(); break;
            case 'Gambar': GambarClicked(); break;
            case 'Impot': ImpotClicked(); break;
        }
    }

    function LulusClicked()
    { }

    function KuiriClicked()
    { }

    function KemaskiniClicked()
    {
        EnableDisableHeaderForm('true');
        EnableDisableLembagaMembersGrid('true');
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'true', 'true', 'false', 'false', 'false', 'true');
    }

    function TambahClicked()
    {
        ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
        LoadingPanel.SetText('Sistem sedang bersedia untuk menerima maklumat Lembaga Pemeriksa baharu.  Sila tunggu sebentar..');
        LoadingPanel.Show();
        cbpAJKPemeriksaanPelupusan.PerformCallback('ADD');
        LPH_LembagaName.Focus();
        alert('1');

        
    }

    function SimpanClicked()
    {
        if (CheckHeaderForm())
        {
            LoadingPanel.SetText('Sistem sedang menyimpan maklumat Lembaga Pemeriksa.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_SavePostDelete.PerformCallback('SAVE')
        }
    }

    function HantarClicked()
    {
        if (CheckHeaderForm() && CheckLembagaMembers() && CheckLembagaMembersRole())
        {
            EnableDisableHeaderForm('true');
            EnableDisableLembagaMembersGrid('true');
            LoadingPanel.SetText('Sistem sedang menghantar maklumat Lembaga Pemeriksa.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_SavePostDelete.PerformCallback('POST')
        }
    }

    function PadamClicked()
    {
        popupDeleteHeaderConfirmation_Label.SetText('Padam rekod Lembaga Pemeriksa ini (' + LPH_LembagaName.GetText() + ') .<br>Anda pasti?');
        popupDeleteHeaderConfirmation.Show();
        popupDeleteHeaderConfirmation_BtnOk.Focus();
    }

    function BatalCicked()
    {
        if (LPH_UniqueId.GetText() == '')
        {
            LoadingPanel.SetText('Sistem sedang membatalkan rekod Lembaga Pemeriksa ini.  Sila tunggu sebentar..');
        }
        else { LoadingPanel.SetText('Sistem sedang membuka kembali maklumat Lembaga Pemeriksa ini yang terakhir disimpan.  Sila tunggu sebentar..'); }

        LoadingPanel.Show();
        cbp_LembagaPemeriksa.PerformCallback('LOAD')
    }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupSearchLembagaPemeriksa.SetWidth(screen.width * 0.85);
        popupSearchLembagaPemeriksa.SetContentUrl('Lookup/Index.aspx');
        popupSearchLembagaPemeriksa.Show();
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { window.close();}

    function LampiranClicked()
    { }

    function GambarClicked()
    { }

    function ImpotClicked()
    { }

    function ManageMainRibbonUtamaTab(Kemaskini, Tambah, Simpan, Hantar, Padam, Batal, Cetak, Carian, Audit, Tutup) {
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

    function CheckHeaderForm()
    {
        if (LPH_LembagaName.GetText() == '' || LPH_AssignedPtj.GetText() == '' || LPH_AssignYear.GetText() == '' || LPH_StartDate.GetText() == '' || LPH_EndDate.GetText() == '')
        {
            popupMsg_Label.SetText('Semua medan untuk Lembaga Pemeriksa perlu diisi terlebih dahulu.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
        else
            return true;
    }

    function CheckLembagaMembers()
    {
        if (GridLembagaPemeriksa.GetVisibleRowsOnPage() > 0)
            return true;
        else
        {
            popupMsg_Label.SetText('Sekurang-kurangnya 1 kakitangan diperlukan sebagai ahli Lembaga Pemeriksa.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
            return false;
        }
    }

    function CheckLembagaMembersRole()
    {
        var lpass = true;

        var LPD_MIR_Id;

        for (var i = 0; i < GridLembagaPemeriksa.GetVisibleRowsOnPage() ; i++)
        {
            LPD_MIR_Id = ASPxClientControl.GetControlCollection().GetByName('LPD_MIR_Id' + i.toString());

            if (LPD_MIR_Id.GetText() == '')
            {
                lpass = false;
                popupMsg_Label.SetText('Setiap ahli lembaga perlu mempunyai peranan.<br>Sila semak dan cuba sekali lagi.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus();
            }

            if (!lpass)
                break;
        }

        return lpass;
    }

    function EnableDisableLembagaMembersGrid(EnableDisable)
    {
        var LPD_MIR_Id;
        var LPD_EmpId;

        for (var i = 0; i < GridLembagaPemeriksa.GetVisibleRowsOnPage() ; i++)
        {
            LPD_MIR_Id = ASPxClientControl.GetControlCollection().GetByName('LPD_MIR_Id' + i.toString());
            LPD_EmpId = ASPxClientControl.GetControlCollection().GetByName('LPD_EmpId' + i.toString());

            if (EnableDisable == 'true')
            {
                LPD_MIR_Id.SetEnabled(true);
                LPD_EmpId.SetVisible(true);
            }
            else
            {
                LPD_MIR_Id.SetEnabled(false);
                LPD_EmpId.SetVisible(false);
            }
        }
    }
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Lantikan AJK Pemeriksaan Pelupusan" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/LembagaPemeriksa.png">
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
            <td style="padding-top:10px">
                <dx:ASPxCallbackPanel ID="cbpAJKPemeriksaanPelupusan" runat="server" ClientInstanceName="cbpAJKPemeriksaanPelupusan" EnableCallbackAnimation="True" EnableClientSideAPI="True" OnCallback="cbpAJKPemeriksaanPelupusan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
                    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                    <ClientSideEvents EndCallback="function(s, e) {
	cbp_LembagaPemeriksa_EndCallback(s, e);
}" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Maklumat Ahli Jawatankuasa" ColCount="3" Width="80%">
                                        <Items>
                                            <dx:LayoutItem Caption="Nama Ahli Jwatankuasa" Width="35%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LPH_LembagaName" runat="server" ClientInstanceName="LPH_LembagaName" CssClass="TextBoxForName" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="PTJ Yang Dipertanggungjawabkan" Width="45%">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridLookup ID="LPH_AssignedPtj" runat="server" AutoGenerateColumns="False" ClientInstanceName="LPH_AssignedPtj" DataSourceID="Ptj_Ds" EnableClientSideAPI="True" KeyFieldName="PTJ_Id" TextFormatString="{1}" Width="100%">
                                                            <GridViewProperties>
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                                <Settings ShowFilterRow="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Kod" FieldName="PTJ_Code" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nama Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="90%">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="PTJ_Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                                    <EditFormSettings Visible="False" />
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GridViewStyles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </GridViewStyles>
                                                            <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(550);
}" />
                                                        </dx:ASPxGridLookup>
                                                        <asp:SqlDataSource ID="Ptj_Ds" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [PTJ_Code], [PTJ_Name], [PTJ_Id] FROM [PusatTanggungJawab] ORDER BY [PTJ_Code]"></asp:SqlDataSource>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:EmptyLayoutItem Width="20%">
                                            </dx:EmptyLayoutItem>
                                            <dx:LayoutGroup ColCount="4" ColSpan="3" GroupBoxDecoration="None">
                                                <GroupBoxStyle>
                                                    <Border BorderStyle="None" />
                                                </GroupBoxStyle>
                                                <Items>
                                                    <dx:LayoutItem Caption="Tahun Pemeriksaan" Width="7%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxSpinEdit ID="LPH_AssignYear" runat="server" AllowMouseWheel="False" ClientInstanceName="LPH_AssignYear" CssClass="DateEditor" EnableClientSideAPI="True" NumberType="Integer" Width="100%">
                                                                    <SpinButtons ShowIncrementButtons="False">
                                                                    </SpinButtons>
                                                                </dx:ASPxSpinEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Mula Lantikan" Width="8%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="LPH_StartDate" runat="server" ClientInstanceName="LPH_StartDate" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tarikh Tamat Lantikan" Width="8%">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="LPH_EndDate" runat="server" ClientInstanceName="LPH_EndDate" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" EnableClientSideAPI="True" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:EmptyLayoutItem Width="77%">
                                                    </dx:EmptyLayoutItem>
                                                </Items>
                                                <ParentContainerStyle>
                                                    <Paddings Padding="0px" />
                                                </ParentContainerStyle>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Rujukan" Width="20%">
                                        <Items>
                                            <dx:LayoutItem Caption="No. Rujukan">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LPH_RefNumber" runat="server" ClientEnabled="False" ClientInstanceName="LPH_RefNumber" EnableClientSideAPI="True" Width="60%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Status">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="StatusText" runat="server" ClientEnabled="False" ClientInstanceName="StatusText" EnableClientSideAPI="True" Width="60%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Kemaskini Terakhir Oleh">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LastModeName" runat="server" ClientEnabled="False" ClientInstanceName="LastModeName" EnableClientSideAPI="True" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Tarikh">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="LPH_LastModeDate" runat="server" ClientEnabled="False" ClientInstanceName="LPH_LastModeDate" CssClass="DateEditor" EnableClientSideAPI="True">
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LPH_UniqueId" runat="server" ClientInstanceName="LPH_UniqueId" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LPH_LastModeBy" runat="server" ClientInstanceName="LPH_LastModeBy" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="LPH_Status" runat="server" ClientInstanceName="LPH_Status" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Ahli Jawatankuasa" ColSpan="2">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxHyperLink ID="LinkLookupEmployee" runat="server" ClientInstanceName="LinkLookupEmployee" CssClass="myHyperlink" EnableClientSideAPI="True" Text="Pilih Ahli AJK Pemeriksaan Pelupusan" NavigateUrl="javascript: LookupAhliLembaga();">
                                                        </dx:ASPxHyperLink>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="gvAJKPemeriksaanPelupusan" runat="server" AutoGenerateColumns="False" Width="100%" ClientInstanceName="gvAJKPemeriksaanPelupusan" KeyFieldName="LPD_EmpId" OnHtmlDataCellPrepared="gvAJKPemeriksaanPelupusan_HtmlDataCellPrepared">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Nama" ShowInCustomizationForm="True" VisibleIndex="0" Width="25%" FieldName="LPD_EmpName">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Jawatan" ShowInCustomizationForm="True" VisibleIndex="1" Width="20%" FieldName="LPD_EmpDesignation">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Gred Jawatan" ShowInCustomizationForm="True" VisibleIndex="2" Width="5%" FieldName="LPD_EmpGrade">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Emel" ShowInCustomizationForm="True" VisibleIndex="3" Width="20%" FieldName="LPD_EmpEmail">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Telefon" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%" FieldName="LPD_Telephone">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Peranan" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%" FieldName="LPD_MIR_Id">
                                                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxComboBox ID="LPD_MIR_Id" EnableClientSideAPI="True" runat="server" DataSourceID="InsRoleDs" Width="100%" ValueField="MIR_Id" TextField="MIR_Desc" ValueType="System.Int32">
                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="MIR_Desc" Caption="Peranan" />
                                                                                <dx:ListBoxColumn Visible="False" FieldName="MIR_Id" />
                                                                            </Columns>
                                                                        </dx:ASPxComboBox>
                                                                        <asp:SqlDataSource ID="InsRoleDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [MIR_Id], [MIR_Desc] FROM [Master_InspectorRole] ORDER BY [MIR_Desc]"></asp:SqlDataSource>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Padam" ShowInCustomizationForm="True" VisibleIndex="6" Width="5%" FieldName="LPD_EmpId">
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                                                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                                                                    </CellStyle>
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxHyperLink ID="LPD_EmpId" EnableClientSideAPI="true" ImageUrl="~/Public/Images/GridIcons/GridDelete.png" runat="server" Text="ASPxHyperLink">
                                                                        </dx:ASPxHyperLink>
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowSort="False" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Styles>
                                                                <AlternatingRow Enabled="True">
                                                                </AlternatingRow>
                                                            </Styles>
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
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True">
</dx:ASPxLoadingPanel>
<dx:ASPxPopupControl ID="popupMsg" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupMsg" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Informasi Sistem" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Information.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol3" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupMsg_Label" runat="server" ClientInstanceName="popupMsg_Label" EnableClientSideAPI="True" EncodeHtml="False">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:35%"></td>
                        <td style="width:30%; text-align:center; vertical-align:middle;">
                            <dx:aspxbutton ID="popupMsg_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupMsg_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupMsg.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:35%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


<dx:ASPxPopupControl ID="popupSearchLembagaPemeriksa" runat="server" AllowDragging="True" ClientInstanceName="popupSearchLembagaPemeriksa" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Rekod Lembaga Pemeriksa" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ClientSideEvents Closing="function(s, e) {
	popupSearchLembagaPemeriksa.SetContentUrl('about:blank');
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>



<dx:ASPxPopupControl ID="popupDeleteHeaderConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteHeaderConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol4" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteHeaderConfirmation_Label" runat="server" ClientInstanceName="popupDeleteHeaderConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithDeleteHeader();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteHeaderConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteHeaderConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteHeaderConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


        





<dx:ASPxPopupControl ID="popupDeleteGridRowConfirmation" runat="server" AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" ClientInstanceName="popupDeleteGridRowConfirmation" CloseAction="CloseButton" EnableClientSideAPI="True" HeaderText="Pastikan Tindakan Anda" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="450px"  >
            <HeaderImage Url="~/Public/Images/DialogBox/Error.png">
            </HeaderImage>
            <HeaderStyle ImageSpacing="8px" VerticalAlign="Middle" />
            <ContentCollection>
<dx:popupcontrolcontentcontrol ID="Popupcontrolcontentcontrol5" runat="server">
    <table style="width:100%; text-align:center;vertical-align:top;">
        <tr>
            <td>
                <dx:aspxlabel ID="popupDeleteGridRowConfirmation_Label" runat="server" ClientInstanceName="popupDeleteGridRowConfirmation_Label" EnableClientSideAPI="True" EncodeHtml="False" Text="Anda pasti untuk memadam rekod ini?">
                </dx:aspxlabel>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <table style="width:100%; vertical-align:top; text-align:left;">
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:35%; text-align:right; vertical-align:middle; padding-right:6px;">
                            <dx:aspxbutton ID="popupDeleteGridRowConfirmation_BtnOk" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnOk" Text="Ok" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	ProceedWithMemberDelete();
}" />
                            </dx:aspxbutton>
                        </td>
                         <td style="width:35%; text-align:left; vertical-align:middle; padding-left:6px;">
                            <dx:aspxbutton ID="popupDeleteGridRowConfirmation_BtnCancel" runat="server" AutoPostBack="False" ClientInstanceName="popupDeleteGridRowConfirmation_BtnCancel" Text="Batal" Width="100px">
                                <ClientSideEvents Click="function(s, e) {
	popupDeleteGridRowConfirmation.Hide();
}" />
                            </dx:aspxbutton>
                        </td>
                        <td style="width:15%"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                </dx:popupcontrolcontentcontrol>
</ContentCollection>
        </dx:ASPxPopupControl>


        





<dx:ASPxTextBox ID="DeleteMemberTemp" runat="server" ClientInstanceName="DeleteMemberTemp" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
</dx:ASPxTextBox>



        





<dx:ASPxPopupControl ID="popupSearchEmployee" runat="server" AllowDragging="True" ClientInstanceName="popupSearchEmployee" CloseAnimationType="Fade" EnableClientSideAPI="True" HeaderText="Carian Kakitangan" MaxHeight="550px" MinHeight="500px" MinWidth="650px" Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
        <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectMember();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchEmployee.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ClientSideEvents Closing="function(s, e) {
	popupSearchLembagaPemeriksa.SetContentUrl('about:blank');
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridEmpLookup" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridEmpLookup" DataSourceID="EmpDs" EnableCallbackAnimation="True" KeyFieldName="EmployeeSystemId" Width="100%" OnAfterPerformCallback="GridEmpLookup_AfterPerformCallback" OnCustomCallback="GridEmpLookup_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="EmployeeSystemId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="1" Width="19%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jawatan" FieldName="EmployeeDesignation" ShowInCustomizationForm="True" VisibleIndex="4" Width="16%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeAddress" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeNric" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeePTJ" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat Emel" FieldName="EmployeeEmail" ShowInCustomizationForm="True" VisibleIndex="6" Width="12%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="EmployeeStatus" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="Gred" FieldName="EmployeeGrade" ShowInCustomizationForm="True" VisibleIndex="5" Width="6%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Telefon" FieldName="EmployeeTelephone" ShowInCustomizationForm="True" VisibleIndex="7" Width="7%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeDepartment" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="19%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="18%">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn SelectAllCheckboxMode="AllPages" ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True"></CellStyle>  
            </dx:GridViewCommandColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="EmpDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_StockConnectionString %>" SelectCommand="SELECT * FROM [V_EmployeeActive] ORDER BY [EmployeeName]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>







        





<dx:ASPxCallbackPanel ID="cbp_SavePostDelete" runat="server" ClientInstanceName="cbp_SavePostDelete" ClientVisible="False" EnableClientSideAPI="True" OnCallback="cbp_SavePostDelete_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="200px">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SavePostDelete_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>








        





