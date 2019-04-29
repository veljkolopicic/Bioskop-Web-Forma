<%@ Page Title="Ton filmovi" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebBioskop.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    
    
    <table class="nav-justified">
        <tr>
            <td colspan="3"><h4>Zgrada u kojoj se nalazi bioskop „Ton filmovi“, sagrađena je 1903. prema projektu arhitekte Milana Antonovića, i prva je namenska zgrada pravljena za potrebe fotografa u Srbiji.<br />
                U njoj će 25 godina raditi Milan Jovanović, jedan od prvih fotografa u Beogradu i brat našeg poznatog slikara Paje Jovanovića, koji je tokom tog perioda snimio gotovo sve važne srpske vladare, glumce, književnike, slikare, naučnike, itd. Za njegovo ime vezuje se i izdavanje prvih razglednica s natpisom „Pozdrav iz Beograda“ (1896).
                <br />    Godine 1909. podrumske prostorije adaptirane su u bioskop „Koloseum“. U bioskopu je 29. decembra 1929. godine priređena prva tonska projekcija filma u Srbiji. Bio je to film "Dama sa trotoara", sa meksičkom glumicom Lupe Velez u glavnoj ulozi.
                Bioskop menja naziv u „Zvezda” 1946. godine kada se osniva preduzeće „Gradski bioskop“ koje kasnije dobija naziv „Beograd film“, a 2019 godine konačno menja naziv u bioskop "Ton filmovi".<br />
                Zgrada bioskopa je pod prvostepenom zaštitom Zavoda za zaštitu spomenika kulture grada Beograda. Fasada je urađena u stilu secesije sa stilizovanom dekoracijom na bočnom rizalitu (puti sa fotoaparatom i floralni motivi). U unutrašnjosti zgrade nalazi se spomen-vitraž posvećen pioniru fotografije u Srbiji i Evropi – Anastasu Jovanoviću.<br /></h4></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Zgrada.PNG" />
            </td>
            <td style="vertical-align:top"><h4 style="text-align:right">Adresa:<br />Terazije 40<br /> 11000 BEOGRAD</h4></td>
            <td><div class="content_iframe_map " ><iframe style="height: 450px;width:380px;float:initial "  src="//maps.google.com/maps?q=44.81273380,20.46130350&amp;z=16&amp;output=embed" ></iframe></div></td>
        </tr>
    </table>
    
    
</asp:Content>
