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
    public class PoServices
    {
        //Db Connection string
        string DBCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        SystemTools _SystemTools = new SystemTools();

        //Save use to the database
        public int CreateUser(HttpPostedFileBase file, AddUserModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("SaveUser", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Firstname", entity.Firstname);
                cmd.Parameters.AddWithValue("@Middlename", entity.Middlename);
                cmd.Parameters.AddWithValue("@Lastname", entity.Lastname);
                cmd.Parameters.AddWithValue("@Gender", entity.Gender);
                cmd.Parameters.AddWithValue("@Email", entity.Email);
                cmd.Parameters.AddWithValue("@Phone", entity.Phone);
                cmd.Parameters.AddWithValue("@Position", entity.Position);
                cmd.Parameters.AddWithValue("@Password", _SystemTools.EncryptPass(entity.Password));
                cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }







        //View users list
        public List<UsersListModel> MicroUsersList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklist", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.po_sum_id = reader["po_sum_id"].ToString();


                        __UsersListModel.qty_uom = reader["qty_uom"].ToString();
                        __UsersListModel.DateCreated = reader["DateCreated"].ToString();
                        __UsersListModel.vendor_name = reader["vendor_name"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.stacking_level = reader["stacking_level"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();


                        __UsersListModel.checklist_approval = reader["checklist_approval"].ToString();
                        __UsersListModel.checklist_remarks = reader["checklist_remarks"].ToString(); //enn


                        __UsersListModel.expiry_date = reader["expiry_date"].ToString();
                        __UsersListModel.qty_delivered = reader["qty_delivered"].ToString();
                  
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.IsArchived = int.Parse(reader["IsArchived"].ToString());
           
                        __UsersListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __UsersListModel.pr_number = reader["pr_number"].ToString();
                        __UsersListModel.import_date = reader["import_date"].ToString();
                        __UsersListModel.pr_date = reader["pr_date"].ToString();
                        __UsersListModel.po_number = reader["po_number"].ToString();
                        __UsersListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __UsersListModel.item_description = reader["item_description"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();
                        __UsersListModel.qty_good = reader["qty_good"].ToString();
                        __UsersListModel.qty_void = reader["qty_void"].ToString();
                        __UsersListModel.qty_remarks = reader["qty_remarks"].ToString();

                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }


        //Deactivate User
        public int DeactivateActivateUser(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DeactivateActivateUser", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", model.UserID);
                cmd.Parameters.AddWithValue("@Operation", model.Operation);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


        //Deactivate Raw Materials
        public int DeactivateActivateRawMaterials(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DeactivateActivateRawMaterials", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", model.po_sum_id);
                cmd.Parameters.AddWithValue("@Operation", model.Operation);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


        public int CancelQARawMaterials(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("CancelQARawMaterials", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", model.po_sum_id);
                cmd.Parameters.AddWithValue("@Operation", model.Operation);
                cmd.Parameters.AddWithValue("@checklist_remarks", model.checklist_remarks);
                cmd.Parameters.AddWithValue("@cancelled_po_by", model.cancelled_po_by);
                //cmd.Parameters.AddWithValue("@cancel_date", model.cancel_date);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


        public int ReturnApprovePO(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("ReturnApprovePO", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", model.po_sum_id);
                cmd.Parameters.AddWithValue("@Operation", model.Operation);
                cmd.Parameters.AddWithValue("@checklist_remarks", model.checklist_remarks);
                cmd.Parameters.AddWithValue("@return_cancelled_po_by", model.return_cancelled_po_by);
                //cmd.Parameters.AddWithValue("@cancel_date", model.cancel_date);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }












        //Update user to the database
        public int CancelQAForReceivingRawMaterials(HttpPostedFileBase file, EditUserModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("CancelQAForReceivingRawMaterials", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", entity.po_sum_id);
                //cmd.Parameters.AddWithValue("@Firstname", entity.Firstname);
                cmd.Parameters.AddWithValue("@item_description", entity.item_description);
                cmd.Parameters.AddWithValue("@mfg_date", entity.mfg_date);
                cmd.Parameters.AddWithValue("@vendor_name", entity.vendor_name);
                cmd.Parameters.AddWithValue("qty_delivered", entity.qty_delivered);
                cmd.Parameters.AddWithValue("@batch_number", entity.batch_number);
                cmd.Parameters.AddWithValue("@qty_reject", entity.qty_reject);
                cmd.Parameters.AddWithValue("@stacking_level", entity.stacking_level);
                cmd.Parameters.AddWithValue("@qty_waiting", entity.qty_waiting);
                cmd.Parameters.AddWithValue("@expiry_date", entity.expiry_date);
                cmd.Parameters.AddWithValue("@truck_remarks1", entity.truck_remarks1);
                cmd.Parameters.AddWithValue("@truck_remarks2", entity.truck_remarks2);
                cmd.Parameters.AddWithValue("@truck_remarks3", entity.truck_remarks3);
                cmd.Parameters.AddWithValue("@truck_remarks4", entity.truck_remarks4);
                cmd.Parameters.AddWithValue("@truck_approval1", entity.truck_approval1);
                cmd.Parameters.AddWithValue("@truck_approval2", entity.truck_approval2);
                cmd.Parameters.AddWithValue("@truck_approval3", entity.truck_approval3);
                cmd.Parameters.AddWithValue("@truck_approval4", entity.truck_approval4);
                cmd.Parameters.AddWithValue("@unload_remarks1", entity.unload_remarks1);
                cmd.Parameters.AddWithValue("@unload_remarks2", entity.unload_remarks2);
                cmd.Parameters.AddWithValue("@unload_remarks3", entity.unload_remarks3);
                cmd.Parameters.AddWithValue("@unload_remarks4", entity.unload_remarks4);
                cmd.Parameters.AddWithValue("@unload_approval1", entity.unload_approval1);
                cmd.Parameters.AddWithValue("@unload_approval2", entity.unload_approval2);
                cmd.Parameters.AddWithValue("@unload_approval3", entity.unload_approval3);
                cmd.Parameters.AddWithValue("@unload_approval4", entity.unload_approval4);
                cmd.Parameters.AddWithValue("@checking_remarks1", entity.checking_remarks1);
                cmd.Parameters.AddWithValue("@checking_remarks2", entity.checking_remarks2);
                cmd.Parameters.AddWithValue("@checking_approval1", entity.checking_approval1);
                cmd.Parameters.AddWithValue("@checking_approval2", entity.checking_approval2);
                cmd.Parameters.AddWithValue("@item_code", entity.item_code);
                cmd.Parameters.AddWithValue("@Password", entity.Password);
                cmd.Parameters.AddWithValue("@qty_ordered", entity.qty_ordered);
                cmd.Parameters.AddWithValue("@qty_uom", entity.qty_uom);
                cmd.Parameters.AddWithValue("checklist_approval", entity.checklist_approval);
                cmd.Parameters.AddWithValue("checklist_remarks", entity.checklist_remarks);
                cmd.Parameters.AddWithValue("qty_missing", entity.qty_missing);
                cmd.Parameters.AddWithValue("QA_by", entity.QA_by);
                cmd.Parameters.AddWithValue("qty_total_delivered", entity.qty_total_delivered);

                //cmd.Parameters.AddWithValue("DateChecklistCreated", entity.DateChecklistCreated); lako kepa
                cmd.Parameters.AddWithValue("reverse_remarks", entity.reverse_remarks);
                cmd.Parameters.AddWithValue("reverse_mfg_date", entity.reverse_mfg_date);
                cmd.Parameters.AddWithValue("reverse_expiry_date", entity.reverse_expiry_date);
                cmd.Parameters.AddWithValue("reverse_good_qty", entity.reverse_good_qty);
                cmd.Parameters.AddWithValue("reverse_actual_delivered", entity.reverse_actual_delivered);
                cmd.Parameters.AddWithValue("reverse_reject_date", entity.reverse_reject_date);
                ////cmd.Parameters.AddWithValue("reverse_restockin_date", entity.reverse_restockin_date);
                cmd.Parameters.AddWithValue("qty_good", entity.qty_good);
                cmd.Parameters.AddWithValue("qty_void", entity.qty_void);
                cmd.Parameters.AddWithValue("qty_remarks", entity.qty_remarks);
  

                //rejection side
                cmd.Parameters.AddWithValue("rejectqty1", entity.rejectqty1);
                cmd.Parameters.AddWithValue("rejectqty2", entity.rejectqty2);
                cmd.Parameters.AddWithValue("rejectqty3", entity.rejectqty3);
                cmd.Parameters.AddWithValue("rejectqty4", entity.rejectqty4);
                cmd.Parameters.AddWithValue("rejectqty5", entity.rejectqty5);
                cmd.Parameters.AddWithValue("rejectqty6", entity.rejectqty6);



                cmd.Parameters.AddWithValue("remarksof_reject1", entity.remarksof_reject1);

                cmd.Parameters.AddWithValue("remarksof_reject2", entity.remarksof_reject2);


                cmd.Parameters.AddWithValue("remarksof_reject3", entity.remarksof_reject3);

                cmd.Parameters.AddWithValue("remarksof_reject4", entity.remarksof_reject4);

                cmd.Parameters.AddWithValue("remarksof_reject5", entity.remarksof_reject5);


                cmd.Parameters.AddWithValue("remarksof_reject6", entity.remarksof_reject6);




                cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


















        //View Active users list
        public List<UsersListModel> ActiveUsersList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetActiveUsers", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.UserID = reader["UserID"].ToString();
                        __UsersListModel.Firstname = reader["Firstname"].ToString();
                        __UsersListModel.Middlename = reader["Middlename"].ToString();
                        __UsersListModel.Lastname = reader["Lastname"].ToString();
                        __UsersListModel.Gender = reader["Gender"].ToString();
                        __UsersListModel.Email = reader["Email"].ToString();
                        __UsersListModel.Phone = reader["Phone"].ToString();
                        __UsersListModel.Position = reader["Position"].ToString();
                        __UsersListModel.Image = (byte[])reader["Image"];
                        __UsersListModel.DateCreated = reader["DateCreated"].ToString();
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.IsArchived = int.Parse(reader["IsActive"].ToString());

                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }



        //View InActive users list
        public List<UsersListModel> InActiveUsersList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetInActiveUsers", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.UserID = reader["UserID"].ToString();
                        __UsersListModel.Firstname = reader["Firstname"].ToString();
                        __UsersListModel.Middlename = reader["Middlename"].ToString();
                        __UsersListModel.Lastname = reader["Lastname"].ToString();
                        __UsersListModel.Gender = reader["Gender"].ToString();
                        __UsersListModel.Email = reader["Email"].ToString();
                        __UsersListModel.Phone = reader["Phone"].ToString();
                        __UsersListModel.Position = reader["Position"].ToString();
                        __UsersListModel.Image = (byte[])reader["Image"];
                        __UsersListModel.DateCreated = reader["DateCreated"].ToString();
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.IsArchived = int.Parse(reader["IsActive"].ToString());

                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }

        //Remove User
        public int RemoveUser(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("RemoveUser", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", model.UserID);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


        //Remove User
        public int RemoveRawMaterials(UsersListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("RemoveRawMaterials", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", model.po_sum_id);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }

        //View Archived users list
        public List<UsersListModel> ArchivedRawMaterialsList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetArchivedRawMaterials", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.po_sum_id = reader["po_sum_id"].ToString();
                        __UsersListModel.item_description = reader["item_description"].ToString();
                        __UsersListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __UsersListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __UsersListModel.import_date = reader["import_date"].ToString();
                        __UsersListModel.qty_delivered = reader["qty_delivered"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.expiry_date = reader["expiry_date"].ToString();
                        __UsersListModel.pr_number = reader["pr_number"].ToString();
                        __UsersListModel.pr_date = reader["pr_date"].ToString();
                        __UsersListModel.po_number = reader["po_number"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();

                        __UsersListModel.vendor_name = reader["vendor_name"].ToString();


                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }


        //View Archived users list
        public List<UsersListModel> PartialRawMaterialsList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetRawMaterialPartialReceived", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.po_sum_id = reader["po_sum_id"].ToString();

                        __UsersListModel.item_description = reader["item_description"].ToString();  // 4/10/2020
                        __UsersListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __UsersListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __UsersListModel.import_date = reader["import_date"].ToString();
                        __UsersListModel.qty_delivered = reader["qty_delivered"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.expiry_date = reader["expiry_date"].ToString();
                        __UsersListModel.pr_number = reader["pr_number"].ToString();
                        //__UsersListModel.pr_date = reader["pr_date"].ToString();
                        __UsersListModel.Password = reader["Password"].ToString();
                        __UsersListModel.qty_reject = reader["qty_reject"].ToString();
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.po_number = reader["po_number"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();

                        __UsersListModel.stacking_level = reader["stacking_level"].ToString();
                        __UsersListModel.qty_good = reader["qty_good"].ToString();
                        __UsersListModel.qty_void = reader["qty_void"].ToString();

                        __UsersListModel.qty_remarks = reader["qty_remarks"].ToString();

                        __UsersListModel.primary_key = reader["primary_key"].ToString();
                        __UsersListModel.Category = reader["Category"].ToString();


                        __UsersListModel.vendor_name = reader["vendor_name"].ToString();
                        __UsersListModel.DateChecklistCreated = reader["DateChecklistCreated"].ToString();


                        __UsersListModel.QA_by = reader["QA_by"].ToString();
                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }




        //View Archived users list
        public List<UsersListModel> RejectionsRawMaterialsList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetRawMaterialPartialReject", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.po_sum_id = reader["po_sum_id"].ToString();
                        //__UsersListModel.item_description = reader["item_description"].ToString();
                        __UsersListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __UsersListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __UsersListModel.import_date = reader["import_date"].ToString();
                        __UsersListModel.qty_delivered = reader["qty_delivered"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.expiry_date = reader["expiry_date"].ToString();
                        __UsersListModel.pr_number = reader["pr_number"].ToString();
                        //__UsersListModel.pr_date = reader["pr_date"].ToString();
                        __UsersListModel.Password = reader["Password"].ToString();
                        __UsersListModel.qty_reject = reader["qty_reject"].ToString();
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.po_number = reader["po_number"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.batch_number = reader["batch_number"].ToString();



                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }







        public List<UsersListModel> CanceledRawMaterialsList()
        {
            List<UsersListModel> _UsersListModel = new List<UsersListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetRawMaterialCanceled", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UsersListModel __UsersListModel = new UsersListModel();
                        __UsersListModel.po_sum_id = reader["po_sum_id"].ToString();
                        __UsersListModel.item_description = reader["item_description"].ToString();
                        __UsersListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __UsersListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __UsersListModel.import_date = reader["import_date"].ToString();
                        __UsersListModel.qty_delivered = reader["qty_delivered"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.expiry_date = reader["expiry_date"].ToString();
                        __UsersListModel.pr_number = reader["pr_number"].ToString();
                        //__UsersListModel.pr_date = reader["pr_date"].ToString();
                        __UsersListModel.vendor_name = reader["vendor_name"].ToString();
                        __UsersListModel.qty_remarks = reader["qty_remarks"].ToString();
                        __UsersListModel.qty_good = reader["qty_good"].ToString();
                        ////__UsersListModel.Password = reader["Password"].ToString();
                        ////__UsersListModel.qty_reject = reader["qty_reject"].ToString();
                        __UsersListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __UsersListModel.po_number = reader["po_number"].ToString();
                        __UsersListModel.item_code = reader["item_code"].ToString();
                        __UsersListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __UsersListModel.checklist_remarks = reader["checklist_remarks"].ToString();
                        //__UsersListModel.batch_number = reader["batch_number"].ToString();
                        //__UsersListModel.primary_key = reader["primary_key"].ToString();
                        __UsersListModel.cancel_date = reader["cancel_date"].ToString();
                        //__UsersListModel.stacking_level = reader["stacking_level"].ToString();

                        //__UsersListModel.vendor_name = reader["vendor_name"].ToString();
                        __UsersListModel.cancelled_po_by = reader["cancelled_po_by"].ToString();

                        _UsersListModel.Add(__UsersListModel);
                    }
                }
            }

            return _UsersListModel;

        }







        //View user details list
        public List<EditUserModel> ViewUserDetailsList()
        {
            List<EditUserModel> _EditUserModel = new List<EditUserModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklist", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EditUserModel __EditUserModel = new EditUserModel();
                        //__EditUserModel.UserID = int.Parse(reader["UserID"].ToString());
                        __EditUserModel.po_sum_id = int.Parse(reader["po_sum_id"].ToString());
                        //__EditUserModel.Firstname = reader["Firstname"].ToString();
                        __EditUserModel.item_description = reader["item_description"].ToString();
                        __EditUserModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __EditUserModel.qty_ordered = reader["qty_ordered"].ToString();

                        __EditUserModel.import_date = reader["import_date"].ToString();
                        __EditUserModel.qty_delivered = reader["qty_delivered"].ToString();
                        __EditUserModel.qty_waiting = reader["qty_waiting"].ToString();
                        __EditUserModel.expiry_date = reader["expiry_date"].ToString();
                        __EditUserModel.pr_number = reader["pr_number"].ToString();
                        __EditUserModel.pr_date = reader["pr_date"].ToString();
                        __EditUserModel.po_number = reader["po_number"].ToString();
                        __EditUserModel.po_date = reader["po_date"].ToString();
                        __EditUserModel.vendor_name = reader["vendor_name"].ToString();
                        __EditUserModel.item_code = reader["item_code"].ToString();
                        __EditUserModel.qty_uom = reader["qty_uom"].ToString();

                        __EditUserModel.checklist_remarks = reader["checklist_remarks"].ToString();//hello
                        __EditUserModel.qty_good = reader["qty_good"].ToString();//hello
                        __EditUserModel.qty_void = reader["qty_void"].ToString();
                        __EditUserModel.qty_remarks = reader["qty_remarks"].ToString();
                        __EditUserModel.stacking_level = reader["stacking_level"].ToString();
                        //__EditUserModel.Image = (byte[])reader["Image"];

                        _EditUserModel.Add(__EditUserModel);
                    }
                }
            }

            return _EditUserModel;

        }


        public List<EditUserModel> ViewUserDetailsList2()
        {
            List<EditUserModel> _EditUserModel = new List<EditUserModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklistCancel", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EditUserModel __EditUserModel = new EditUserModel();
                        __EditUserModel.po_sum_id = int.Parse(reader["po_sum_id"].ToString());
                        __EditUserModel.item_description = reader["item_description"].ToString();
                        __EditUserModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __EditUserModel.qty_ordered = reader["qty_ordered"].ToString();
                        __EditUserModel.import_date = reader["import_date"].ToString();
                        __EditUserModel.qty_delivered = reader["qty_delivered"].ToString();
                        __EditUserModel.qty_waiting = reader["qty_waiting"].ToString();
                        __EditUserModel.expiry_date = reader["expiry_date"].ToString();
                        __EditUserModel.pr_number = reader["pr_number"].ToString();
                        __EditUserModel.pr_date = reader["pr_date"].ToString();
                        __EditUserModel.po_number = reader["po_number"].ToString();
                        __EditUserModel.po_date = reader["po_date"].ToString();
                        __EditUserModel.vendor_name = reader["vendor_name"].ToString();
                        __EditUserModel.item_code = reader["item_code"].ToString();
                        __EditUserModel.qty_uom = reader["qty_uom"].ToString();
                        __EditUserModel.Password = reader["Password"].ToString();
                        __EditUserModel.mfg_date = reader["mfg_date"].ToString();
                        __EditUserModel.checklist_remarks = reader["checklist_remarks"].ToString();//hello
                        __EditUserModel.qty_good = reader["qty_good"].ToString();//hello
                        __EditUserModel.qty_void = reader["qty_void"].ToString();
                        __EditUserModel.qty_remarks = reader["qty_remarks"].ToString();
                        __EditUserModel.stacking_level = reader["stacking_level"].ToString();
                        __EditUserModel.pepe = reader["pepe"].ToString();
                        __EditUserModel.papa = reader["papa"].ToString();
                        __EditUserModel.qty_reject = reader["qty_reject"].ToString();
                        _EditUserModel.Add(__EditUserModel);
                    }
                }
            }

            return _EditUserModel;

        }




        //View user details list  reject update 2/25/3030
        public List<EditUserModel> ViewRejectionDetailsList()
        {
            List<EditUserModel> _EditUserModel = new List<EditUserModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklistReject", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EditUserModel __EditUserModel = new EditUserModel();
                        //__EditUserModel.UserID = int.Parse(reader["UserID"].ToString());
                        __EditUserModel.po_sum_id = int.Parse(reader["po_sum_id"].ToString());
                        //__EditUserModel.Firstname = reader["Firstname"].ToString();
                        __EditUserModel.item_description = reader["item_description"].ToString();

                        __EditUserModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __EditUserModel.qty_ordered = reader["qty_ordered"].ToString();
                        __EditUserModel.qty_reject = reader["qty_reject"].ToString(); //open
                        __EditUserModel.stacking_level = reader["stacking_level"].ToString();
                        __EditUserModel.import_date = reader["import_date"].ToString();
                        __EditUserModel.qty_delivered = reader["qty_delivered"].ToString();
                        __EditUserModel.qty_waiting = reader["qty_waiting"].ToString();
                        __EditUserModel.expiry_date = reader["expiry_date"].ToString();
                        __EditUserModel.mfg_date = reader["mfg_date"].ToString();
                        __EditUserModel.pr_number = reader["pr_number"].ToString();
                        __EditUserModel.pr_date = reader["pr_date"].ToString();
                        __EditUserModel.po_number = reader["po_number"].ToString();
                        __EditUserModel.po_date = reader["po_date"].ToString();
                        __EditUserModel.vendor_name = reader["vendor_name"].ToString();
                        __EditUserModel.item_code = reader["item_code"].ToString();
                        __EditUserModel.qty_uom = reader["qty_uom"].ToString();
                        __EditUserModel.checklist_remarks = reader["checklist_remarks"].ToString();
                        __EditUserModel.DateChecklistCreated = reader["DateChecklistCreated"].ToString();
                        __EditUserModel.Password = reader["Password"].ToString();

                        __EditUserModel.batch_number = reader["batch_number"].ToString();
                        //__EditUserModel.Image = (byte[])reader["Image"];

                        _EditUserModel.Add(__EditUserModel);
                    }
                }
            }

            return _EditUserModel;

        }









        //Update user to the database
        public int UpdateUser(HttpPostedFileBase file, EditUserModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("EditChecklist", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", entity.po_sum_id);
                //cmd.Parameters.AddWithValue("@Firstname", entity.Firstname);
                cmd.Parameters.AddWithValue("@item_description", entity.item_description);
                cmd.Parameters.AddWithValue("@mfg_date", entity.mfg_date);
                cmd.Parameters.AddWithValue("@vendor_name", entity.vendor_name);
                cmd.Parameters.AddWithValue("qty_delivered", entity.qty_delivered);
                cmd.Parameters.AddWithValue("@batch_number", entity.batch_number);
                cmd.Parameters.AddWithValue("@qty_reject", entity.qty_reject);
                cmd.Parameters.AddWithValue("@stacking_level", entity.stacking_level);
                cmd.Parameters.AddWithValue("@qty_waiting", entity.qty_waiting);
                cmd.Parameters.AddWithValue("@expiry_date", entity.expiry_date);
                cmd.Parameters.AddWithValue("@truck_remarks1", entity.truck_remarks1);
                cmd.Parameters.AddWithValue("@truck_remarks2", entity.truck_remarks2);
                cmd.Parameters.AddWithValue("@truck_remarks3", entity.truck_remarks3);
                cmd.Parameters.AddWithValue("@truck_remarks4", entity.truck_remarks4);
                cmd.Parameters.AddWithValue("@truck_approval1", entity.truck_approval1);
                cmd.Parameters.AddWithValue("@truck_approval2", entity.truck_approval2);
                cmd.Parameters.AddWithValue("@truck_approval3", entity.truck_approval3);
                cmd.Parameters.AddWithValue("@truck_approval4", entity.truck_approval4);
                cmd.Parameters.AddWithValue("@unload_remarks1", entity.unload_remarks1);
                cmd.Parameters.AddWithValue("@unload_remarks2", entity.unload_remarks2);
                cmd.Parameters.AddWithValue("@unload_remarks3", entity.unload_remarks3);
                cmd.Parameters.AddWithValue("@unload_remarks4", entity.unload_remarks4);
                cmd.Parameters.AddWithValue("@unload_approval1", entity.unload_approval1);
                cmd.Parameters.AddWithValue("@unload_approval2", entity.unload_approval2);
                cmd.Parameters.AddWithValue("@unload_approval3", entity.unload_approval3);
                cmd.Parameters.AddWithValue("@unload_approval4", entity.unload_approval4);
                cmd.Parameters.AddWithValue("@checking_remarks1", entity.checking_remarks1);
                cmd.Parameters.AddWithValue("@checking_remarks2", entity.checking_remarks2);
                cmd.Parameters.AddWithValue("@checking_approval1", entity.checking_approval1);
                cmd.Parameters.AddWithValue("@checking_approval2", entity.checking_approval2);
                cmd.Parameters.AddWithValue("@item_code", entity.item_code);
                cmd.Parameters.AddWithValue("@Password", entity.Password);
                cmd.Parameters.AddWithValue("@qty_ordered", entity.qty_ordered);
                cmd.Parameters.AddWithValue("@qty_uom", entity.qty_uom);
                cmd.Parameters.AddWithValue("checklist_approval", entity.checklist_approval);
                cmd.Parameters.AddWithValue("checklist_remarks", entity.checklist_remarks);
                cmd.Parameters.AddWithValue("qty_missing", entity.qty_missing);
                cmd.Parameters.AddWithValue("QA_by", entity.QA_by);
                cmd.Parameters.AddWithValue("qty_total_delivered", entity.qty_total_delivered);

                cmd.Parameters.AddWithValue("reverse_remarks", entity.reverse_remarks);
                cmd.Parameters.AddWithValue("reverse_mfg_date", entity.reverse_mfg_date);
                cmd.Parameters.AddWithValue("reverse_expiry_date", entity.reverse_expiry_date);
                cmd.Parameters.AddWithValue("reverse_good_qty", entity.reverse_good_qty);
                cmd.Parameters.AddWithValue("reverse_actual_delivered", entity.reverse_actual_delivered);
                cmd.Parameters.AddWithValue("reverse_reject_date", entity.reverse_reject_date);
                ////cmd.Parameters.AddWithValue("reverse_restockin_date", entity.reverse_restockin_date);
                cmd.Parameters.AddWithValue("qty_good", entity.qty_good);
                cmd.Parameters.AddWithValue("qty_void", entity.qty_void);
                cmd.Parameters.AddWithValue("qty_remarks", entity.qty_remarks);

                ////rejection side
                cmd.Parameters.AddWithValue("rejectqty1", entity.rejectqty1);
                cmd.Parameters.AddWithValue("rejectqty2", entity.rejectqty2);
                cmd.Parameters.AddWithValue("rejectqty3", entity.rejectqty3);
                cmd.Parameters.AddWithValue("rejectqty4", entity.rejectqty4);
                cmd.Parameters.AddWithValue("rejectqty5", entity.rejectqty5);
                cmd.Parameters.AddWithValue("rejectqty6", entity.rejectqty6);



                cmd.Parameters.AddWithValue("remarksof_reject1", entity.remarksof_reject1);

                cmd.Parameters.AddWithValue("remarksof_reject2", entity.remarksof_reject2);


                cmd.Parameters.AddWithValue("remarksof_reject3", entity.remarksof_reject3);

                cmd.Parameters.AddWithValue("remarksof_reject4", entity.remarksof_reject4);

                cmd.Parameters.AddWithValue("remarksof_reject5", entity.remarksof_reject5);


                cmd.Parameters.AddWithValue("remarksof_reject6", entity.remarksof_reject6);

                cmd.Parameters.AddWithValue("start_load", entity.start_load);
                cmd.Parameters.AddWithValue("stop_load", entity.stop_load);



                cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }





        //Update rejection Raw Materials
        public int UpdateRawRejection(HttpPostedFileBase file, EditUserModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("EditRejectChecklist", conn);//call Stored Procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@po_sum_id", entity.po_sum_id);
                cmd.Parameters.AddWithValue("@item_description", entity.item_description);
                cmd.Parameters.AddWithValue("@mfg_date", entity.mfg_date);
                cmd.Parameters.AddWithValue("@vendor_name", entity.vendor_name);
                cmd.Parameters.AddWithValue("qty_delivered", entity.qty_delivered);
                cmd.Parameters.AddWithValue("@batch_number", entity.batch_number);
                cmd.Parameters.AddWithValue("@qty_reject", entity.qty_reject);
                cmd.Parameters.AddWithValue("@stacking_level", entity.stacking_level);
                cmd.Parameters.AddWithValue("@qty_waiting", entity.qty_waiting);
                cmd.Parameters.AddWithValue("@expiry_date", entity.expiry_date);
                cmd.Parameters.AddWithValue("@truck_remarks1", entity.truck_remarks1);
                cmd.Parameters.AddWithValue("@truck_remarks2", entity.truck_remarks2);
                cmd.Parameters.AddWithValue("@truck_remarks3", entity.truck_remarks3);
                cmd.Parameters.AddWithValue("@truck_remarks4", entity.truck_remarks4);
                cmd.Parameters.AddWithValue("@truck_approval1", entity.truck_approval1);
                cmd.Parameters.AddWithValue("@truck_approval2", entity.truck_approval2);
                cmd.Parameters.AddWithValue("@truck_approval3", entity.truck_approval3);
                cmd.Parameters.AddWithValue("@truck_approval4", entity.truck_approval4);
                cmd.Parameters.AddWithValue("@unload_remarks1", entity.unload_remarks1);
                cmd.Parameters.AddWithValue("@unload_remarks2", entity.unload_remarks2);
                cmd.Parameters.AddWithValue("@unload_remarks3", entity.unload_remarks3);
                cmd.Parameters.AddWithValue("@unload_remarks4", entity.unload_remarks4);
                cmd.Parameters.AddWithValue("@unload_approval1", entity.unload_approval1);
                cmd.Parameters.AddWithValue("@unload_approval2", entity.unload_approval2);
                cmd.Parameters.AddWithValue("@unload_approval3", entity.unload_approval3);
                cmd.Parameters.AddWithValue("@unload_approval4", entity.unload_approval4);
                cmd.Parameters.AddWithValue("@checking_remarks1", entity.checking_remarks1);
                cmd.Parameters.AddWithValue("@checking_remarks2", entity.checking_remarks2);
                cmd.Parameters.AddWithValue("@checking_approval1", entity.checking_approval1);
                cmd.Parameters.AddWithValue("@checking_approval2", entity.checking_approval2);
                cmd.Parameters.AddWithValue("@item_code", entity.item_code);
                cmd.Parameters.AddWithValue("@Password", entity.Password);
                cmd.Parameters.AddWithValue("@qty_ordered", entity.qty_ordered);
                cmd.Parameters.AddWithValue("@qty_uom", entity.qty_uom);
                cmd.Parameters.AddWithValue("checklist_approval", entity.checklist_approval);
                cmd.Parameters.AddWithValue("checklist_remarks", entity.checklist_remarks);
                cmd.Parameters.AddWithValue("qty_missing", entity.qty_missing);
                cmd.Parameters.AddWithValue("QA_by", entity.QA_by);
                cmd.Parameters.AddWithValue("qty_total_delivered", entity.qty_total_delivered);
                cmd.Parameters.AddWithValue("reverse_remarks", entity.reverse_remarks);
                cmd.Parameters.AddWithValue("reverse_mfg_date", entity.reverse_mfg_date);
                cmd.Parameters.AddWithValue("reverse_expiry_date", entity.reverse_expiry_date);
                cmd.Parameters.AddWithValue("reverse_good_qty", entity.reverse_good_qty);
                cmd.Parameters.AddWithValue("reverse_actual_delivered", entity.reverse_actual_delivered);
                cmd.Parameters.AddWithValue("reverse_reject_date", entity.reverse_reject_date);
                cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }


    }


}




