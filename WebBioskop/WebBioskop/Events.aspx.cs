using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBioskop
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public string cutString(string msg)
        {
            const int MaxLength = 10;
            if (msg.Length>10)
            {
                msg = msg.Substring(1, MaxLength) + "...";
            }
            return msg;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name != "one.logo@yahoo.com")//ukoliko nije administrator
                Response.Redirect("~/Account/Login.aspx");
            if (GridView1.Rows.Count != 0)//ukoliko tabele nisu prazne
            {
                Label7.Text = "Korisnici i rezervacije.";
            }
            if (GridView2.Rows.Count != 0)
            {
                Label8.Text = "Dogadjaji.";
            }
            if (GridView3.Rows.Count != 0)
            {
                Label11.Text = "Filmovi.";
            }
            if (GridView4.Rows.Count != 0)
            {
                Label13.Text = "Rezervacije.";
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdatePanel2.Update();

            GridViewRow footer = GridView2.FooterRow;
            try
            {
                string filmoviid = ((TextBox) footer.FindControl("TextBox7")).Text;//uzimamo vrednosti iz futera
                string dan = ((DropDownList) footer.FindControl("DropDownList1")).Text;
                string datum = ((TextBox)footer.FindControl("TextBox8")).Text;
                string vreme = ((DropDownList)footer.FindControl("DropDownList2")).Text;
                string karte = ((TextBox)footer.FindControl("TextBox10")).Text;
                string cena = ((TextBox)footer.FindControl("TextBox11")).Text;
                SqlDataSource2.InsertParameters.Add("Filmoviid", filmoviid);//ubacujemo vrednosti kao parametre
                SqlDataSource2.InsertParameters.Add("Dan", dan);
                SqlDataSource2.InsertParameters.Add("Datum", datum);
                SqlDataSource2.InsertParameters.Add("vreme", vreme);
                SqlDataSource2.InsertParameters.Add("Karte", karte);
                SqlDataSource2.InsertParameters.Add("Cena", cena);
                SqlDataSource2.Insert();
                Label9.Text = "";
            }
            catch//u slucaju da neke vrednosti nisu unete u futeru
            {

                Label9.Text = "Proverite sve kolone pre dodavanja !";
            }
            
                
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Update();

            GridViewRow footer = GridView3.FooterRow;
            try
            {
                string Name = ((TextBox)footer.FindControl("TextBox12")).Text;//uzimamo vrednosti iz futera
                string Image = ((TextBox)footer.FindControl("TextBox13")).Text;
                string Highlighted = ((CheckBox)footer.FindControl("CheckBox2")).Checked.ToString();
                string Description = ((TextBox)footer.FindControl("TextBox14")).Text;
                string Trailer = ((TextBox)footer.FindControl("TextBox15")).Text;
                string LongDescription = ((TextBox)footer.FindControl("TextBox16")).Text;
                string ImageRepertoar = ((TextBox)footer.FindControl("TextBox17")).Text;
                SqlDataSource3.InsertParameters.Add("Name", Name);//ubacujemo vrednosti kao parametre
                SqlDataSource3.InsertParameters.Add("Image", Image);
                SqlDataSource3.InsertParameters.Add("Highlighted", Highlighted);
                SqlDataSource3.InsertParameters.Add("Description", Description);
                SqlDataSource3.InsertParameters.Add("Trailer", Trailer);
                SqlDataSource3.InsertParameters.Add("LongDescription", LongDescription);
                SqlDataSource3.InsertParameters.Add("ImageRepertoar", ImageRepertoar);
                SqlDataSource3.Insert();
                Label12.Text = "";
            }
            catch//u slucaju da neke vrednosti nisu unete u futeru
            {

                Label12.Text = "Proverite sve kolone pre dodavanja !";
            }

        }
    }
}