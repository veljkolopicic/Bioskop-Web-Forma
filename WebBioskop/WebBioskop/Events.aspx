<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebBioskop.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
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
                <asp:BoundField DataField="vreme" HeaderText="Vreme" SortExpression="vreme" DataFormatString="{0:hh\:mm}" />
                <asp:BoundField DataField="Karte" HeaderText="Broj preostalih &lt;br /&gt;ulaznica" SortExpression="Karte" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Cena" HeaderText="Cena &lt;br /&gt;ulaznice" SortExpression="Cena" HtmlEncode="False" />
                <asp:BoundField DataField="ID" HeaderText="Rezervacije-ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DogadjajiId" HeaderText="Dogadjaji-Id" SortExpression="DogadjajiId" >
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
    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
    <br />
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
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button3" runat="server" Height="25px" OnClick="Button3_Click" Text="Dodaj novi" Width="100px" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Promeni" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Izbriši" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="FilmoviId" SortExpression="FilmoviId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FilmoviId") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    <br />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FilmoviId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dan" SortExpression="Dan">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Dan") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="37px" Width="120px">
                        <asp:ListItem Value="Ponedeljak"></asp:ListItem>
                        <asp:ListItem Value="Utorak"></asp:ListItem>
                        <asp:ListItem Value="Sreda"></asp:ListItem>
                        <asp:ListItem Value="Četvrtak"></asp:ListItem>
                        <asp:ListItem Value="Petak"></asp:ListItem>
                        <asp:ListItem Value="Subota"></asp:ListItem>
                        <asp:ListItem Value="Nedelja"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text=" "></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Dan") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Datum" SortExpression="Datum">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Datum") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Unesite validan datum" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Datum", "{0:M/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="vreme" SortExpression="vreme">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("vreme") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="37px" Width="120px">
                        <asp:ListItem Value="16:00:00"></asp:ListItem>
                        <asp:ListItem Value="19:00:00"></asp:ListItem>
                        <asp:ListItem Value="22:00:00"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("vreme") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Karte" SortExpression="Karte">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Karte") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox10" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBox10" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Karte") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cena" SortExpression="Cena">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Cena") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox11" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox11" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cena") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="Red"></asp:Label>
    <br />
    <br />

</asp:Content>
