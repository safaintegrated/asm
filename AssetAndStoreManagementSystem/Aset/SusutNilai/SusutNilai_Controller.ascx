<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SusutNilai_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.SusutNilai.SusutNilai_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>

    function SusutNilaiSelected(P)
    {
        txtStopGo.SetText('1');
        AIDH_ProcessId.SetText(P.toString());
        LoadingPanel.SetText('Sistem sedang membuka rekod susutnilai yang dipilih.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        GridDepreciation.PerformCallback();
    }

    function cbp_SavePost_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'SAVE')
            {
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'true', 'false', 'false', 'false', 'true', 'true', 'true');
                popupMsg_Label.SetText('Maklumat susutnilai telah disimpan dengan jayanya.');
                popupMsg.Show();
            }
            else
            {
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false;', 'false', 'false', 'false', 'true', 'true', 'true');
                popupMsg_Label.SetText('Maklumat susutnilai telah dihantar dengan jayanya.');
                popupMsg.Show();
            }
        }
    }

    function GridDepreciation_EndCallback(s, e)
    {
        LoadingPanel.Hide();
        AIDH_ProcessId.SetText(s.cpProcessId.toString());

        if (s.cpRecCount.toString() != '0')
        {
            if (s.cpPrevYear.toString() != '') {
                PrevYear.SetNumber(parseInt(s.cpPrevYear));
                PrevYear.SetVisible(true);
            }
            else
                PrevYear.SetVisible(false);


            if (s.cpPrevMonth.toString() != '') {
                PrevMonth.SetValue(parseInt(s.cpPrevMonth));
                PrevMonth.SetVisible(true);
            }
            else
                PrevMonth.SetVisible(false);


            CurrYear.SetNumber(parseInt(s.cpCurrYear));
            CurrMonth.SetValue(parseInt(s.cpCurrMonth))

            if (s.cpExecType.toString() != '3')
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'true', 'false', 'false', 'true');
            else
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'false', 'true');
        }
        else {
            popupMsg_Label.SetText('Tiada rekod aset yang dijumpai untuk proses susutnilai.');
            popupMsg.Show();
        }
    }

    function OnPageLoad()
    {
        ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true');
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
    { }

    function TambahClicked()
    {
        AIDH_ProcessId.SetText('');
        txtStopGo.SetText('1');
        LoadingPanel.SetText('Sistem sedang menyediakan pengiraan susutnilai.  Sila tunggu sebentar..')
        LoadingPanel.Show();
        GridDepreciation.PerformCallback();
    }

    function SimpanClicked()
    {
        LoadingPanel.SetText('Sistem sedang menyimpan rekod-rekod susutnilai.  Sila tunggu..');
        LoadingPanel.Show();
        cbp_SavePost.PerformCallback('SAVE');
    }

    function HantarClicked()
    {
        LoadingPanel.SetText('Sistem sedang menghantar rekod-rekod susutnilai.  Sila tunggu..');
        LoadingPanel.Show();
        cbp_SavePost.PerformCallback('POST');
    }

    function PadamClicked()
    { }

    function BatalCicked()
    { }

    function CetakClicked()
    { }

    function CarianClicked()
    {
        popupSearch.SetWidth(screen.width * 0.7);
        popupSearch.Show();
        GridSearch.PerformCallback();
    }

    function AuditClicked()
    { }

    function TutupClicked()
    { }

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
</script>

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Susutnilai" Width="100%">
    <HeaderImage Url="~/Public/Images/Screen/Susutnilai.png">
    </HeaderImage>
    <HeaderStyle ImageSpacing="8px" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td colspan="2"  style="width:100%; vertical-align:top; text-align:left;"><dx:ASPxRibbon ID="MainRibbon" runat="server" ShowFileTab="False" ClientInstanceName="MainRibbon" Width="100%">
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
            <td style="width:80%; vertical-align:top; text-align:left; padding-top:10px;">
                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Maklumat Susutnilai" ColCount="3" Width="100%">
                            <Items>
                                <dx:LayoutGroup Caption="Susutnilai Sebelum" Width="15%">
                                    <Items>
                                        <dx:LayoutItem Caption="Tahun" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxSpinEdit ID="PrevYear" runat="server" AllowMouseWheel="False" Number="0" ClientEnabled="False" ClientInstanceName="PrevYear" EnableClientSideAPI="True" Width="100%">
                                                        <SpinButtons ShowIncrementButtons="False">
                                                        </SpinButtons>
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Bulan" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="PrevMonth" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="PrevMonth" EnableClientSideAPI="True">
                                                        <Items>
                                                            <dx:ListEditItem Text="Januari" Value="1" />
                                                            <dx:ListEditItem Text="Febuari" Value="2" />
                                                            <dx:ListEditItem Text="Mac" Value="3" />
                                                            <dx:ListEditItem Text="April" Value="4" />
                                                            <dx:ListEditItem Text="Mei" Value="5" />
                                                            <dx:ListEditItem Text="Jun" Value="6" />
                                                            <dx:ListEditItem Text="Julai" Value="7" />
                                                            <dx:ListEditItem Text="Ogos" Value="8" />
                                                            <dx:ListEditItem Text="September" Value="9" />
                                                            <dx:ListEditItem Text="Oktober" Value="10" />
                                                            <dx:ListEditItem Text="November" Value="11" />
                                                            <dx:ListEditItem Text="Disember" Value="12" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Susutnilai Ini" Width="15%">
                                    <Items>
                                        <dx:LayoutItem Caption="Tahun" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxSpinEdit ID="CurrYear" runat="server" AllowMouseWheel="False" Number="0" ClientEnabled="False" ClientInstanceName="CurrYear" EnableClientSideAPI="True" Width="100%">
                                                        <SpinButtons ShowIncrementButtons="False">
                                                        </SpinButtons>
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Bulan" Width="100%">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxComboBox ID="CurrMonth" runat="server" Width="100%" ClientEnabled="False" ClientInstanceName="CurrMonth" EnableClientSideAPI="True">
                                                        <Items>
                                                            <dx:ListEditItem Text="Januari" Value="1" />
                                                            <dx:ListEditItem Text="Febuari" Value="2" />
                                                            <dx:ListEditItem Text="Mac" Value="3" />
                                                            <dx:ListEditItem Text="April" Value="4" />
                                                            <dx:ListEditItem Text="Mei" Value="5" />
                                                            <dx:ListEditItem Text="Jun" Value="6" />
                                                            <dx:ListEditItem Text="Julai" Value="7" />
                                                            <dx:ListEditItem Text="Ogos" Value="8" />
                                                            <dx:ListEditItem Text="September" Value="9" />
                                                            <dx:ListEditItem Text="Oktober" Value="10" />
                                                            <dx:ListEditItem Text="November" Value="11" />
                                                            <dx:ListEditItem Text="Disember" Value="12" />
                                                        </Items>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:EmptyLayoutItem Width="70%">
                                </dx:EmptyLayoutItem>
                                <dx:LayoutItem ColSpan="3" ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ColSpan="3" ShowCaption="False" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="GridDepreciation" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepreciation" Width="100%" DataSourceID="SusutNilaiDs" OnCustomCallback="GridDepreciation_CustomCallback">
                                                <ClientSideEvents EndCallback="function(s, e) {
	GridDepreciation_EndCallback(s, e);
}" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Kategori" FieldName="AIRMI_Cat" ShowInCustomizationForm="True" VisibleIndex="1" Width="17%" ReadOnly="True">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                                        
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="No. Pendaftaran Aset" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="12%" ReadOnly="True">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AIRMI_Desc" ShowInCustomizationForm="True" VisibleIndex="3" Width="23%" ReadOnly="True">
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="Tarikh Terimaan" FieldName="AIRMI_ReceivedDate" ShowInCustomizationForm="True" VisibleIndex="4" Width="8%" ReadOnly="True" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="AIRMI_PurchasePrice" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Harga Perolehan Asal" ReadOnly="True" Width="8%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle>  
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Jumlah Susutnilai Terkumpul" FieldName="TotalDepreciation" ShowInCustomizationForm="True" VisibleIndex="6" Width="8%" ReadOnly="True" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Susutnilai Bulan Ini" FieldName="CurrMonthDepreciation" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="8%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nilai Buku Bersih" FieldName="NettValue" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="8%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Susutnilai Tahunan" FieldName="AIA_Percentage" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="8%" PropertiesTextEdit-DisplayFormatString="n">
<PropertiesTextEdit DisplayFormatString="n"></PropertiesTextEdit>

                                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Bottom" Wrap="True" />
                                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="AIA_AssetInvType" FieldName="AIA_AssetInvType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowDragDrop="False" AllowFocusedRow="True" AllowSort="False" AutoExpandAllGroups="True" />
                                                <SettingsPager PageSize="1000" Visible="False">
                                                </SettingsPager>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Styles>
                                                    <AlternatingRow Enabled="True">
                                                    </AlternatingRow>
                                                </Styles>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="SusutNilaiDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" SelectCommand="SP_ExecOrLoadSusutNilai" SelectCommandType="StoredProcedure" OnSelecting="SusutNilaiDs_Selecting" OnSelected="SusutNilaiDs_Selected">
                                                <SelectParameters>
                                                    <asp:Parameter Direction="Output" Name="ExecType" Type="Int32" />
                                                    <asp:Parameter Direction="Output" Name="PrevYear" Type="Int32" />
                                                    <asp:Parameter Direction="Output" Name="PrevMonth" Type="Int32"/>
                                                    <asp:Parameter Direction="Output" Name="CurrYear" Type="Int32"/>
                                                    <asp:Parameter Direction="Output" Name="CurrMonth" Type="Int32" />
                                                    <asp:Parameter Direction="Input" Name="ProcessIdFormScreen" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
             </td>
            <td style="width:20%; vertical-align:top; text-align:left; padding-top:10px;">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Rujukan">
                            <Items>
                                <dx:LayoutItem Caption="No. Rujukan">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="AIDH_ProcessId" ClientInstanceName="AIDH_ProcessId" EnableClientSideAPI="true" runat="server" ClientEnabled="False">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tarikh">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="AIDH_ExecutedDate" ClientInstanceName="AIDH_ExecutedDate" EnableClientSideAPI="true" runat="server" ClientEnabled="False" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
                </dx:ASPxFormLayout>
             </td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>



<dx:ASPxTextBox ID="txtStopGo" runat="server" ClientInstanceName="txtStopGo" ClientVisible="False" EnableClientSideAPI="True" Text="0" Width="170px">
</dx:ASPxTextBox>




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


















<dx:ASPxCallbackPanel ID="cbp_SavePost" runat="server" ClientInstanceName="cbp_SavePost" ClientVisible="False" OnCallback="cbp_SavePost_Callback" Width="200px" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_SavePost_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>



















<dx:ASPxPopupControl ID="popupSearch" runat="server" AllowDragging="True" ClientInstanceName="popupSearch" EnableClientSideAPI="True" HeaderText="Carian Aduan Kerosakan" MaxHeight="550px" MinHeight="450px" MinWidth="650px" Modal="True" CloseAnimationType="Fade" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxGridView ID="GridSearch" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSearch" DataSourceID="SearchDs" EnableCallbackAnimation="True" KeyFieldName="AIDH_ProcessId" Width="100%" OnCustomCallback="GridSearch_CustomCallback" OnHtmlDataCellPrepared="GridSearch_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AIDH_RowId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIDH_ProcessId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Susutnilai Oleh" FieldName="AIDH_ExecutedBy" ShowInCustomizationForm="True" VisibleIndex="2" Width="50%" ReadOnly="True">
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="AIDH_ExecutedBy" EnableClientSideAPI="true" runat="server" Text="ASPxHyperLink">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tarikh Susutnilai" FieldName="AIDH_ExecutedDate" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
<PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>

                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Tahun" FieldName="AIDH_Year" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bulan" FieldName="AIDH_Month" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%" ReadOnly="True">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="AIDH_Post" ShowInCustomizationForm="True" VisibleIndex="6" Width="15%" ReadOnly="True">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>   
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMSDbConnectionString %>" SelectCommand="SELECT * FROM [V_AssetInventory_DepreciationHeader] ORDER BY [AIDH_RowId] DESC"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>




















