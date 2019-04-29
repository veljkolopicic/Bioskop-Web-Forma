<%@ Page Title="Upravljajte nalogom" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebBioskop.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">
  .hidencol
  {
    display: none;
  }
</style>
    <h2><%: Title %></h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>
    <br/>
       <div>

           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
               SelectCommand="SELECT Filmovi.Name, Filmovi.ImageRepertoar, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena, Rezervacije.ID, Rezervacije.DogadjajiId, Rezervacije.BrojUlaznica FROM Filmovi INNER JOIN Dogadjaji ON Filmovi.ID = Dogadjaji.FilmoviId INNER JOIN Rezervacije ON Dogadjaji.ID = Rezervacije.DogadjajiId INNER JOIN AspNetUsers ON Rezervacije.UserId = AspNetUsers.Id 
WHERE ([Email] = @Email)
">
               <SelectParameters>
                   <asp:ControlParameter ControlID="TextBox1" Name="Email" PropertyName="Text" />
               </SelectParameters>
           </asp:SqlDataSource>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#BCB598" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="800px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
               <AlternatingRowStyle BackColor="#cc6868" />
               <Columns>
                   <asp:BoundField DataField="ID" >
                   <HeaderStyle CssClass="hidencol" />
                   <ItemStyle CssClass="hidencol" />
                   </asp:BoundField>
                   <asp:BoundField DataField="DogadjajiId" >
                   <HeaderStyle CssClass="hidencol" />
                   <ItemStyle CssClass="hidencol" />
                   </asp:BoundField>
                   <asp:BoundField DataField="Karte" >
                   <HeaderStyle CssClass="hidencol" />
                   <ItemStyle CssClass="hidencol" />
                   </asp:BoundField>
                   <asp:BoundField DataField="Name" HeaderText="Rezevisani film" SortExpression="Name" >
                   <HeaderStyle Font-Names="Tahoma" ForeColor="Red" HorizontalAlign="Right" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:ImageField DataImageUrlField="ImageRepertoar" ControlStyle-Width="92"  ControlStyle-Height="137" >
<ControlStyle Height="137px" Width="92px"></ControlStyle>
                       <ItemStyle HorizontalAlign="Center" />
                   </asp:ImageField>
                   <asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" >
                   <HeaderStyle Font-Names="Tahoma" ForeColor="Red" HorizontalAlign="Center" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="Datum" DataFormatString="{0:M/dd/yyyy}" HeaderText="Datum" SortExpression="Datum" >
                   <HeaderStyle ForeColor="Red" HorizontalAlign="Center" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="vreme" DataFormatString="{0:hh\:mm}" HeaderText="Vreme" SortExpression="vreme" >
                   <HeaderStyle Font-Names="Tahoma" ForeColor="Red" HorizontalAlign="Center" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="Cena" HeaderText="Cena ulaznice" SortExpression="Cena" >
                   <HeaderStyle Font-Names="Tahoma" ForeColor="Red" HorizontalAlign="Center" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:BoundField DataField="BrojUlaznica" HeaderText="BrojUlaznica" SortExpression="BrojUlaznica" >
                   <HeaderStyle Font-Names="Tahoma" ForeColor="Red" HorizontalAlign="Center" />
                   <ItemStyle HorizontalAlign="Center" />
                   </asp:BoundField>
                   <asp:TemplateField ShowHeader="False">
                       <EditItemTemplate>
                           <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                           &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Images/Arrowpon16.png" Text="Edit" />
                           &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Select" ImageUrl="~/Images/Arrowpon7.png" Text="Poništi rezervaciju" />
                       </ItemTemplate>
                       <ItemStyle HorizontalAlign="Center" />
                   </asp:TemplateField>
               </Columns>
               <FooterStyle BackColor="#CCCCCC" />
               <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
               
               <SortedAscendingCellStyle BackColor="#F1F1F1" />
               <SortedAscendingHeaderStyle BackColor="#808080" />
               <SortedDescendingCellStyle BackColor="#CAC9C9" />
               <SortedDescendingHeaderStyle BackColor="#383838" />
           </asp:GridView>

           <br />
           <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:Label>

       </div> 
    
    <div class="row">
        <div class="col-md-12" style="left: 0px; top: 0px">
            <div class="form-horizontal">
                <h4>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Visible="False" Width="16px"></asp:TextBox>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                         
                        InsertCommand="INSERT INTO [Rezervacije] ([DogadjajiId], [UserId], [BrojUlaznica]) VALUES (@DogadjajiId, @UserId, @BrojUlaznica)" 
                        SelectCommand="SELECT * FROM [Rezervacije]" 
                        >
                        <DeleteParameters>
                         
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DogadjajiId" Type="Int32" />
                            <asp:Parameter Name="UserId" Type="String" />
                            <asp:Parameter Name="BrojUlaznica" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
          
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </h4>
                <h4>Promenite podešavanja vašeg naloga</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>External Logins:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                    </dd>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                    --%>
                    <%--
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <p>
                            There are no two-factor authentication providers configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
