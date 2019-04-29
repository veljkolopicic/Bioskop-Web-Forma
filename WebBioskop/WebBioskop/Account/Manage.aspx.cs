using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using WebBioskop.Models;

namespace WebBioskop.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            TextBox1.Text = Context.User.Identity.Name;
            Label1.Text = "";
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    ChangePassword.Visible = true;
                }
                else
                {
                    CreatePassword.Visible = true;
                    ChangePassword.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridViewRow row = GridView1.SelectedRow;
            string id = row.Cells[0].Text;//prva kolona je rezervacje.id
            string dogadjajiid = row.Cells[1].Text;//druga je dogadjajid
            int karte = Convert.ToInt32(row.Cells[2].Text);//treca je preostali broj ulaznica
            int brojulaznica = Convert.ToInt32(row.Cells[9].Text);//deseta je karte koje dodajemo
            karte += brojulaznica;
            SqlDataSource2.UpdateParameters.Add("dogadjajiid", dogadjajiid);
            SqlDataSource2.UpdateParameters.Add("karte", karte.ToString());
            SqlDataSource2.UpdateCommand = "UPDATE Dogadjaji SET Karte = @karte" +
                " WHERE (Dogadjaji.ID = @dogadjajiid)";//update ako ponistavamo rezervaciju
            SqlDataSource2.Update();
            SqlDataSource2.DeleteParameters.Add("id", id);
            SqlDataSource2.DeleteCommand = "DELETE FROM Rezervacije WHERE (ID = @id)";
            SqlDataSource2.Delete();//brisanje iz tabele rezervacije ako ponistavamo rezervaciju
            GridView1.DataBind();
            Label1.Text = "Uspešno ste ponistili rezervaciju.";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //string putanja;
            DateTime trenutno = DateTime.Now;//trenutno vreme
            string vreme = e.Row.Cells[6].Text + " " + e.Row.Cells[7].Text + ":00";//datum plus sati
            try
            {
                DateTime projekcija = DateTime.Parse(vreme);//pretvaranje stringa u datetime
                int result = DateTime.Compare(projekcija, trenutno);//da bi smo ih uporedili
                if (result < 0)//rezultat je negativan ako je trenutno "mladje" od pocetka projekcije
                {
                    e.Row.Enabled = false;//taj red isključujemo
                    var image=e.Row.FindControl("ImageButton2");
                    image.Visible = false;//uklanjamo dugme tj sliku poništite rezervaciju

                }
                else
                {
                    var image = e.Row.FindControl("ImageButton1");
                    image.Visible = false;//uklanjamo dugme tj sliku gledali ste
                }
            }
            catch
            {

            }

        }

    }
}