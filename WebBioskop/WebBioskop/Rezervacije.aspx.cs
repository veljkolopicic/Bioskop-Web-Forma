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
        int brojac;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Request.QueryString["name"];
            TextBox2.Text = Context.User.Identity.Name;
            if (Label2.Text == "") 
                Response.Redirect("~/Izbor_Filmova.aspx");
            DataView dvSql = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                TextBox1.Text = drvSql["Id"].ToString();
            }
        
            if (GridView3.Rows.Count == 0 || GridView3.Rows.Count == brojac)
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
            string id = row.Cells[0].Text;
            string mesta = row.Cells[4].Text;
            int preostalo = Convert.ToInt32(mesta);

            string dogadjajiid="", userid="";bool rezervisao = false;
            
            DataView rezSql = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView rezvSql in rezSql)//uzima svaki red u tabeli rezervacije
            {
                dogadjajiid = rezvSql["DogadjajiId"].ToString();
                userid = rezvSql["UserId"].ToString();
                if (id==dogadjajiid && TextBox1.Text==userid)//poredi da li je korisnik vec rezervisao film
                {
                    rezervisao = true;
                }
            }
            if (rezervisao == true)// ako jeste vec rezervisao
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Već ste rezervisali za dati termin.Pogledajte u vašem nalogu koje ste filmove rezervisali.";
                UpdatePanel1.Visible = false;
            }
            else
            {
                if (preostalo == 0)// ako nema vise ulaznica
                {
                    Label4.ForeColor = System.Drawing.Color.Red;
                    Label4.Text = "Nema preostalih ulaznica za dati termin.";
                    UpdatePanel1.Visible = false;
                }
                else
                {
                    UpdatePanel1.Update();
                    UpdatePanel1.Visible = true;
                    Label4.Text = "";
                    Label8.Text = id;
                    TextBox3.Focus();
                    reset(UpdatePanel1);
                }
            }   
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            DateTime trenutno = DateTime.Now;//trenutno vreme
            string vreme = e.Row.Cells[2].Text +" "+ e.Row.Cells[3].Text+":00";//datum plus sati
            try
            {
                DateTime projekcija = DateTime.Parse(vreme);//pretvaranje stringa u datetime
                int result = DateTime.Compare(projekcija, trenutno);//da bi smo ih uporedili
                if (result < 0)//rezultat je negativan ako je trenutno "mladje" od pocetka projekcije
                {
                    e.Row.Visible = false;//taj red isključujemo
                    brojac++;
                }
            }
            catch
            {

            }
        }
        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;//svi imagebutton-i 
            string buttonId = btn.ID;
            buttonId = buttonId.Substring(11);//oduzimamo 'imagebutton' da ostane samo broj
            int zarezi=0;
            foreach (char z in TextBox3.Text)//broji zareze
            {
                if (z == ',') zarezi++;
            }  
            if (zarezi < 5)//za brojanje sedista
            {
                if (TextBox3.Text == "")
                {
                    TextBox3.Text = buttonId;
                    TextBox4.Text = (zarezi + 1).ToString();
                }
                else
                {
                    TextBox3.Text = TextBox3.Text + "," + buttonId;
                    TextBox4.Text = (zarezi + 2).ToString();
                }
                
                uklonis(btn);
            }
            else
            {
                Label7.Text = "Max 6 sedišta.";
            }
        }
        public void uklonis(ImageButton ukloni)
        {
            ukloni.ImageUrl = "~/Images/Sedistem1.png";
            ukloni.Enabled = false;
            ukloni.AlternateText = "Zauzeto";
            ukloni.ToolTip = "Zauzeto";
        }
        public void reset(Control UpdatePanel1)//reset updatepanel-a
        {
            foreach (Control control in UpdatePanel1.Controls)
            {
                RecursiveResetForm(control);
            }
        }
        public void RecursiveResetForm(Control control)
        {
            if (control.HasControls())//ako ima child kontrole
            {
                foreach (Control subControl in control.Controls)
                {
                    RecursiveResetForm(subControl);
                }
            }
            if (control is TextBox)//ako je textbox u updatepanel-u
            {
                TextBox txtbox = (TextBox)control;
                txtbox.Text = string.Empty;//svaki textbox je prazan
            }
            if (control is ImageButton)//ako je imagebutton
            {
                ImageButton imageButton = (ImageButton)control;
                imageButton.ImageUrl = "~/Images/Sedistem.png";//svaki imagebutton je slobodan
                imageButton.Enabled = true;
                imageButton.AlternateText = "Slobodno";
                imageButton.ToolTip = "Slobodno";
                DataView rezSql = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView rezvSql in rezSql)/*uzima svaki red u tabeli rezervacije gde je id
                   dogadjaja jednak izabranom vremenu projekcije */
                {
                    string sedista = rezvSql["Sedista"].ToString();// uzimamo sedista
                    string [] sediste = sedista.Split(',');//delimo ih jer je to broj id-a imagebuttona
                    foreach (string broj in sediste)
                    {
                        string brojsedista = "ImageButton" + broj;//pun id imagebuttona
                        if (imageButton.ID == brojsedista)//ako je isti onda je sediste zauzeto
                        {
                            uklonis(imageButton);
                        }
                    }
                }
            }
        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TextBox3.Text=="")
            {
                Label7.Text = "Izaberite sedišta!";
            }
            else
            {
                GridViewRow row = GridView4.SelectedRow;
                GridView4.DataBind();
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
                int karte = Convert.ToInt32(TextBox4.Text);
                string brsedista = TextBox3.Text;
                string dogadjajiid = "", userid = ""; bool rezervisao = false;

                DataView rezSql = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView rezvSql in rezSql)//uzima svaki red u tabeli rezervacije
                {
                    dogadjajiid = rezvSql["DogadjajiId"].ToString();
                    userid = rezvSql["UserId"].ToString();
                    if (id == dogadjajiid && TextBox1.Text == userid)//poredi da li je korisnik vec rezervisao film
                    {
                        rezervisao = true;
                    }
                }
                if (rezervisao == true)// ako jeste vec rezervisao
                {
                    Label7.Text = "Već ste rezervisali za dati termin.Pogledajte u vašem nalogu koje ste filmove rezervisali.";
                }
                else
                {
                    preostalo -= karte;
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
                    Label7.Text = "Uspešno ste rezervisali " + karte + bru + " za " +
                        datum + " u " + row.Cells[3].Text + " časova."+
                    "Ukupna cena " + karte * cena + " din.";
                    SqlDataSource4.Update();// izvrši update u tabelu dogadjaji
                    GridView3.DataBind();// pikaži odmah promenu u tabeli
                    GridView4.DataBind();
                    SqlDataSource4.InsertParameters.Add("brsedista", brsedista);
                    SqlDataSource4.InsertParameters.Add("vreme", vreme);
                    SqlDataSource4.InsertParameters.Add("datum", datum);
                    SqlDataSource4.InsertParameters.Add("karte", karte.ToString());
                    SqlDataSource4.InsertCommand = "INSERT INTO Rezervacije (DogadjajiID,UserID,BrojUlaznica,Sedista)" +
                        " SELECT Dogadjaji.ID,@Id,@karte,@brsedista FROM Dogadjaji INNER JOIN Filmovi " +
                        "ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Dogadjaji.vreme = @vreme) AND (Dogadjaji.Datum = @datum) AND (Filmovi.Name = @Name)";
                    SqlDataSource4.Insert();// izvrši insert u tabelu rezervacije 
                }
            }
            

        }
    }
}