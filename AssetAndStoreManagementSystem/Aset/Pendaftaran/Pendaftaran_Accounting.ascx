<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran_Accounting.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.Pendaftaran.Pendaftaran_Accounting" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_AI_Accounting_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        { }
        else
        {
            if (s.cpMode.toString() == 'LOAD')
            {
                if (Accounting_EditMode.GetText() == '0') {
                    EnableDisableAccountingForm('false');
                }
                else
                    EnableDisableAccountingForm('true');
            }
            else
            {
                ManageMainRibbonUtamaTab('true', 'false', 'false', 'false', 'false', 'false', 'true', 'false', 'true', 'true');
                Accounting_EditMode.SetText('0');
                EnableDisableAccountingForm('false');
                popupMsg_Label.SetText('Maklumat akaun aset telah dikemaskini dengan jayanya.');
                popupMsg.Show();
            }
        }
    }   

    function EnableDisableAccountingForm(truefalse)
    {
        if(truefalse == 'true')
        {
            AIA_Percentage.SetEnabled(true);
            AIA_Method.SetEnabled(true);
            AIA_MinValue.SetEnabled(true);
            AIA_AssetAccount.SetEnabled(true);
            AIA_DepreciationAccount.SetEnabled(true);
            AIA_CollectiveDepreciationAccount.SetEnabled(true);
            AIA_GainAccount.SetEnabled(true);
            AIA_LossAccount.SetEnabled(true);
        }
        else
        {
            AIA_Percentage.SetEnabled(false);
            AIA_Method.SetEnabled(false);
            AIA_MinValue.SetEnabled(false);
            AIA_AssetAccount.SetEnabled(false);
            AIA_DepreciationAccount.SetEnabled(false);
            AIA_CollectiveDepreciationAccount.SetEnabled(false);
            AIA_GainAccount.SetEnabled(false);
            AIA_LossAccount.SetEnabled(false);
        }
    }
</script>

<dx:ASPxCallbackPanel ID="cbp_AI_Accounting" runat="server" ClientInstanceName="cbp_AI_Accounting" EnableCallbackAnimation="True" OnCallback="cbp_AI_Accounting_Callback" ShowLoadingPanel="False" ShowLoadingPanelImage="False" Width="100%">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_AI_Accounting_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout6" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Susutnilai" ColCount="2" Width="40%">
                <Items>
                    <dx:LayoutItem Caption="Kos Aset">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="AIRMI_PurchasePrice" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientEnabled="False" ClientInstanceName="AIRMI_PurchasePrice">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kadar Susutnilai Tahunan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="AIA_Percentage" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientInstanceName="AIA_Percentage">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Kaedah Susutnilai">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="AIA_Method" runat="server" EnableClientSideAPI="True" Width="100%" ClientInstanceName="AIA_Method" DataSourceID="DepDs" TextField="Depre_Desc" ValueField="Depre_Id" ValueType="System.Int32">
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="DepDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_MasterConnectionString %>" SelectCommand="SELECT * FROM [MasterSusutNilaiType] ORDER BY [Depre_Desc]"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nilai Minimum">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="AIA_MinValue" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientInstanceName="AIA_MinValue">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Susutnilai Tahun Sebelum">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="DepreciationValuePrevYear" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientEnabled="False" ClientInstanceName="DepreciationValuePrevYear">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Susutnilai Tahun Semasa">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="DepreciationValueCurrYear" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientEnabled="False" ClientInstanceName="DepreciationValueCurrYear">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Susutnilai Bulan Sebelum">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="DepreciationValuePrevMonth" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientEnabled="False" ClientInstanceName="DepreciationValuePrevMonth">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Nilai Buku Bersih">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="NettValue" runat="server" DecimalPlaces="2" DisplayFormatString="n" EnableClientSideAPI="True" Number="0" RightToLeft="True" Width="100%" ClientEnabled="False" ClientInstanceName="NettValue">
                                    <SpinButtons ShowIncrementButtons="False">
                                    </SpinButtons>
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Maklumat Akaun" ColCount="2" Width="60%">
                <Items>
                    <dx:LayoutItem Caption="Akaun Aset" Width="50%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="AIA_AssetAccount" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIA_AssetAccount" DataSourceID="AssetAccDs" EnableClientSideAPI="True" KeyFieldName="glac_account" Width="100%" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Akaun" FieldName="glac_account" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                            <Settings AutoFilterCondition="Contains" />
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                             <Settings AutoFilterCondition="Contains" />
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(500);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="AssetAccDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="AssetAccDs_Selecting" SelectCommand="SP_AssetRegistrationScreen_GetAllSagaAccounts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:EmptyLayoutItem Width="50%">
                    </dx:EmptyLayoutItem>
                    <dx:LayoutItem Caption="Akaun Susutnilai">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="AIA_DepreciationAccount" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIA_DepreciationAccount" DataSourceID="DepAccDs" EnableClientSideAPI="True" KeyFieldName="glac_account" Width="100%" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Akaun" FieldName="glac_account" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                            <Settings AutoFilterCondition="Contains" />
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                             <Settings AutoFilterCondition="Contains" />
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(500);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="DepAccDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="DepAccDs_Selecting" SelectCommand="SP_AssetRegistrationScreen_GetAllSagaAccounts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Akaun Susutnilai Terkumpul">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="AIA_CollectiveDepreciationAccount" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIA_CollectiveDepreciationAccount" DataSourceID="DepCumDs" EnableClientSideAPI="True" KeyFieldName="glac_account" Width="100%" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Akaun" FieldName="glac_account" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                            <Settings AutoFilterCondition="Contains" />
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                             <Settings AutoFilterCondition="Contains" />
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(500);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="DepCumDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="DepCumDs_Selecting" SelectCommand="SP_AssetRegistrationScreen_GetAllSagaAccounts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Akaun Keuntungan Jualan Aset">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="AIA_GainAccount" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIA_GainAccount" DataSourceID="GainDs" EnableClientSideAPI="True" KeyFieldName="glac_account" Width="100%" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                   <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Akaun" FieldName="glac_account" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                            <Settings AutoFilterCondition="Contains" />
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                             <Settings AutoFilterCondition="Contains" />
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(500);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="GainDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="GainDs_Selecting" SelectCommand="SP_AssetRegistrationScreen_GetAllSagaAccounts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Akaun Kerugian Jualan Aset">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxGridLookup ID="AIA_LossAccount" runat="server" AutoGenerateColumns="False" ClientInstanceName="AIA_LossAccount" DataSourceID="LossDs" EnableClientSideAPI="True" KeyFieldName="glac_account" Width="100%" TextFormatString="{0}">
                                    <GridViewProperties>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Kod Akaun" FieldName="glac_account" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="30%">
                                            <Settings AutoFilterCondition="Contains" />
                                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle>                                            
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="glac_desc" ShowInCustomizationForm="True" VisibleIndex="1" Width="70%">
                                             <Settings AutoFilterCondition="Contains" />
                                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                            <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True"></CellStyle> 
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <GridViewStyles>
                                        <AlternatingRow Enabled="True">
                                        </AlternatingRow>
                                    </GridViewStyles>
                                    <ClientSideEvents Init="function(s, e) {
	s.GetGridView().SetWidth(500);
}" />
                                </dx:ASPxGridLookup>
                                <asp:SqlDataSource ID="LossDs" runat="server" ConnectionString="<%$ ConnectionStrings:AMS_SAGAConnectionString %>" OnSelecting="LossDs_Selecting" SelectCommand="SP_AssetRegistrationScreen_GetAllSagaAccounts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutItem Caption="UniqueId" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="AIA_UniqueId" ClientInstanceName="AIA_UniqueId" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
<dx:ASPxTextBox ID="Accounting_EditMode" ClientInstanceName="Accounting_EditMode" EnableClientSideAPI="true" ClientVisible="false" runat="server" Width="170px" Text="0"></dx:ASPxTextBox>






