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
public class buisness
    {
        public int CountryId { get; set; }
        public string id { get; set; }
        public string Name1 { get; set; }
        public string Name2 { get; set; }

        public string Name3 { get; set; }
        public string Name4 { get; set; }
        public string Name5 { get; set; }
    }

    public partial class Product_master : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        [WebMethod]
        public static string getdata1()
        {
            DataTable dt = new DataTable();
            string strresult = "0";
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            
            string qry = string.Format(@"select * from tbl_catagory_master");
            //SqlCommand cmd = new SqlCommand(qry, con);
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da = new SqlDataAdapter(cmd);
            dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    buisness bs = new buisness();
                    bs.id= Convert.ToString(row["Cataogary_id"]);
                    bs.Name1 = Convert.ToString(row["Catagory_name"]);

                  

                }
            }
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                strresult = "1";
            }
            else
            {
                strresult = "-1";
            }
            con.Close();


            return strresult;
        }
        
        [WebMethod]
        public static string insertdata(string catagory, string product)
        {
          
            string strresult = "0";
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            string qry = string.Format(@"insert into tbl_Product_master (product_name,catagory_id) values ('{0}',{1})", product, catagory);
            SqlCommand cmd = new SqlCommand(qry, con);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                strresult = "1";
            }
            else
            {
                strresult = "-1";
            }
            con.Close();


            return strresult;
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