<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rezervacije.aspx.cs" Inherits="WebBioskop.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<style type="text/css">
  .hidencol
  {
	display: none;
  }
		.auto-style6 {
			width: 53%;
			height: 512px;
			background-image: url('Images/sala1.png');
			margin-right: 0px;
		}
		.auto-style7 {
			width: 51px;
		}
		.auto-style16 {
			width: 54px;
		}
		.auto-style20 {
			height: 53px;
			text-align: left;
		}
		.auto-style28 {
			height: 53px;
		}
		.auto-style29 {
			width: 51px;
			height: 53px;
		}
		.auto-style40 {
			width: 54px;
			height: 20px;
		}
		.auto-style45 {
			width: 49px;
			height: 49px;
		}
		.auto-style56 {
			width: 51px;
			height: 53px;
			text-align: left;
		}
		.auto-style57 {
			width: 51px;
			height: 53px;
			text-align: right;
		}
		.auto-style58 {
			height: 53px;
			text-align: right;
		}
		.auto-style59 {
			margin-left: 10px;
		}
		.auto-style60 {
			margin-left: 8px;
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
		<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="Izaberite vreme projekcije i kliknite na dugme izaberite sedišta"></asp:Label>
	</p>
	<p>
		<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Dogadjaji.ID, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena FROM Dogadjaji INNER JOIN Filmovi ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Filmovi.Name = @Name)">
			<SelectParameters>
				<asp:ControlParameter ControlID="Label2" Name="Name" PropertyName="Text" />
			</SelectParameters>
		</asp:SqlDataSource>
		<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"  BackColor="#BCB598" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="617px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged1" OnRowDataBound="GridView3_RowDataBound">
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
				<asp:BoundField DataField="Cena" HeaderText="Cena ulaznice" SortExpression="Cena" />
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
					<HeaderStyle CssClass="hidencol" />
					<ItemStyle HorizontalAlign="Center" CssClass="hidencol" />
				</asp:TemplateField>
				<asp:CommandField ButtonType="Button" SelectText="Izaberite sedišta" ShowSelectButton="True" >
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" Visible="False" >

<ContentTemplate>
	<table class="auto-style6">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style16">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style56">
				&nbsp;</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style28"></td>
		</tr>
		<tr>
			<td class="auto-style58"></td>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style57">
				&nbsp;</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton14" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton15" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton16" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style28"></td>
		</tr>
		<tr>
			<td class="auto-style20"></td>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style20">
				&nbsp;</td>
			<td class="auto-style29">
				<asp:ImageButton ID="ImageButton17" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton18" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton19" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton20" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton21" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton22" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton23" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton24" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style28"></td>
		</tr>
		<tr>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style28"></td>
			<td class="auto-style28">
				&nbsp;</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton25" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton26" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton27" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton28" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton29" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton30" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton31" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton32" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style28"></td>
		</tr>
		<tr>
			<td class="auto-style3"></td>
			<td class="auto-style3"></td>
			<td class="auto-style3"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style40"></td>
			<td class="auto-style3"></td>
		</tr>
		<tr>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton38" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton37" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton36" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton35" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton34" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton33" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style28"></td>
		</tr>
		<tr>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton58" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton57" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45"></td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton44" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton43" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton42" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton41" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton40" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton39" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45"></td>
		</tr>
		<tr>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45"></td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton60" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton59" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45"></td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton50" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton49" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton48" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton47" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton46" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton45" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
			<td class="auto-style7">
				<asp:ImageButton ID="ImageButton56" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton55" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton54" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton53" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton52" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td class="auto-style45">
				<asp:ImageButton ID="ImageButton51" runat="server" ImageUrl="~/Images/Sedistem.png" OnClick="ImageButton_Click" AlternateText="Slobodno" ToolTip="Slobodno"/>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
	<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Dogadjaji.ID, Dogadjaji.Dan, Dogadjaji.Datum, Dogadjaji.vreme, Dogadjaji.Karte, Dogadjaji.Cena FROM Dogadjaji INNER JOIN Filmovi ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Dogadjaji.ID = @Name)">
		<SelectParameters>
			<asp:ControlParameter ControlID="Label8" Name="Name" PropertyName="Text" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [DogadjajiId], [UserId], [BrojUlaznica], [Sedista] FROM [Rezervacije] WHERE ([DogadjajiId] = @DogadjajiId)">
		<SelectParameters>
			<asp:ControlParameter ControlID="Label8" Name="DogadjajiId" PropertyName="Text" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
	<br />
	<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="#BCB598" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" DataKeyNames="ID" DataSourceID="SqlDataSource7" OnSelectedIndexChanged="GridView4_SelectedIndexChanged" Width="575px" >
		<AlternatingRowStyle BackColor="#CCCCCC" />
		<Columns>
			<asp:BoundField DataField="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID">
			<HeaderStyle CssClass="hidencol" />
			<ItemStyle CssClass="hidencol" />
			</asp:BoundField>
			<asp:BoundField DataField="Dan" HeaderText="Dan" SortExpression="Dan" />
			<asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" DataFormatString="{0:M/dd/yyyy}" />
			<asp:BoundField DataField="vreme" HeaderText="Vreme" SortExpression="vreme" DataFormatString="{0:hh\:mm}" />
			<asp:BoundField DataField="Karte" HeaderText="Broj Preostalih mesta" SortExpression="Karte" />
			<asp:BoundField DataField="Cena" HeaderText="Cena ulaznice" SortExpression="Cena" />
			<asp:CommandField ButtonType="Button" SelectText="Rezerviši" ShowSelectButton="True" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<SortedAscendingCellStyle BackColor="#F1F1F1" />
		<SortedAscendingHeaderStyle BackColor="#808080" />
		<SortedDescendingCellStyle BackColor="#CAC9C9" />
		<SortedDescendingHeaderStyle BackColor="#383838" />
	</asp:GridView>
	<br />
			<asp:Label href="Label6" ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" Text="Broj izabranog sedišta:"></asp:Label>
		<asp:TextBox ID="TextBox3" runat="server" Font-Bold="True" Font-Size="Medium" Width="170px" Height="22px" ReadOnly="True" CssClass="auto-style60"></asp:TextBox>
	<asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style59" Height="22px" Width="17px" Font-Bold="True" Font-Size="Medium" Font-Underline="True" ReadOnly="True"></asp:TextBox>
	<asp:Label ID="Label7" runat="server"  CssClass="auto-style59" Font-Bold="True" Font-Size="Large"></asp:Label>
</ContentTemplate>

</asp:UpdatePanel>
	<p>

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
		&nbsp;</p>
	<p>
		<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Visible="False" Width="16px" CssClass="hiden"></asp:TextBox>
		<asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Visible="False" Width="16px"></asp:TextBox>
	</p>
	<p>
		&nbsp;</p>
	<p>
		<script type="text/javascript">
			$(document).ready(function () {
				$('#<%=Label7.ClientID%>').show;
				setTimeout(function() { $('#<%=Label7.ClientID%>').fadeOut(1000); }, 5000);
		});
	</script>
		&nbsp;</p>
</asp:Content>
