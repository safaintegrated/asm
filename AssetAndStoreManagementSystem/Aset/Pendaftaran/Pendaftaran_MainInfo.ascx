<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_MainInfo.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_MainInfo" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<dx:ASPxCallbackPanel ID="cbp_MainInformation" runat="server" ClientInstanceName="cbp_MainInformation" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
<SettingsLoadingPanel Enabled="False" ShowImage="False"></SettingsLoadingPanel>
    <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="4" Width="100%">
        <Items>
            <dx:LayoutGroup Width="70%" Caption="Maklumat Aset Alih" ColSpan="3" RowSpan="2">
                <Items>
                    <dx:LayoutGroup ColCount="2" GroupBoxDecoration="None" ShowCaption="False" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Keterangan" Width="50%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="ASPxFormLayout1_E2" runat="server" Height="60px" Width="100%">
                                            <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Maklumat Spesifikasi" Width="50%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="ASPxFormLayout1_E33" runat="server" Height="60px" Width="100%">
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup ColCount="3" GroupBoxDecoration="None" RowSpan="3" ShowCaption="False" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Kategori" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E4" runat="server" DataSourceID="CatDs" TextField="CatName" ValueField="CatId" ValueType="System.Int32" Width="100%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="CatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [CatId], [CatName] FROM [Category] ORDER BY [CatName]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Jenama" Width="30%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="No. Siri Pembuat" Width="15%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Sub-Kategori" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E5" runat="server" DataSourceID="SubCatDs" TextField="SubCatName" ValueField="CatId" ValueType="System.Int32" Width="100%">
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="CatId" Visible="False" />
                                                <dx:ListBoxColumn Caption="Sub-Kategori" FieldName="SubCatName" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SubCatDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [CatId], [SubCatName] FROM [SubCategory] ORDER BY [SubCatName]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Model" Width="30%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tarikh Mula Jaminan" Width="10%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="ASPxFormLayout1_E15" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Jenis" Width="25%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" Width="100%">
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Buatan" Width="30%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tarikh Tamat Jaminan" Width="10%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="ASPxFormLayout1_E16" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Pendaftaran" Width="30%" GroupBoxDecoration="Box" ShowCaption="True" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="Jenis Harta" Width="70%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E12" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Width="30%" RowSpan="2" ShowCaption="False" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" CssClass="PopupMessageLabel">
                                <div style="text-align:right; width:100%">
                                    <dx:ASPxImage ID="ASPxFormLayout1_E11" runat="server" ImageUrl="~/Aset/Barcodes/2XWB2T3DRA0Logo.png" ShowLoadingImage="True" Width="50%">
                                    </dx:ASPxImage>
                                </div>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No Siri Pendaftaran" Width="70%" Name="No Siri Pendaftaran">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Status" Width="70%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kod Nasional" Width="30%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Width="80%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutGroup ColCount="2" ColSpan="2" GroupBoxDecoration="None" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Perlu Penyelenggaraan" Height="50px" Width="30%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxCheckBox ID="ASPxFormLayout1_E9" runat="server" CheckState="Unchecked">
                                        </dx:ASPxCheckBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Left" VerticalAlign="Middle" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Boleh Dipinjamkan" Height="50px" Width="70%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxCheckBox ID="ASPxFormLayout1_E18" runat="server" CheckState="Unchecked">
                                        </dx:ASPxCheckBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Left" VerticalAlign="Middle" />
                            </dx:LayoutItem>
                        </Items>
                        <ParentContainerStyle>
                            <Paddings Padding="0px" />
                            <Border BorderStyle="None" />
                        </ParentContainerStyle>
                    </dx:LayoutGroup>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Gambar" RowSpan="5" Width="30%">
                <Items>
                    <dx:LayoutItem Caption="Gambar" HorizontalAlign="Right" Name="Gambar" ShowCaption="False" Width="30%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxImageSlider ID="Slider" runat="server" Height="320px" Width="100%">
                                    <SettingsAutoGeneratedImages EnableImageAutoGeneration="True" ImageCacheFolder="~\Thumb\" ImageHeight="100px" ImageWidth="100px" ThumbnailWidth="60px" />
                                </dx:ASPxImageSlider>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Perolehan" ColSpan="3" Width="70%" ColCount="9">
                <Items>
                    <dx:LayoutItem Caption="Nama Pembekal" ColSpan="4" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E20" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kaedah Perolehan" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ASPxFormLayout1_E30" runat="server" DataSourceID="ProcureMethodDs" TextField="ProcurementMethodName" ValueField="ProcurementMethodId" ValueType="System.Int32" Width="100%">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="ProcurementMethodId" Visible="False" />
                                        <dx:ListBoxColumn Caption="Kaedah Perolehan" FieldName="ProcurementMethodName" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="ProcureMethodDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT [ProcurementMethodId], [ProcurementMethodName] FROM [ProcurementMethod] ORDER BY [ProcurementMethodName]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Pesanan Tempatan" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E22" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh LO" Width="10%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E23" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Alamat Pembekal" ColSpan="4" RowSpan="2" Width="40%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="ASPxFormLayout1_E21" runat="server" Height="71px" Width="100%">
                                    <ClientSideEvents Init="function(s, e) {
	s.GetInputElement().style.overflowY='hidden';
}" />
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Inbois" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E25" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Baucar" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E26" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh Baucar" Width="10%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E27" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. GRN" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E28" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No. Nota Penghantaran" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E29" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tarikh GRN" Width="10%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E24" runat="server" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem ColSpan="4" Width="60%">
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Unit Pengukuran" ColSpan="2" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="ASPxFormLayout1_E31" runat="server" ValueType="System.Int32" Width="100%">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="UomId" Visible="False" />
                                        <dx:ListBoxColumn Caption="Unit Pengukuran" FieldName="UomDescription" />
                                    </Columns>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kuantiti" Width="10%" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="ASPxFormLayout1_E32" runat="server" DisplayFormatString="n0" HorizontalAlign="Right" Number="0" Width="70%">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nilai Perolehan Asal" Width="25%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="ASPxFormLayout1_E1" runat="server" DisplayFormatString="n" HorizontalAlign="Right" Number="0" Width="100%">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem ColSpan="9" Width="100%">
                    </dx:EmptyLayoutItem>
                    <dx:EmptyLayoutItem ColSpan="9">
                    </dx:EmptyLayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

