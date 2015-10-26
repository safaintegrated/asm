<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupSysAdmin.ascx.cs" Inherits="AssetAndStoreManagementSystem.LamanUtama.PopupSysAdmin" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<dx:ASPxPopupControl ID="popup_SysAdmin" runat="server" CloseAction="OuterMouseClick"
                         PopupElementID="SysAdminTopDiv;SysAdminDesc_Line1;SysAdminDesc_Line2;SysAdminImage" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" Width="700px" Height="160px" HeaderText="Updatable content" ClientInstanceName="popup_SysAdmin" ShowHeader="False" Modal="True" Font-Names="Myriad Pro" Font-Size="Small">
    <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table style="width:100%; vertical-align:top; text-align:left;">
        <tr>
            <td style="vertical-align:middle; text-align:left; padding:4px 4px 4px 4px;" colspan="7">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="PENGURUSAN SISTEM" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" ImageUrl="~/Public/Images/Screen/Organisation.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/Organisasi/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" ImageUrl="~/Public/Images/Screen/SystemUserGroup.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/KumpulanPenggunaSistem/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" ImageUrl="~/Public/Images/Screen/SystemUser.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/PenggunaSistem/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" ImageUrl="~/Public/Images/Screen/DbConfig.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/Saga/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" ImageUrl="~/Public/Images/Screen/DbConfig.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/Smp/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" ImageUrl="~/Public/Images/Screen/EmailConfig.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/Emel/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink13" runat="server" ImageUrl="~/Public/Images/Screen/BuletinAdministration.png" Text="ASPxHyperLink" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="Maklumat Organisasi" NavigateUrl="~/PengurusanSistem/Organisasi/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Text="Kumpulan Pengguna" NavigateUrl="~/PengurusanSistem/KumpulanPenggunaSistem/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Text="Pengguna Sistem" NavigateUrl="~/PengurusanSistem/PenggunaSistem/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink8" runat="server" Text="Konfigurasi Sistem Saga" NavigateUrl="~/PengurusanSistem/Saga/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink10" runat="server" Text="Konfigurasi Sistem Maklumat Kampus" NavigateUrl="~/PengurusanSistem/Smp/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink12" runat="server" Text="Konfigurasi Emel" NavigateUrl="~/PengurusanSistem/Emel/Index.aspx" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink14" runat="server" Text="Tetapan Buletin Pengguna" Target="_blank">
                </dx:ASPxHyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="7" style="vertical-align:middle; text-align:left; padding:10px 4px 4px 4px;">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Names="Myriad Pro" Font-Size="Small" Text="FAIL INDUK" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink15" runat="server" ImageUrl="~/Public/Images/Screen/Employee.png" Text="ASPxHyperLink" NavigateUrl="~/FailInduk/Pekerja/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink34" runat="server" ImageUrl="~/Public/Images/Screen/AssetOfficer.png" Text="ASPxHyperLink" NavigateUrl="~/PengurusanSistem/PegawaiAset/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink32" runat="server" ImageUrl="~/Public/Images/Screen/Vendor.png" Text="ASPxHyperLink" NavigateUrl="~/FailInduk/Pembekal/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width:100px; vertical-align:middle; text-align:center; padding:4px 4px 4px 4px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink21" runat="server" Text="Kakitangan" NavigateUrl="~/FailInduk/Pekerja/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink35" runat="server" Text="Pegawai Aset" NavigateUrl="~/PengurusanSistem/PegawaiAset/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                <dx:ASPxHyperLink ID="ASPxHyperLink33" runat="server" Text="Pembekal" NavigateUrl="~/FailInduk/Pembekal/Index.aspx">
                </dx:ASPxHyperLink>
            </td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">
                &nbsp;</td>
            <td style="width: 100px; vertical-align: middle; text-align: center; padding: 4px 4px 4px 4px;">&nbsp;</td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
    <Border BorderStyle="None" />
</dx:ASPxPopupControl>
