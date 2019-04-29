<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebBioskop.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <h2><%: Title %>.</h2>
    <h3>Adresa</h3>
    <address>
        Dositejeva<br />
        Sopot 11450<br />
        <abbr title="Phone">Tel:</abbr>
        063/321-346
    </address>

    <address>
        <strong>Podrška:</strong>   <a href="mailto:one.logo@yahoo.com">one.logo@yahoo.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:dzonif4@gmail.com">dzonif4@gmail.com</a>
    </address>
        </div>
</asp:Content>
