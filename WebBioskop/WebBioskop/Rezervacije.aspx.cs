using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBioskop
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Request.QueryString["name"];
            TextBox2.Text = Context.User.Identity.Name;
            DataView dvSql = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                TextBox1.Text = drvSql["Id"].ToString();
            }
            if (GridView3.Rows.Count == 0)
            {
                Label3.Text = "Nema projekcija za izabrani film.";
            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView3.SelectedRow;
            DropDownList dtkarte = (DropDownList)row.FindControl("DropDownList1");
            int karte = Convert.ToInt32(dtkarte.SelectedItem.Value);//izbrano u dropdown-u postaje karte koje oduzimamo
            GridView3.DataBind();
            string id = row.Cells[0].Text;
            string dan = row.Cells[1].Text;
            string datum = row.Cells[2].Text;
            string vreme = row.Cells[3].Text + ":00";
            string mesta = row.Cells[4].Text;
            string cenakarte = row.Cells[5].Text;
            cenakarte = cenakarte.Remove(cenakarte.Length - 3);
            int cena = Convert.ToInt32(cenakarte);
            int preostalo = Convert.ToInt32(mesta);
            string bru = "";//ispis ulaznica
            string dogadjajiid="", userid="";bool rezervisao = false;
            
            DataView rezSql = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView rezvSql in rezSql)//uzima svaki red u tabeli rezervacije
            {
                dogadjajiid = rezvSql["DogadjajiId"].ToString();
                userid = rezvSql["UserId"].ToString();
                if (id==dogadjajiid && TextBox1.Text==userid)//poredi dali je korisnik vec rezervisao film
                {
                    rezervisao = true;
                }
            }
            if (rezervisao == true)// ako jeste vec rezervisao
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Već ste rezervisali za dati termin.Pogledajte u vašem nalogu koje ste filmove rezervisali.";
                Label5.Text = "";
            }
            else
            {
                if (preostalo == 0)// ako nema vise ulaznica
                {
                    Label4.ForeColor = System.Drawing.Color.Red;
                    Label4.Text = "Nema preostalih ulaznica za dati termin.";
                    Label5.Text = "";
                }
                else
                {
                    preostalo -= karte;
                    if (preostalo < 0)// ako je izabrao vise ulaznica nego sto je preostalo 
                    {
                        Label4.ForeColor = System.Drawing.Color.Red;
                        Label4.Text = "Broj preostalih ulaznica je " + mesta;
                        Label5.Text = "";
                    }
                    else
                    {
                        if (karte == 1)
                            bru = " ulaznicu";
                        else if (karte > 1 && karte < 5)
                            bru = " ulaznice";
                        else bru = " ulaznica";//da li ste rezervisali 1-ulaznicu 2-ulaznice ...5-ulaznica
                        SqlDataSource4.UpdateParameters.Add("preostalo", preostalo.ToString());//dodajemo parametre za SqlDataSource4
                        SqlDataSource4.UpdateParameters.Add("vreme", vreme);// i dajemo im vrednost istovremeno
                        SqlDataSource4.UpdateParameters.Add("datum", datum);
                        SqlDataSource4.UpdateCommand = "UPDATE Dogadjaji SET Karte = @preostalo FROM Dogadjaji INNER JOIN Filmovi" +
                            " ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Dogadjaji.vreme = @vreme) AND (Dogadjaji.Datum = @datum) AND (Filmovi.Name = @Name)";
                        Label4.ForeColor = System.Drawing.Color.Black;
                        Label4.Text = "Uspešno ste rezervisali " + karte + bru + " za " +
                            dan.ToLower() + " u " + row.Cells[3].Text + " časova.";
                        Label5.Text = "Ukupna cena " + karte * cena + " din.";
                        SqlDataSource4.Update();// izvrši update u tabelu dogadjaji
                        GridView3.DataBind();// pikaži odmah promenu u tabeli
                        SqlDataSource4.InsertParameters.Add("vreme", vreme);
                        SqlDataSource4.InsertParameters.Add("datum", datum);
                        SqlDataSource4.InsertParameters.Add("karte", karte.ToString());
                        SqlDataSource4.InsertCommand = "INSERT INTO Rezervacije (DogadjajiID,UserID,BrojUlaznica)" +
                            " SELECT Dogadjaji.ID,@Id,@karte FROM Dogadjaji INNER JOIN Filmovi " +
                            "ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Dogadjaji.vreme = @vreme) AND (Dogadjaji.Datum = @datum) AND (Filmovi.Name = @Name)";
                        SqlDataSource4.Insert();// izvrši insert u tabelu rezervacije
                    }
                }
            }


            
        }
    }
}