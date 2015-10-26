<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HasilSiasatan_Controller.ascx.cs" Inherits="AssetAndStoreManagementSystem.Aset.LaporanKehilangan.HasilSiasatan_Controller" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script>
    function cbp_HPP_EndCallback(s, e)
    {
        LoadingPanel.Hide();

        if (s.cpErrMsg.toString() != '')
        {
            popupMsg_Label.SetText(s.cpErrMsg.toString());
            popupMsg.Show();
        }
        else
        {
            if (s.cpMode.toString() == 'LOAD')
            {
                if (HPP_EditMode.GetText() == '0')
                    EnableDisableHPPForm('false');
                else
                    EnableDisableHPPForm('true');
            }
            else if (s.cpMode.toString() == 'POST')
            {
                ManageMainRibbonUtamaTab('false', 'true', 'false', 'false', 'false', 'false', 'true', 'true', 'true', 'true');
                EnableDisableHPPForm('false');
                cbp_Ref.PerformCallback('REF');

                if (s.cpMailErr.toString() != '')
                {
                    popupMsg_Label.SetText(s.cpMailErr.toString());
                    popupMsg.Show();
                }
                else
                {
                    popupMsg_Label.SetText('Laporan Pegawai Penyisat telah berjaya dihantar.');
                    popupMsg.Show();
                }
            }
        }
    }

    function EnableDisableHPPForm(truefalse)
    {
        if (truefalse == 'true') {
            LKIR_ReportDate.SetEnabled(true);
            LKIR_ReportSummary.SetEnabled(true);
        }
        else {
            LKIR_ReportDate.SetEnabled(false);
            LKIR_ReportSummary.SetEnabled(false);
        }
    }
</script>
<dx:ASPxCallbackPanel ID="cbp_HPP" runat="server" ClientInstanceName="cbp_HPP" EnableCallbackAnimation="True" OnCallback="cbp_HPP_Callback" Width="100%" ShowLoadingPanel="False" ShowLoadingPanelImage="False">
    <SettingsLoadingPanel Enabled="False" ShowImage="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	cbp_HPP_EndCallback(s, e);
}" />
    <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Width="100%">
        <Items>
            <dx:LayoutGroup Caption="Maklumat Pegawai Penyiasat" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Nama" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="EmployeeName" ClientInstanceName="EmployeeName" runat="server" ClientEnabled="False" CssClass="TextBoxPusatTanggungjawab" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Pusat Tanggungjawab" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="PTJ_Name" ClientInstanceName="PTJ_Name" runat="server" ClientEnabled="False" CssClass="TextBoxPusatTanggungjawab" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="No Telefon" Width="15%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKIR_Telephone" ClientInstanceName="LKIR_Telephone" runat="server" ClientEnabled="False" CssClass="TextBoxForTel" EnableClientSideAPI="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="LKIR_PtjId" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKIR_PtjId" ClientInstanceName="LKIR_PtjId" ClientVisible="false" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="LKIR_InvestigratorEmpId" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="LKIR_InvestigratorEmpId" ClientInstanceName="LKIR_InvestigratorEmpId" ClientVisible="false" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Hasil Siasatan" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Tarikh Laporan" Width="85%">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="LKIR_ReportDate" ClientInstanceName="LKIR_ReportDate" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" runat="server" CssClass="DateEditor" EnableClientSideAPI="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ringkasan Laporan">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo ID="LKIR_ReportSummary" ClientInstanceName="LKIR_ReportSummary" runat="server" EnableClientSideAPI="True" Rows="4" Width="100%">
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
        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
        <SettingsItemHelpTexts HorizontalAlign="Left" VerticalAlign="Top" />
    </dx:ASPxFormLayout>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>

<dx:ASPxTextBox ID="HPP_ProcessId" EnableClientSideAPI="true" ClientInstanceName="HPP_ProcessId" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="HPP_Rev" EnableClientSideAPI="true" ClientInstanceName="HPP_Rev" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="HPP_EditMode" EnableClientSideAPI="true" ClientInstanceName="HPP_EditMode" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>
<dx:ASPxTextBox ID="HPP_RefNumber" EnableClientSideAPI="true" ClientInstanceName="HPP_RefNumber" ClientVisible="false" runat="server" Width="170px">
</dx:ASPxTextBox>


