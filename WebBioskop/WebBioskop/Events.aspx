<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebBioskop.WebForm3" validateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <p>
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Filmovi.Name, Filmovi.ImageRepertoar, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena, Rezervacije.ID, Rezervacije.DogadjajiId, Rezervacije.BrojUlaznica, AspNetUsers.Email FROM Filmovi INNER JOIN Dogadjaji ON Filmovi.ID = Dogadjaji.FilmoviId INNER JOIN Rezervacije ON Dogadjaji.ID = Rezervacije.DogadjajiId INNER JOIN AspNetUsers ON Rezervacije.UserId = AspNetUsers.Id"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" style="margin-left: 0px" AllowSorting="True">
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
        <br />
    </p>
    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Filmovi] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Filmovi] ([Name], [Image], [Highlighted], [Description], [Trailer], [LongDescription], [ImageRepertoar]) VALUES (@Name, @Image, @Highlighted, @Description, @Trailer, @LongDescription, @ImageRepertoar)" SelectCommand="SELECT * FROM [Filmovi]" UpdateCommand="UPDATE [Filmovi] SET [Name] = @Name, [Image] = @Image, [Highlighted] = @Highlighted, [Description] = @Description, [Trailer] = @Trailer, [LongDescription] = @LongDescription, [ImageRepertoar] = @ImageRepertoar WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>

        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="Highlighted" Type="Boolean" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Trailer" Type="String" />
            <asp:Parameter Name="LongDescription" Type="String" />
            <asp:Parameter Name="ImageRepertoar" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >

<ContentTemplate>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource3" ShowFooter="True" >
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button4" runat="server" Height="25px" Text="Dodaj film" Width="100px" OnClick="Button4_Click" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Promeni" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Izbriši" ForeColor="Red" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
            <ItemStyle BackColor="Silver" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Ime filma" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImageVelika" SortExpression="Image">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Image") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HL" SortExpression="Highlighted">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Highlighted") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Highlighted") %>' Enabled="false" />
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# cutString(Eval("Description").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Trailer" SortExpression="Trailer">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Trailer") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# cutString(Eval("Trailer").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LongDescription" SortExpression="LongDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("LongDescription") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox16" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# cutString(Eval("LongDescription").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ImagePoster" SortExpression="ImageRepertoar">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ImageRepertoar") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox17" runat="server" Height="25px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ImageRepertoar") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
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
    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="Red"></asp:Label>
        </ContentTemplate>

</asp:UpdatePanel>
    
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
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
<asp:UpdatePanel ID="UpdatePanel2" runat="server"  UpdateMode="Conditional" >

<ContentTemplate>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" ShowFooter="True" >
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button3" runat="server" Height="25px" OnClick="Button3_Click"  Enabled="True" Text="Dodaj novi" Width="100px" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Promeni" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Izbriši" ForeColor="Red" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
            <ItemStyle BackColor="Silver" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="FilmoviId" SortExpression="FilmoviId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FilmoviId") %>' Height="20px" Width="120px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Width="120px"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    <br />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FilmoviId") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dan" SortExpression="Dan">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Dan") %>' Height="22px" Width="120px"></asp:TextBox>
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
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Datum" SortExpression="Datum">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Datum") %>' Height="20px" Width="120px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Width="120px"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Unesite validan datum" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Datum", "{0:M/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="vreme" SortExpression="vreme">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("vreme") %>' Height="20px"></asp:TextBox>
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
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Karte" SortExpression="Karte">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Karte") %>' Height="20px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Width="120px"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox10" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBox10" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Karte") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cena" SortExpression="Cena">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Cena") %>' Height="20px" Width="120px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Width="120px"></asp:TextBox>
                    <br />
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox11" ErrorMessage="Int veci od 0" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox11" ErrorMessage="Int" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cena") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle BackColor="#FFFF99" />
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
            </ContentTemplate>

</asp:UpdatePanel>
    <br />
    
    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>

    
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Rezervacije] WHERE [ID] = @original_ID AND [DogadjajiId] = @original_DogadjajiId AND (([UserId] = @original_UserId) OR ([UserId] IS NULL AND @original_UserId IS NULL)) AND [BrojUlaznica] = @original_BrojUlaznica" InsertCommand="INSERT INTO [Rezervacije] ([DogadjajiId], [UserId], [BrojUlaznica]) VALUES (@DogadjajiId, @UserId, @BrojUlaznica)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Rezervacije.ID, Rezervacije.DogadjajiId, Rezervacije.UserId, Rezervacije.BrojUlaznica, AspNetUsers.UserName, Rezervacije.Sedista FROM Rezervacije INNER JOIN AspNetUsers ON Rezervacije.UserId = AspNetUsers.Id" UpdateCommand="UPDATE Rezervacije SET DogadjajiId = @DogadjajiId, UserId = @UserId, BrojUlaznica = @BrojUlaznica, Sedista = @Sedista WHERE (ID = @original_ID) AND (DogadjajiId = @original_DogadjajiId) AND (UserId = @original_UserId) AND (BrojUlaznica = @original_BrojUlaznica) AND (Sedista = @original_Sedista) OR (ID = @original_ID) AND (DogadjajiId = @original_DogadjajiId) AND (UserId IS NULL) AND (BrojUlaznica = @original_BrojUlaznica) AND (@original_UserId IS NULL) AND (Sedista = @original_Sedista)">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_DogadjajiId" Type="Int32" />
            <asp:Parameter Name="original_UserId" Type="String" />
            <asp:Parameter Name="original_BrojUlaznica" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DogadjajiId" Type="Int32" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="BrojUlaznica" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DogadjajiId" Type="Int32" />
            <asp:Parameter Name="UserId" Type="String" />
            <asp:Parameter Name="BrojUlaznica" Type="Int32" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_DogadjajiId" Type="Int32" />
            <asp:Parameter Name="original_UserId" Type="String" />
            <asp:Parameter Name="original_BrojUlaznica" Type="Int32" />
        </UpdateParameters>
        
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server"  UpdateMode="Conditional" >
        <ContentTemplate>
            <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource4" Width="980px" style="margin-right: 3px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Promeni" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" Text="Izbriši" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                    <ItemStyle BackColor="Silver" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DogadjajiId" HeaderText="DogadjajiId" SortExpression="DogadjajiId">
                    <ItemStyle BackColor="#FFFF99" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId">
                    <ItemStyle BackColor="#FFFF99" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BrojUlaznica" HeaderText="BrojUlaznica" SortExpression="BrojUlaznica">
                    <ItemStyle BackColor="#FFFF99" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                    <ItemStyle BackColor="#FFFF99" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Sedista" HeaderText="Sedista">
                    <ItemStyle BackColor="#FFFF99" />
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
        </ContentTemplate>

</asp:UpdatePanel>
    
    <br />
    <br />

</asp:Content>
