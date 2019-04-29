<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebBioskop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        

        <p>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Kino.jpg" Width="100%" Height="100%" />
        </p>


    </div>
    <br />
    <div class="row">


            
               <h3 style="margin-left:80px;text-shadow: 5px 4px 5px rgba(29,21,206,0.81);">Dobrodošli u bioskop "Ton filmovi" projekcije filmova još od 1909 godine - pogledajte naš repertoar</h3>
            
            <p>
                <a class="btn btn-primary" style="float: right; margin-right:65px" href="/Izbor_Filmova">Repertoar &raquo;</a>
            </p>
        </div>
        <div>
   
            
        </div>



</asp:Content>
