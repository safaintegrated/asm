﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupAssetSystem.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.PopupAssetSystem" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<dx:ASPxPopupControl ID="popup_AssetSystem" runat="server" CloseAction="OuterMouseClick"
                         PopupElementID="SysAdminTopDiv;SysAdminDesc_Line1;SysAdminDesc_Line2;SysAdminImage" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" Width="900px" Height="160px" HeaderText="Updatable content" ClientInstanceName="popup_AssetSystem" ShowHeader="False" Modal="True" Font-Names="Myriad Pro" Font-Size="Small">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="vertical-align:middle; text-align:left; padding:4px 4px 4px 4px;" colspan="9">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="PERMOHONAN DAN PENDAFTARAN" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink36" runat="server" ImageUrl="~/Public/Images/Screen/Belian.png" Text="ASPxHyperLink" NavigateUrl="~/Aset/Belian/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink37" runat="server" ImageUrl="~/Public/Images/Screen/GRN.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink38" runat="server" ImageUrl="~/Public/Images/Screen/AssetRegistration.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink39" runat="server" ImageUrl="~/Public/Images/Screen/AssetRelocation.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink43" runat="server" Text="Permohonan Belian" NavigateUrl="~/Aset/Belian/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink44" runat="server" Text="Terimaan Barang (GRN)">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink45" runat="server" Text="Pendaftaran">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink46" runat="server" Text="Penempatan" NavigateUrl="javascript: OpenSagaConfigWindow();">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="9" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="PENGURUSAN HARTA MODAL" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink50" runat="server" ImageUrl="~/Public/Images/Screen/InspectionOfficer.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink81" runat="server" ImageUrl="~/Public/Images/Screen/PeopleGroup.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink51" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="javascript: OpenAssetOfficerWindow();" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink53" runat="server" ImageUrl="~/Public/Images/Screen/Depreciation.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink52" runat="server" ImageUrl="~/Public/Images/Screen/DamageReport.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink60" runat="server" ImageUrl="~/Public/Images/Screen/Employee.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink87" runat="server" ImageUrl="~/Public/Images/Screen/Employee.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink56" runat="server" Text="Lembaga Pemeriksa">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink84" runat="server" Text="Pelantikan Jawatankuasa Penyiasat">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink57" runat="server" NavigateUrl="javascript: OpenAssetOfficerWindow()" Text="Pemeriksaan">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink59" runat="server" Text="Susutnilai">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink88" runat="server" Text="Aduan Kerosakan">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink61" runat="server" Text="Permohonan Pinjaman">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink83" runat="server" Text="Laporan Kehilangan">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="9" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Text="PELUPUSAN">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink62" runat="server" ImageUrl="~/Public/Images/Screen/InstructionToVerifier.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink63" runat="server" ImageUrl="~/Public/Images/Screen/DestroyAcknowledgement.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink64" runat="server" ImageUrl="~/Public/Images/Screen/PeopleGroup.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink65" runat="server" ImageUrl="~/Public/Images/Screen/Employee.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink66" runat="server" ImageUrl="~/Public/Images/Screen/DestroyCert.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink67" runat="server" ImageUrl="~/Public/Images/Screen/UpdateDestroyedAsset.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink69" runat="server" ImageUrl="~/Public/Images/Screen/Tender.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink70" runat="server" ImageUrl="~/Public/Images/Screen/Employee.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink68" runat="server" ImageUrl="~/Public/Images/Screen/Auction.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink71" runat="server" Text="Arahan Kepada Pegawai Peraku">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink72" runat="server" Text="Perakuan Pelupusan">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink73" runat="server" Text="Lantikan Lembaga Pemeriksa">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink74" runat="server" Text="Laporan Lembaga Pemeriksa">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink75" runat="server" Text="Sijil Penyaksian Pemusnahan Aset Alih">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink76" runat="server" Text="Kemaskini Aset Pelupusan">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink78" runat="server" Text="Kenyataan Tawaran Tender">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink79" runat="server" Text="Kenyataan Tawaran Sebutharga">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink86" runat="server" Text="Kenyataan Jualan Lelong">
                </dx:ASPxHyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="9" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Text="KEHILANGAN DAN HAPUSKIRA">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink82" runat="server" ImageUrl="~/Public/Images/Screen/FinalReportOfLostAsset.png" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink85" runat="server" Text="Laporan Akhir Kehilangan Aset Alih">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;" colspan="3">&nbsp;</td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
    <Border BorderStyle="None" />
</dx:ASPxPopupControl>