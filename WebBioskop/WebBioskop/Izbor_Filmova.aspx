<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Izbor_Filmova.aspx.cs" Inherits="WebBioskop.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [ImageRepertoar], [LongDescription], [Trailer] FROM [Filmovi]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="5" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Rezerviši" ShowCancelButton="False" >
                <ControlStyle BackColor="Black" />
                <ItemStyle BackColor="#FFD5D5" BorderColor="Red" BorderStyle="Groove" ForeColor="#FF2828" />
                </asp:CommandField>
                <asp:BoundField DataField="Name" HeaderText="Film" SortExpression="Name" >
                <ItemStyle BorderColor="Red" BorderStyle="Double" Font-Bold="True" Font-Names="Broadway" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="ImageRepertoar" HeaderText="Poster">
                </asp:ImageField>
                <asp:BoundField DataField="LongDescription" HeaderText="Opis" SortExpression="LongDescription"  >
                <ItemStyle BackColor="#FFD5D5" BorderColor="#FFD5D5" BorderStyle="Outset" Font-Names="Berlin Sans FB" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Trailer" SortExpression="Trailer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Trailer") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Trailer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <br />
    </p>
</asp:Content>
