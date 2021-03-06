﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupStoreSystem.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.PopupStoreSystem" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<dx:ASPxPopupControl ID="popup_StoreSystem" runat="server" CloseAction="OuterMouseClick"
                         PopupElementID="SysAdminTopDiv;SysAdminDesc_Line1;SysAdminDesc_Line2;SysAdminImage" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" Width="900px" Height="160px" HeaderText="Updatable content" ClientInstanceName="popup_StoreSystem" ShowHeader="False" Modal="True" Font-Names="Myriad Pro" Font-Size="Small">
    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="vertical-align:middle; text-align:left; padding:4px 4px 4px 4px;" colspan="9">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="FAIL INDUK" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink132" runat="server" ImageUrl="~/Public/Images/Screen/Store.png" NavigateUrl="~/FailInduk/Stor/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink131" runat="server" ImageUrl="~/Public/Images/Screen/CategorySubcategory.png" Text="ASPxHyperLink" NavigateUrl="~/FailInduk/KategoriSubkategori/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink137" runat="server" ImageUrl="~/Public/Images/Screen/Stock.png" NavigateUrl="~/Stor/FailIndukStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
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
                <dx:ASPxHyperLink ID="ASPxHyperLink93" runat="server" Text="Stor" NavigateUrl="~/FailInduk/Stor/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink94" runat="server" Text="Kategori &amp; Sub-Kategori" NavigateUrl="~/FailInduk/KategoriSubkategori/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink138" runat="server" NavigateUrl="~/Stor/FailIndukStok/Index.aspx" Target="_blank" Text="Stok">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
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
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="PERMOHONAN &amp; PENDAFTARAN" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink133" runat="server" ImageUrl="~/Public/Images/Screen/Belian.png" NavigateUrl="~/Aset/Belian/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink135" runat="server" ImageUrl="~/Public/Images/Screen/GRN.png" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink99" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Stor/DaftarStok/Index.aspx" Text="ASPxHyperLink" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink100" runat="server" ImageUrl="~/Public/Images/Screen/StockRequest.png" Text="ASPxHyperLink" NavigateUrl="~/Stor/PermohonanStok/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink101" runat="server" ImageUrl="~/Public/Images/Screen/DamageReport.png" Text="ASPxHyperLink" NavigateUrl="~/Stor/PengeluaranKeStorPTJ/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink134" runat="server" Text="Permohonan Belian" NavigateUrl="~/Aset/Belian/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink136" runat="server" Text="Terimaan Barang (GRN)" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink106" runat="server" NavigateUrl="~/Stor/DaftarStok/Index.aspx" Text="Pendaftaran" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink107" runat="server" Text="Permohonan Stok" NavigateUrl="~/Stor/PermohonanStok/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink108" runat="server" Text="Pengeluaran ke Stor PTJ" NavigateUrl="~/Stor/PengeluaranKeStorPTJ/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="9" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Text="PEMERIKSAAN &amp; VERIFIKASI">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink142" runat="server" ImageUrl="~/Public/Images/Screen/InspectionOfficer.png" NavigateUrl="~/Stor/LantikanPegPemeriksa/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink144" runat="server" ImageUrl="~/Public/Images/Screen/InspectionOfficer.png" NavigateUrl="~/Stor/LantikanPegPemverifikasi/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink146" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Stor/PemeriksaanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink148" runat="server" ImageUrl="~/Public/Images/Screen/Inspection.png" NavigateUrl="~/Stor/VerifikasiStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink143" runat="server" NavigateUrl="~/Stor/LantikanPegPemeriksa/Index.aspx" Target="_blank" Text="Lembaga Pemeriksa">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink145" runat="server" NavigateUrl="~/Stor/LantikanPegPemverifikasi/Index.aspx" Target="_blank" Text="Lembaga Pemverifikasi">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink147" runat="server" NavigateUrl="~/Stor/PemeriksaanStok/Index.aspx" Target="_blank" Text="Pemeriksaan Stok">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink149" runat="server" NavigateUrl="~/Stor/VerifikasiStok/Index.aspx" Target="_blank" Text="Verifikasi Stok">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="9" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Bold="True" Font-Names="Myriad Pro" Font-Size="Small" Text="AMBIL ALIH, PELARASAN, PELUPUSAN &amp; HAPUSKIRA">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink129" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PerakuanAmbilAlih/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink150" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PelarasanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink152" runat="server" ImageUrl="~/Public/Images/Screen/Transfer.png" NavigateUrl="~/Stor/PelupusanStok/Index.aspx" Target="_blank" Text="ASPxHyperLink">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink130" runat="server" NavigateUrl="~/Stor/PerakuanAmbilAlih/Index.aspx" Target="_blank" Text="Perakuan Ambil Alih">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink151" runat="server" NavigateUrl="~/Stor/PelarasanStok/Index.aspx" Target="_blank" Text="Pelarasan Stok">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink153" runat="server" NavigateUrl="~/Stor/PelupusanStok/Index.aspx" Target="_blank" Text="Pelupusan">
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