<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rezervacije.aspx.cs" Inherits="WebBioskop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
  .hidencol
  {
    display: none;
  }
</style>
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Izabrani film : " Font-Size="Medium"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="" Font-Bold="True" Font-Size="Medium" ></asp:Label>

    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Description], [Name], [ImageRepertoar] FROM [Filmovi] WHERE ([Name] = @Name)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Name" QueryStringField="name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" RowStyle-Wrap="true" itemstyle-wrap="True" Width="617px" Font-Bold="True"  >
            <Columns>
                <asp:BoundField DataField="Description" SortExpression="Description" HtmlEncode="False">
                <ItemStyle BackColor="#E9E9E9" Font-Bold="True" Font-Names="Candara" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="ImageRepertoar">
                    <ItemStyle BackColor="#E9E9E9" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

<RowStyle Wrap="True"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Izaberite broj ulaznica za vreme projekcije i kliknite na dugme rezerviši"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Dogadjaji.ID, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena FROM Dogadjaji INNER JOIN Filmovi ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Filmovi.Name = @Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  BackColor="#BCB598" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="617px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="#dae4e5" />
            <Columns>
                <asp:BoundField DataField="ID" InsertVisible="False" ReadOnly="True">
                <HeaderStyle CssClass="hidencol" />
                <ItemStyle CssClass="hidencol" />
                </asp:BoundField>
                <asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:M/dd/yyyy}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="vreme" DataFormatString="{0:hh\:mm}" HeaderText="Vreme" SortExpression="vreme" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Karte" HeaderText="Broj Preostalih mesta" SortExpression="Karte" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                <asp:TemplateField HeaderText="Broj Ulaznica">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" Width="57px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" SelectText="Rezerviši" ShowSelectButton="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9fbff2" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Font-Strikeout="False" Font-Underline="True" ForeColor="Black"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT * FROM [Dogadjaji] WHERE (([vreme] = @vreme) AND ([Dan] = @Dan))"
            DeleteCommand="DELETE FROM [Dogadjaji] WHERE [ID] = @ID" >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
            <asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox1" Name="Id" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DbType="Time" Name="vreme" QueryStringField="vreme" />
                <asp:QueryStringParameter Name="Dan" QueryStringField="dan" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id] FROM [AspNetUsers] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="Email" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [DogadjajiId], [UserId], [BrojUlaznica] FROM [Rezervacije]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Visible="False" Width="16px" CssClass="hiden"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Visible="False" Width="16px"></asp:TextBox>
    </p>
</asp:Content>
