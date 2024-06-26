using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParkingSystem
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    logoutLinkButton.Visible = false;
                    LinkButton7.Visible = false; //hello user link button
                    adminloginLinkButton.Visible = true;
                    adminvehiclemgmtLinkButton.Visible = false;
                    vehiclelistLinkButton.Visible = false;

                }
         
                else if(Session["role"].Equals("admin"))
                {
                    logoutLinkButton.Visible = true; // logout text will be displayed
                    LinkButton7.Visible = true;  // admin name will be displayed
                    LinkButton7.Text = "Welocome our admin "+Session["fullname"].ToString();

                    adminloginLinkButton.Visible = false;
                    adminvehiclemgmtLinkButton.Visible = true;
                    vehiclelistLinkButton.Visible = true;
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void adminloginLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
        
        protected void adminvehiclemgmtLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminvehiclemanagement.aspx");
        }

     protected void vehiclelistLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("vehiclelist.aspx");
        }
        
        protected void logoutLinkButton_Click(object sender, EventArgs e)
        {
            Session["user_id"] = "";
            Session["full_name"] = "";
            Session["role"] = "";

            logoutLinkButton.Visible = false;
            LinkButton7.Visible = false; //hello user link button
            adminloginLinkButton.Visible = true;
            adminvehiclemgmtLinkButton.Visible = false;
            vehiclelistLinkButton.Visible = false;
            Response.Redirect("Homepage.aspx");
        }
    }
}