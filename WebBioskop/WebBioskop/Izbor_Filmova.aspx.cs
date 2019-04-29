using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebBioskop
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string name = row.Cells[1].Text;//uzimamo ime filma
            if (Context.User.Identity.Name != string.Empty)
            {
                Response.Redirect("~/Rezervacije.aspx?name="+name);//prelazimo na rezervacije i prenosimo ime filma
            }
            else//ako korisnik nije logovan
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}