using System;
using System.Collections.Generic;
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
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView3.SelectedRow;
            string dan = row.Cells[0].Text;
            string vreme = row.Cells[2].Text + ":00";
            string mesta = row.Cells[3].Text;
            string cenakarte = row.Cells[4].Text;
            cenakarte = cenakarte.Remove(cenakarte.Length - 3);
            int cena = Convert.ToInt32(cenakarte);
            int preostalo = Convert.ToInt32(mesta);
            string bru = "";//ispis ulaznica
            DropDownList dtkarte = (DropDownList)row.FindControl("DropDownList1");
            int karte = Convert.ToInt32(dtkarte.SelectedItem.Value);
            if (preostalo == 0)
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Nema preostalih ulaznica za dati termin";
                Label5.Text = "";
            }
            else 
            {
                preostalo -= karte;
                if (preostalo < 0)
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
                    else bru = " ulaznica";//dali ste rezervisali 1-ulaznicu 2-ulaznice ...5-ulaznica
                    SqlDataSource4.UpdateParameters.Add("preostalo", preostalo.ToString());
                    SqlDataSource4.UpdateParameters.Add("vreme", vreme);
                    SqlDataSource4.UpdateParameters.Add("dan", dan);
                    SqlDataSource4.UpdateCommand = "UPDATE Dogadjaji SET Karte = @preostalo FROM Dogadjaji INNER JOIN Filmovi" +
                        " ON Dogadjaji.FilmoviId = Filmovi.ID WHERE (Dogadjaji.vreme = @vreme) AND (Dogadjaji.Dan = @dan) AND (Filmovi.Name = @Name)";
                    Label4.ForeColor = System.Drawing.Color.Black;
                    Label4.Text = "Uspešno ste rezervisali " + karte + bru + " za " +
                        dan + " u " + row.Cells[2].Text + " časova.";
                    Label5.Text = "Ukupna cena " + karte * cena + " din.";
                    SqlDataSource4.Update();
                    GridView3.DataBind();
                }
            }

            
        }
    }
}