using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SodetsoUsersManagement.Models;
using System.Configuration;
using System.Net;
using System.Web.Mvc;
using System.IO;

namespace SodetsoUsersManagement.Services
{
    public class PoManagementService
    {
        //Db Connection string
        string DBCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        SystemTools _SystemTools = new SystemTools();

        //Save use to the database




        //View users list
        public List<PoSummaryListModel> PoSummaryList()
        {
            List<PoSummaryListModel> _PoSummaryListModel = new List<PoSummaryListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetPOSummary", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        PoSummaryListModel __PoSummaryListModel = new PoSummaryListModel();
                        __PoSummaryListModel.po_sum_id = reader["po_sum_id"].ToString();
                        __PoSummaryListModel.pr_number = reader["pr_number"].ToString();
                        __PoSummaryListModel.pr_date = reader["pr_date"].ToString();
                        __PoSummaryListModel.po_number = reader["po_number"].ToString();
                        __PoSummaryListModel.po_date = reader["po_date"].ToString();
                        __PoSummaryListModel.item_code = reader["item_code"].ToString();
                       __PoSummaryListModel.qty_ordered = reader["qty_ordered"].ToString();
                       __PoSummaryListModel.qty_delivered = reader["qty_delivered"].ToString();
                        __PoSummaryListModel.qty_good = reader["qty_good"].ToString();
                        __PoSummaryListModel.expiration_details = reader["expiration_details"].ToString();
                        __PoSummaryListModel.item_description = reader["item_description"].ToString();
                        //  __UsersListModel.Image = (byte[])reader["Image"];
                        //  __UsersListModel.DateCreated = reader["DateCreated"].ToString();
                        // __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        //  __UsersListModel.IsArchived = int.Parse(reader["IsActive"].ToString());

                        _PoSummaryListModel.Add(__PoSummaryListModel);
                    }
                }
            }

            return _PoSummaryListModel;

        }

        //Update PO Summary to the database
        public int UpdatePoSummary(HttpPostedFileBase file, EditPoSummaryModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("EditPoSummary", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", entity.po_sum_id);
                //cmd.Parameters.AddWithValue("@pr_number", entity.pr_number);
                //cmd.Parameters.AddWithValue("@pr_date", entity.pr_date);
                //cmd.Parameters.AddWithValue("@po_number", entity.po_number);
                //cmd.Parameters.AddWithValue("@po_date", entity.po_date);
                ////cmd.Parameters.AddWithValue("@import_date", entity.import_date);
                //cmd.Parameters.AddWithValue("@qty_uom", entity.qty_uom);
                //cmd.Parameters.AddWithValue("@qty_billed", entity.qty_billed);
                //cmd.Parameters.AddWithValue("@qty_ordered", entity.qty_ordered);
                cmd.Parameters.AddWithValue("@qty_good", entity.qty_good);
                //cmd.Parameters.AddWithValue("@qty_reject", entity.qty_reject);
                //cmd.Parameters.AddWithValue("@qty_remarks", entity.qty_remarks);
                //cmd.Parameters.AddWithValue("@expiration_details", entity.expiration_details);
                //cmd.Parameters.AddWithValue("@item_description", entity.item_description);
                //cmd.Parameters.AddWithValue("@item_code", entity.item_code);
                //  cmd.Parameters.AddWithValue("@Phone", entity.Phone);
                //  cmd.Parameters.AddWithValue("@Position", entity.Position);
                // cmd.Parameters.AddWithValue("@Password", _SystemTools.EncryptPass(entity.Password));
                //  cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }

        //View user details list
        public List<EditPoSummaryModel> ViewPoSummaryDetailsList()
        {
            List<EditPoSummaryModel> _EditPoSummaryModel = new List<EditPoSummaryModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetPOSummary", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EditPoSummaryModel __EditPoSummaryModel = new EditPoSummaryModel();
                        __EditPoSummaryModel.po_sum_id = int.Parse(reader["po_sum_id"].ToString());
    
                    __EditPoSummaryModel.pr_number = reader["pr_number"].ToString();
                    __EditPoSummaryModel.pr_date = reader["pr_date"].ToString();
                   __EditPoSummaryModel.po_number = reader["po_number"].ToString();
                    __EditPoSummaryModel.po_date = reader["po_date"].ToString();
                     __EditPoSummaryModel.item_code = reader["item_code"].ToString();
                      __EditPoSummaryModel.item_description = reader["item_description"].ToString();
                       __EditPoSummaryModel.qty_ordered = reader["qty_ordered"].ToString();
                        __EditPoSummaryModel.qty_billed = reader["qty_billed"].ToString();
                        __EditPoSummaryModel.qty_good = reader["qty_good"].ToString();
                        __EditPoSummaryModel.expiration_details = reader["expiration_details"].ToString();
                        __EditPoSummaryModel.vendor_name = reader["vendor_name"].ToString();
     
                        // __EditUserModel.Image = (byte[])reader["Image"]";

                        _EditPoSummaryModel.Add(__EditPoSummaryModel);
                    }
                }
            }

            return _EditPoSummaryModel;

        }









    }
}