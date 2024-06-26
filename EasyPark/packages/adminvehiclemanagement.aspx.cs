using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParkingSystem
{
    public partial class adminvehiclemanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getdetailsbyvehiclenumber();
        }
        //add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfvehicledetailsExists())
            {
                Response.Write("<script>alert('Details with this parking ID already exist, You cannot add member with same parking ID');</script>");
            }
            else
            {
                addnewvehicledetails();
            }
        }
        //update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfvehicledetailsExists())
            {
                updatevehicledetails();
            }
            else
            {
                Response.Write("<script>alert('Member does not exist')<script>");
            }
        }
        //delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfvehicledetailsExists())
            {
                deletevehicledetails();
            }
            else
            {
                Response.Write("<script>alert('Member does not exist')<script>");
            }
        }

        //user defined function
        void getdetailsbyvehiclenumber()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from vehicle_details_tbl where vehicle_number='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    DropDownList1.Text = dt.Rows[0][1].ToString();
                    TextBox2.Text = dt.Rows[0][2].ToString();
                    TextBox3.Text = dt.Rows[0][3].ToString();
                    TextBox4.Text = dt.Rows[0][4].ToString();
                    TextBox5.Text = dt.Rows[0][5].ToString();
                    TextBox6.Text = dt.Rows[0][6].ToString();
                    TextBox7.Text = dt.Rows[0][7].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Vehicle Number')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void addnewvehicledetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO vehicle_details_tbl (vehicle_number, vehicle_type, owner_name, phone_number, model_maker, insurance, slot_start_time, slot_end_time) values(@vehicle_number,@vehicle_type,@owner_name,@phone_number,@model_maker,@insurance,@slot_start_time,@slot_end_time)", con);
                cmd.Parameters.AddWithValue("@vehicle_number", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@vehicle_type", DropDownList1.Text.Trim());
                cmd.Parameters.AddWithValue("@owner_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone_number", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@model_maker", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@insurance", TextBox5.Text.Trim());
                // Convert string representations to DateTime objects
                DateTime slotStartTime = DateTime.Parse(TextBox6.Text.Trim());
                DateTime slotEndTime = DateTime.Parse(TextBox7.Text.Trim());

                // Now you can add parameters with these DateTime objects to your SQL command
                cmd.Parameters.AddWithValue("@slot_start_time", slotStartTime);
                cmd.Parameters.AddWithValue("@slot_end_time", slotEndTime);
               

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Vehicle details added successfullly');</script>");
                clearform();
          //      GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void updatevehicledetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update vehicle_details_tbl set owner_name=@owner_name,vehicle_type=@vehicle_type,phone_number=@phone_number,model_maker=@model_maker,insurance=@insurance,slot_start_time=@slot_start_time,slot_end_time=@slot_end_time where vehicle_number='" + TextBox1.Text.Trim() + "'", con);
                    
                cmd.Parameters.AddWithValue("@vehicle_type", DropDownList1.Text.Trim());
                cmd.Parameters.AddWithValue("@owner_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone_number", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@model_maker", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@insurance", TextBox5.Text.Trim());
                // Convert string representations to DateTime objects
                DateTime slotStartTime = DateTime.Parse(TextBox6.Text.Trim());
                DateTime slotEndTime = DateTime.Parse(TextBox7.Text.Trim());

                // Now you can add parameters with these DateTime objects to your SQL command
                cmd.Parameters.AddWithValue("@slot_start_time", slotStartTime);
                cmd.Parameters.AddWithValue("@slot_end_time", slotEndTime); 

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Vehicle details updated successfullly');</script>");
                clearform();
            //    GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deletevehicledetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("delete from vehicle_details_tbl where vehicle_number='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Details Deleted successfullly');</script>");
                clearform();
            //    GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfvehicledetailsExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from vehicle_details_tbl where vehicle_number='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearform()
        {
            TextBox1.Text = "";
            DropDownList1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";

        }

    }
}