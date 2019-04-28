<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rezervacije.aspx.cs" Inherits="WebBioskop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" RowStyle-Wrap="true" itemstyle-wrap="True" Width="590px"  >
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
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena FROM Dogadjaji INNER JOIN Filmovi ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Filmovi.Name = @Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" BackColor="#BCB598" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="590px">
            <AlternatingRowStyle BackColor="#dae4e5" />
            <Columns>
                <asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" />
                <asp:BoundField DataField="Datum" DataFormatString="{0:MM/dd/yy}" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="vreme" DataFormatString="{0:hh\:mm}" HeaderText="Vreme" SortExpression="vreme" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Karte" HeaderText="Broj mesta" SortExpression="Karte" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                <asp:TemplateField HeaderText="Broj Ulaznica">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="90px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" SelectText="Rezerviši" ShowSelectButton="True" />
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
</asp:Content>
