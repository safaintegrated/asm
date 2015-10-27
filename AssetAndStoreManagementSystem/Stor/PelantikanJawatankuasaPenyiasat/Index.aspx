<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AssetAndStoreManagementSystem.Stor.PelantikanJawatankuasaPenyiasat.Index" %>

<%@ Register Src="~/Stor/PelantikanJawatankuasaPenyiasat/PelantikanJawatankuasaPenyiasat_Controller.ascx" TagPrefix="uc1" TagName="PelantikanJawatankuasaPenyiasat_Controller" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pelantikan Jawatankuasa Penyiasat</title>
    <link href="../../Public/Css/AspxCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainDivCentered80Percent">
        <uc1:PelantikanJawatankuasaPenyiasat_Controller runat="server" ID="PelantikanJawatankuasaPenyiasat_Controller" />
    </div>
    </form>
</body>
</html>
