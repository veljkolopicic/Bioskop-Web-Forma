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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name != "one.logo@yahoo.com")
                Response.Redirect("~/Account/Login.aspx");
            if (GridView1.Rows.Count != 0)
            {
                Label7.Text = "Korisnici i rezervacije.";
            }
            if (GridView2.Rows.Count != 0)
            {
                Label8.Text = "Dogadjaji.";
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

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
            catch
            {
                Label9.Text = "Proverite sve kolone pre dodavanja !";
            }
            
                
        }
    }
}