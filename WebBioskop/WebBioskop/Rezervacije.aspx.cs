﻿using System;
using System.Collections.Generic;
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
    }
}