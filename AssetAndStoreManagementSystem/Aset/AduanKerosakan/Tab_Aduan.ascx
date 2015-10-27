<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tab_Aduan.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.AduanKerosakan.Tab_Aduan" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<link href="../../Public/Css/FormsCss.css" rel="stylesheet" />

<script>
    function EnableDisableForm(truefalse)
    {
        if (truefalse == 'true')
        {
            LinkSearchAssetInv.SetEnabled(true);
            AK_DamageNotes.SetEnabled(true);
            AK_OtherNotes.SetEnabled(true);
        }
        else
        {
            LinkSearchAssetInv.SetEnabled(false);
            AK_DamageNotes.SetEnabled(false);
            AK_OtherNotes.SetEnabled(false);
        }
    }

    function SelectAssetInv()
    {
        GridSearchAssetInv.GetSelectedFieldValues('AssInvUniqueId', ProceedSelectingAssetInv);
    }

    function ProceedSelectingAssetInv(Values)
    {
        if (Values.length > 0) {
            
            LoadingPanel.SetText('Sistem memasukkan rekod aset alih yang telah anda pilih.  Sila tunggu sebentar..');
            LoadingPanel.Show();
            cbp_TabAduan.PerformCallback('ASSETINVSELECTED');
        }
        else
        {
            popupMsg_Label.SetText('Tiada rekod aset alih yang telah dipilih.<br>Sila semak dan cuba sekali lagi.');
            popupMsg.Show();
            popupMsg_BtnOk.Focus();
        }
    }

    function LookupAssetInv()
    {
        popupSearchAssetInv.SetWidth(screen.width * 0.85);
        popupSearchAssetInv.Show();
        GridSearchAssetInv.PerformCallback();
    }

    function cbp_TabAduan_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
            popupMsg_BtnOk.Focus()
        }
        else
        {
            if (s.cpMode.toString() == 'ADD')
            {
                
                ManageMainRibbonUtamaTab('false', 'false', 'true', 'true', 'false', 'true', 'false', 'false', 'false', 'true');
                popupAttachImage_CallerName.SetText('ADUAN_KEROSAKAN');
                popupAttachImage_ProcessId.SetText(AK_ProcessId.GetText());
                MainRibbon.GetItemByName("Gambar").SetEnabled(true);
                Ref_RefProcessId.SetText(AK_ProcessId.GetText());
                cbp_AKRef.PerformCallback();
            }
            else if (s.cpMode.toString() == 'ASSETINVSELECTED')
            {
                popupSearchAssetInv.Hide();
            }
            else if (s.cpMode.toString() == 'LOAD')
            {
                //pegawai asset
                var PegawaiAsetTab = PageControl.GetTab(1);
                PegawaiAsetTab.SetVisible(true);
                
                TabPA_ProcessId.SetText(AK_ProcessId.GetText());
                TabPA_EditMode.SetText('0');
                cbp_PA.PerformCallback();
                

                //aliran kerja
                var AliranKerjaTab = PageControl.GetTab(2);
                AliranKerjaTab.SetVisible(true);
                AK_ProcessId_ProcessId.SetText(AK_ProcessId.GetText());
                GridAkWorkflow.PerformCallback();

                //ref section
                Ref_RefProcessId.SetText(AK_ProcessId.GetText());
                cbp_AKRef.PerformCallback();

                EnableDisableForm('false');
                PageControl.SetActiveTabIndex(0);
                popupSearchAduanKerosakan.Hide();


                if (AK_Status.GetText() == '2') //Belum Dihantar
                {
                    ManageMainRibbonUtamaTab('true', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                    popupAttachImage_CallerName.SetText('ADUAN_KEROSAKAN');
                    popupAttachImage_ProcessId.SetText(AK_ProcessId.GetText());                   
                }
                else if (AK_Status.GetText() == '15' || AK_Status.GetText() == '4' || AK_Status.GetText() == '3')  //15: Pegesahan Pegawai Aset    4:Kuiri Ketua PTJ   3: Kelulusan Ketua PTJ
                {
                    cbp_AKworkflow.PerformCallback();
                }
                else if (AK_Status.GetText() == '9')  //9: Lulus
                { ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true'); }

                Ref_RefProcessId.SetText(AK_ProcessId.GetText());
                cbp_AKRef.PerformCallback();
            }
            else if (s.cpMode.toString() == 'SAVE')
            {
                ManageMainRibbonUtamaTab('true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'true');
                EnableDisableForm('false');
                popupMsg_Label.SetText('Rekod aduan kerosakan telah berjaya disimpan.');
                popupMsg.Show();
                popupMsg_BtnOk.Focus()
                cbp_Slider.PerformCallback();
                Ref_RefProcessId.SetText(AK_ProcessId.GetText());
                cbp_AKRef.PerformCallback();
            }
            else if (s.cpMode.toString() == 'POST')
            {
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                EnableDisableForm('false');
                cbp_Slider.PerformCallback();
                Ref_RefProcessId.SetText(AK_ProcessId.GetText());
                cbp_AKRef.PerformCallback();

                if (s.cpMailError.toString() == '') {
                    popupMsg_Label.SetText('Rekod aduan kerosakan telah dihantar kepada ' + s.cpPegawaiAsetName.toString() + ' untuk pengesahan.');
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus()
                }
                else {
                    popupMsg_Label.SetText('Rekod aduan kerosakan telah berjaya dihantar tetapi sistem gagal memghantar emel notifikasi kepada pegawai aset.<br>Masalah: ' + s.cpMailError.toString());
                    popupMsg.Show();
                    popupMsg_BtnOk.Focus()
                }                
                
            }
        }
    }
</script>

<dx:ASPxCallbackPanel ID="cbp_TabAduan" runat="server" ClientInstanceName="cbp_TabAduan" EnableClientSideAPI="True" OnCallback="cbp_TabAduan_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_TabAduan_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="AkuanForm" runat="server" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pengadu" ColCount="2" Width="100%">
                <Items>
                    <dx:LayoutItem Caption="Nama" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CreatorName" runat="server" ClientEnabled="False" ClientInstanceName="CreatorName" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CreatorPTJ" runat="server" ClientEnabled="False" ClientInstanceName="CreatorPTJ" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat Emel" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CreatorEmail" runat="server" ClientEnabled="False" ClientInstanceName="CreatorEmail" EnableClientSideAPI="True" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Telefon" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CreatorTelephone" runat="server" ClientEnabled="False" ClientInstanceName="CreatorTelephone" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="AK_CreatedByEmpId" runat="server" ClientInstanceName="AK_CreatedByEmpId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="AK_ProcessId" runat="server" ClientInstanceName="AK_ProcessId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="AK_Status" runat="server" ClientInstanceName="AK_Status" ClientVisible="False" EnableClientSideAPI="True" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Aduan Kerosakan" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Maklumat Aset" ColCount="3" GroupBoxDecoration="HeadingLine" Width="100%">
                        <Items>
                            <dx:LayoutItem ColSpan="3" ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxHyperLink ID="LinkSearchAssetInv" runat="server" ClientInstanceName="LinkSearchAssetInv" CssClass="myHyperlink" EnableClientSideAPI="True" EnableTheming="False" Text="Carian Aset" NavigateUrl="javascript: LookupAssetInv();">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="No. Siri Pendaftaran" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="AK_AssetInvRegNumber" runat="server" ClientEnabled="False" ClientInstanceName="AK_AssetInvRegNumber" EnableClientSideAPI="True" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Keterangan Aset" ColSpan="2" Width="75%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="AK_AssetInvDesc" runat="server" ClientEnabled="False" ClientInstanceName="AK_AssetInvDesc" EnableClientSideAPI="True" Rows="3" Width="50%">
                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Ketegori" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="CatName" runat="server" ClientEnabled="False" ClientInstanceName="CatName" EnableClientSideAPI="True" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Sub-Kategori" ColSpan="2" Width="75%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="SubCatName" runat="server" ClientEnabled="False" ClientInstanceName="SubCatName" EnableClientSideAPI="True" Width="50%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="AK_AssetInvCategory" ShowCaption="False" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="AK_AssetInvCategory" runat="server" ClientInstanceName="AK_AssetInvCategory" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="AK_AssetInvSubCategory" ColSpan="2" ShowCaption="False" Width="75%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="AK_AssetInvSubCategory" runat="server" ClientInstanceName="AK_AssetInvSubCategory" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutGroup ColCount="3" ColSpan="3" GroupBoxDecoration="None" Width="100%">
                                <GroupBoxStyle>
                                    <Border BorderStyle="None" />
                                </GroupBoxStyle>
                                <Items>
                                    <dx:LayoutItem Caption="Nama Kakitangan" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AssetInvOwnerName" runat="server" ClientEnabled="False" ClientInstanceName="AssetInvOwnerName" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Pusat Tanggungjawab" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="PTJ_Name" runat="server" ClientEnabled="False" ClientInstanceName="PTJ_Name" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Pusat, Bahagian &amp; Jabatan" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="DeptName" runat="server" ClientEnabled="False" ClientInstanceName="DeptName" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Bangunan &amp; Blok" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="BuildingName" runat="server" ClientEnabled="False" ClientInstanceName="BuildingName" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Aras" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="FloorName" runat="server" ClientEnabled="False" ClientInstanceName="FloorName" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Ruang" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="SpaceName" runat="server" ClientEnabled="False" ClientInstanceName="SpaceName" EnableClientSideAPI="True" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvEmployeName" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvEmployeName" runat="server" ClientInstanceName="AK_AssetInvEmployeName" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvPtj" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvPtj" runat="server" ClientInstanceName="AK_AssetInvPtj" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvDept" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvDept" runat="server" ClientInstanceName="AK_AssetInvDept" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvBuilding" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvBuilding" runat="server" ClientInstanceName="AK_AssetInvBuilding" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvFloor" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvFloor" runat="server" ClientInstanceName="AK_AssetInvFloor" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvSpace" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvSpace" runat="server" ClientInstanceName="AK_AssetInvSpace" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvUniqueId" ShowCaption="False" Width="33%">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvUniqueId" runat="server" ClientInstanceName="AK_AssetInvUniqueId" EnableClientSideAPI="True" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="AK_AssetInvType" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="AK_AssetInvType" runat="server" ClientInstanceName="AK_AssetInvType" Width="170px" ClientVisible="False">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                                <ParentContainerStyle>
                                    <Paddings Padding="0px" />
                                    <Border BorderStyle="None" />
                                </ParentContainerStyle>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Perihal Kerosakan" ColCount="2" GroupBoxDecoration="HeadingLine" Width="100%">
                        <Items>
                            <dx:LayoutItem ColSpan="2" ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="width:50%; margin-left:auto; margin-right:auto;">
                                            <dx:ASPxCallbackPanel ID="cbp_Slider" runat="server" EnableCallbackAnimation="True" EnableClientSideAPI="True" OnCallback="cbp_Slider_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%" ClientInstanceName="cbp_Slider">
                                                <SettingsLoadingPanel Enabled="False" ShowImage="False" />
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxImageSlider ID="Slider" runat="server" DataSourceID="SliderDs" Width="100%" ImageUrlField="ImageFileSystemName" NameField="ImageFileUserName" TextField="Notes">
                                                            <SettingsAutoGeneratedImages ImageCacheFolder="~\Thumb\" ImageHeight="300px" ImageWidth="300px" ThumbnailWidth="60px" />
                                                        </dx:ASPxImageSlider>
                                                        <asp:SqlDataSource ID="SliderDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_AttachmentsConnectionString %>" OnSelecting="SliderDs_Selecting" SelectCommand="SP_ImageAttachments_LoadImages" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="xxx" Name="ProcessId" Type="String" />
                                                                <asp:Parameter DefaultValue="xxx" Name="PhysicalPath" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Perihal Kerosakan" Width="50%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="AK_DamageNotes" runat="server" ClientInstanceName="AK_DamageNotes" EnableClientSideAPI="True" Rows="3" Width="100%">
                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Catatan" Width="50%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="AK_OtherNotes" runat="server" ClientInstanceName="AK_OtherNotes" EnableClientSideAPI="True" Rows="3" Width="100%">
                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <Paddings Padding="0px" />
        <Border BorderStyle="None" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
<dx:ASPxPopupControl ID="popupSearchAssetInv" runat="server" AllowDragging="True" ClientInstanceName="popupSearchAssetInv" EnableClientSideAPI="True" HeaderText="Carian Aset Alih" MaxHeight="650px" MinHeight="450px" MinWidth="650px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowFooter="True">
    <HeaderImage Url="~/Public/Images/DialogBox/Lookup.png">
    </HeaderImage>
    <FooterContentTemplate>
         <div style="width:100%; padding:8px 0px 8px 0px; text-align:center; margin-left:auto; margin-right:auto;">
             <dx:ASPxButton ID="btnWorkflowProceed" runat="server" AutoPostBack="False" Text="Ok" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	SelectAssetInv();
}" />
             </dx:ASPxButton>
             &nbsp;
              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Batal" Theme="SoftOrange" Width="100px">
                 <ClientSideEvents Click="function(s, e) {
	popupSearchAssetInv.Hide();
}" />
             </dx:ASPxButton>
        </div>
    </FooterContentTemplate>
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <dx:ASPxGridView ID="GridSearchAssetInv" runat="server" ClientInstanceName="GridSearchAssetInv" Width="100%" AutoGenerateColumns="False" DataSourceID="SearchDs" KeyFieldName="AssInvUniqueId" EnableCallbackAnimation="True" OnCustomCallback="GridSearchAssetInv_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssInvUniqueId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Siri Pendaftaran" FieldName="AssInvRegNum" ShowInCustomizationForm="True" VisibleIndex="2" Width="12%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="AssInvDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="11%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Pesanan Belian" FieldName="AIRMI_PoNumber" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. GRN" FieldName="AIRMI_GRNnumber" ShowInCustomizationForm="True" VisibleIndex="5" Width="7%">
                 <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                 <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_PtjId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_DeptId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_BuildId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_FloorId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_SpaceID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PH_EmpId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Penempatan Semasa" ShowInCustomizationForm="True" VisibleIndex="13">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Nama Kakitangan" FieldName="EmployeeName" ShowInCustomizationForm="True" VisibleIndex="0" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat Tanggungjawab" FieldName="PTJ_Name" ShowInCustomizationForm="True" VisibleIndex="1" Width="13%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pusat, Bahagian dan Jabatan" FieldName="Dept_Name" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Bangunan dan Blok" FieldName="Build_Name" ShowInCustomizationForm="True" VisibleIndex="3" Width="9%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Aras" FieldName="Floor_Name" ShowInCustomizationForm="True" VisibleIndex="4" Width="7%">
                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ruang" FieldName="Space_Name" ShowInCustomizationForm="True" VisibleIndex="5" Width="9%">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                        
                    </dx:GridViewDataTextColumn>
                </Columns>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
            </dx:GridViewBandColumn>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="2%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" Wrap="True" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetInvType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_Cat" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AIRMI_SubCat" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CatName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SubCatName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" />
        <Settings ShowFilterRow="True" />
        <SettingsLoadingPanel Mode="Disabled" ShowImage="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Styles>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
        <asp:SqlDataSource ID="SearchDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_DBConnectionString %>" SelectCommand="SELECT * FROM [V_LookupAssetAndInventoryLatestLocation] ORDER BY [AssInvRegNum]"></asp:SqlDataSource>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>

