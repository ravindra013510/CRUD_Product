using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace CRUD_operation_Ravindra_Deokar
{
    public partial class Product_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
         [WebMethod]
        public static List<buisness> update(string ID)
        {



            List<buisness> lst = new List<buisness>();
            buisness bs = new buisness();
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            string qry = string.Format(@"select * from tbl_Product_master where id ={0}",ID);

            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da = new SqlDataAdapter(cmd);
            dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    buisness bs1 = new buisness();
                    bs1.id = Convert.ToString(row["id"]);
                    bs1.Name1 = Convert.ToString(row["product_name"]);
                    bs1.Name2 = Convert.ToString(row["catagory_id"]);
                    //bs1.Name3 = Convert.ToString(row["Catagory_name"]);


                    lst.Add(bs1);

                }
            }
            con.Close();
            return lst;
        }
        [WebMethod]
        public static List<buisness> getdata()
        {



            List<buisness> lst = new List<buisness>();
            buisness bs = new buisness();
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            string qry = string.Format(@"select  a.id,a.product_name,a.catagory_id,b.Catagory_name  from tbl_Product_master a ,tbl_catagory_master b  where b.Cataogary_id=a.catagory_id ");

            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da = new SqlDataAdapter(cmd);
            dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    buisness bs1 = new buisness();
                    bs1.id = Convert.ToString(row["id"]);
                    bs1.Name1 = Convert.ToString(row["product_name"]);
                    bs1.Name2 = Convert.ToString(row["catagory_id"]);
                    bs1.Name3 = Convert.ToString(row["Catagory_name"]);


                    lst.Add(bs1);

                }
            }
            con.Close();
            return lst;
        }
        [WebMethod]
        public static string delete(string ID)
        {



            //List<buisness> lst = new List<buisness>();
            //buisness bs = new buisness();
            //DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string result = "";
            string qry = string.Format(@"delete from tbl_Product_master where id={0} ",ID);

            SqlCommand cmd = new SqlCommand(qry, con);
            int a = 0;
           a =cmd.ExecuteNonQuery();
            if (a > 0)
            {
                result = "1";
            }
            else {
                result = "-1";
            }
            con.Close();
            
            return result;
            
        }
        [WebMethod]
        public static string updatedata(string id, string product_name, string catagory_id)
        {



         
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string result = "";
            string qry = string.Format(@"update tbl_Product_master set product_name='{0}',catagory_id={1} where ID={2} ", product_name, catagory_id, id);

            SqlCommand cmd = new SqlCommand(qry, con);
            int a = 0;
            a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                result = "1";
            }
            else
            {
                result = "-1";
            }
            con.Close();

            return result;

        }
        [WebMethod]
        public static List<buisness> getcatagory()
        {



            List<buisness> lst = new List<buisness>();
            buisness bs = new buisness();
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            string qry = string.Format(@"select * from tbl_catagory_master");

            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da = new SqlDataAdapter(cmd);
            dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    buisness bs1 = new buisness();
                    bs1.id = Convert.ToString(row["Cataogary_id"]);
                    bs1.Name1 = Convert.ToString(row["Catagory_name"]);


                    lst.Add(bs1);

                }
            }
            con.Close();
            return lst;
        }
    }
}