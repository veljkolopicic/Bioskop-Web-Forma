<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebBioskop.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Filmovi.Name, Filmovi.ImageRepertoar, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena, Rezervacije.ID, Rezervacije.DogadjajiId, Rezervacije.BrojUlaznica, AspNetUsers.Email FROM Filmovi INNER JOIN Dogadjaji ON Filmovi.ID = Dogadjaji.FilmoviId INNER JOIN Rezervacije ON Dogadjaji.ID = Rezervacije.DogadjajiId INNER JOIN AspNetUsers ON Rezervacije.UserId = AspNetUsers.Id"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" style="margin-left: 0px">
            <Columns>
                <asp:BoundField DataField="Email" HeaderText="Korisnik" SortExpression="Email" />
                <asp:BoundField DataField="Name" HeaderText="Naziv rezervisanog &lt;br /&gt;filma" SortExpression="Name" HtmlEncode="False" />
                <asp:ImageField DataImageUrlField="ImageRepertoar" ControlStyle-Width="65"  ControlStyle-Height="100" >
<ControlStyle Height="100px" Width="65px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:M/dd/yyyy}" />
                <asp:BoundField DataField="vreme" HeaderText="vreme" SortExpression="vreme" DataFormatString="{0:hh\:mm}" />
                <asp:BoundField DataField="Karte" HeaderText="Broj preostalih &lt;br /&gt;ulaznica" SortExpression="Karte" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Cena" HeaderText="Cena &lt;br /&gt;ulaznice" SortExpression="Cena" HtmlEncode="False" />
                <asp:BoundField DataField="ID" HeaderText="RezervacijeID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DogadjajiId" HeaderText="DogadjajiId" SortExpression="DogadjajiId" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="BrojUlaznica" HeaderText="Broj rezervisanih &lt;br /&gt;ulaznica" SortExpression="BrojUlaznica" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    </p>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Dogadjaji] WHERE [ID] = @original_ID AND [FilmoviId] = @original_FilmoviId AND [Dan] = @original_Dan AND [Datum] = @original_Datum AND [vreme] = @original_vreme AND [Karte] = @original_Karte AND [Cena] = @original_Cena" InsertCommand="INSERT INTO [Dogadjaji] ([FilmoviId], [Dan], [Datum], [vreme], [Karte], [Cena]) VALUES (@FilmoviId, @Dan, @Datum, @vreme, @Karte, @Cena)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Dogadjaji]" UpdateCommand="UPDATE [Dogadjaji] SET [FilmoviId] = @FilmoviId, [Dan] = @Dan, [Datum] = @Datum, [vreme] = @vreme, [Karte] = @Karte, [Cena] = @Cena WHERE [ID] = @original_ID AND [FilmoviId] = @original_FilmoviId AND [Dan] = @original_Dan AND [Datum] = @original_Datum AND [vreme] = @original_vreme AND [Karte] = @original_Karte AND [Cena] = @original_Cena">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_FilmoviId" Type="Int32" />
            <asp:Parameter Name="original_Dan" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Datum" />
            <asp:Parameter DbType="Time" Name="original_vreme" />
            <asp:Parameter Name="original_Karte" Type="Int32" />
            <asp:Parameter Name="original_Cena" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FilmoviId" Type="Int32" />
            <asp:Parameter Name="Dan" Type="String" />
            <asp:Parameter DbType="Date" Name="Datum" />
            <asp:Parameter DbType="Time" Name="vreme" />
            <asp:Parameter Name="Karte" Type="Int32" />
            <asp:Parameter Name="Cena" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FilmoviId" Type="Int32" />
            <asp:Parameter Name="Dan" Type="String" />
            <asp:Parameter DbType="Date" Name="Datum" />
            <asp:Parameter DbType="Time" Name="vreme" />
            <asp:Parameter Name="Karte" Type="Int32" />
            <asp:Parameter Name="Cena" Type="Decimal" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_FilmoviId" Type="Int32" />
            <asp:Parameter Name="original_Dan" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Datum" />
            <asp:Parameter DbType="Time" Name="original_vreme" />
            <asp:Parameter Name="original_Karte" Type="Int32" />
            <asp:Parameter Name="original_Cena" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" ShowFooter="True" >
        <Columns>
            <asp:CommandField ButtonType="Button" DeleteText="Izbriši" ShowDeleteButton="True" ShowEditButton="True" CancelText="Odustani" EditText="Promeni" InsertText="Ubaci" NewText="Novi" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FilmoviId" HeaderText="FilmoviId" SortExpression="FilmoviId" />
            <asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:M/dd/yyyy}" />
            <asp:BoundField DataField="vreme" HeaderText="vreme" SortExpression="vreme" />
            <asp:BoundField DataField="Karte" HeaderText="Karte" SortExpression="Karte" />
            <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <br />

</asp:Content>
