using SodetsoUsersManagement.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SodetsoUsersManagement.Services
{

    public class MacroService
    {
        //Db Connection string
        string DBCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        SystemTools _SystemTools = new SystemTools();

        //View users list
        public List<MacroListModel> MacroList()
        {
            List<MacroListModel> _MacroListModel = new List<MacroListModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklistMacro", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        MacroListModel __MacroListModel = new MacroListModel();
                        __MacroListModel.po_sum_id = reader["po_sum_id"].ToString();



                        //bugok


                        __MacroListModel.qty_uom = reader["qty_uom"].ToString();

                        __MacroListModel.DateCreated = reader["DateCreated"].ToString();
                        __MacroListModel.vendor_name = reader["vendor_name"].ToString();
                        __MacroListModel.qty_waiting = reader["qty_waiting"].ToString();
                        __MacroListModel.stacking_level = reader["stacking_level"].ToString();
                        __MacroListModel.item_code = reader["item_code"].ToString();


                        __MacroListModel.checklist_approval = reader["checklist_approval"].ToString();
                        __MacroListModel.checklist_remarks = reader["checklist_remarks"].ToString(); //enn


                        __MacroListModel.expiry_date = reader["expiry_date"].ToString();
                        __MacroListModel.qty_delivered = reader["qty_delivered"].ToString();

                        __MacroListModel.IsActive = int.Parse(reader["IsActive"].ToString());
                        __MacroListModel.IsArchived = int.Parse(reader["IsArchived"].ToString());

                        __MacroListModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __MacroListModel.pr_number = reader["pr_number"].ToString();
                        __MacroListModel.import_date = reader["import_date"].ToString();
                        __MacroListModel.pr_date = reader["pr_date"].ToString();
                        __MacroListModel.po_number = reader["po_number"].ToString();
                        __MacroListModel.qty_ordered = reader["qty_ordered"].ToString();
                        __MacroListModel.item_description = reader["item_description"].ToString();
                        __MacroListModel.item_code = reader["item_code"].ToString();
                        __MacroListModel.qty_good = reader["qty_good"].ToString();
                        __MacroListModel.qty_void = reader["qty_void"].ToString();
                        __MacroListModel.qty_remarks = reader["qty_remarks"].ToString();
                        __MacroListModel.unit_price = reader["unit_price"].ToString();


                        //__UsersListModel.DateChecklistCreated = reader["DateChecklistCreated"].ToString(); ncovvv
                        _MacroListModel.Add(__MacroListModel);
                    }
                }
            }

            return _MacroListModel;

        }




        public int CancelQAMacroRawMaterials(MacroListModel model)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("CancelQAMacroRawMaterials", conn);//call Stored Procedure
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


        ///Call the Macro Materials Details
        ///

        //Update user to the database
        public int UpdateMacro(HttpPostedFileBase file, EditMacroModel entity)
        {
            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                entity.Image = _SystemTools.ConvertToBytes(file);

                conn.Open();
                SqlCommand cmd = new SqlCommand("EditMacroChecklist", conn);//call Stored Procedure
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


                cmd.Parameters.AddWithValue("plate_no", entity.plate_no);
                cmd.Parameters.AddWithValue("truck_scale_rec_no", entity.truck_scale_rec_no);
                cmd.Parameters.AddWithValue("vehicle_type", entity.vehicle_type);
                cmd.Parameters.AddWithValue("truck_gross_weight", entity.truck_gross_weight);
                cmd.Parameters.AddWithValue("truck_tare_weight", entity.truck_tare_weight);
                cmd.Parameters.AddWithValue("truck_net_weight", entity.truck_net_weight);
                cmd.Parameters.AddWithValue("actual_delivered_uom", entity.actual_delivered_uom);
                cmd.Parameters.AddWithValue("unloading_date", entity.unloading_date);
                cmd.Parameters.AddWithValue("test_date", entity.test_date);
                cmd.Parameters.AddWithValue("lot_no", entity.lot_no);


                cmd.Parameters.AddWithValue("sample_weight1", entity.sample_weight1);
                cmd.Parameters.AddWithValue("sample_weight2", entity.sample_weight2);
                cmd.Parameters.AddWithValue("sample_weight3", entity.sample_weight3);

                cmd.Parameters.AddWithValue("rej_data1", entity.rej_data1);
                cmd.Parameters.AddWithValue("rej_data2", entity.rej_data2);
                cmd.Parameters.AddWithValue("rej_data3", entity.rej_data3);
                cmd.Parameters.AddWithValue("rej_data4", entity.rej_data4);
                cmd.Parameters.AddWithValue("rej_data5", entity.rej_data5);
                cmd.Parameters.AddWithValue("rej_data6", entity.rej_data6);
                cmd.Parameters.AddWithValue("rej_data7", entity.rej_data7);
                cmd.Parameters.AddWithValue("rej_others", entity.rej_others);

                cmd.Parameters.AddWithValue("truck_approval5", entity.truck_approval5);
                cmd.Parameters.AddWithValue("truck_approval6", entity.truck_approval6);
                cmd.Parameters.AddWithValue("truck_approval7", entity.truck_approval7);
                cmd.Parameters.AddWithValue("truck_approval8", entity.truck_approval8);
                cmd.Parameters.AddWithValue("truck_approval9",  entity.truck_approval9);
                cmd.Parameters.AddWithValue("truck_approval10", entity.truck_approval10);

                cmd.Parameters.AddWithValue("truck_remarks5", entity.truck_remarks5);
                cmd.Parameters.AddWithValue("truck_remarks6", entity.truck_remarks6);
                cmd.Parameters.AddWithValue("truck_remarks7", entity.truck_remarks7);
                cmd.Parameters.AddWithValue("truck_remarks8", entity.truck_remarks8);
                cmd.Parameters.AddWithValue("truck_remarks9", entity.truck_remarks9);
                cmd.Parameters.AddWithValue("truck_remarks10", entity.truck_remarks10);

                cmd.Parameters.AddWithValue("truck_remarks_all", entity.truck_remarks_all);
                cmd.Parameters.AddWithValue("delivery_acceptance", entity.delivery_acceptance);
                 cmd.Parameters.AddWithValue("resack_others", entity.resack_others);
                cmd.Parameters.AddWithValue("qty_reject_uom", entity.qty_reject_uom);
                //end of rejection side
                cmd.Parameters.AddWithValue("lab_1", entity.lab_1);
                cmd.Parameters.AddWithValue("lab_2", entity.lab_2);
                cmd.Parameters.AddWithValue("lab_3", entity.lab_3);
                cmd.Parameters.AddWithValue("lab_4", entity.lab_4);
                cmd.Parameters.AddWithValue("lab_5", entity.lab_5);
                cmd.Parameters.AddWithValue("lab_6", entity.lab_6);
                cmd.Parameters.AddWithValue("lab_7", entity.lab_7);
                cmd.Parameters.AddWithValue("lab_8", entity.lab_8);
                cmd.Parameters.AddWithValue("lab_9", entity.lab_9);
                cmd.Parameters.AddWithValue("lab_10", entity.lab_10);

                cmd.Parameters.AddWithValue("phys_1", entity.phys_1);
                cmd.Parameters.AddWithValue("phys_2", entity.phys_2);
                cmd.Parameters.AddWithValue("phys_3", entity.phys_3);
                cmd.Parameters.AddWithValue("phys_4", entity.phys_4);
                cmd.Parameters.AddWithValue("phys_5", entity.phys_5);
                cmd.Parameters.AddWithValue("phys_6", entity.phys_6);
                cmd.Parameters.AddWithValue("phys_7_total", entity.phys_7_total);

                cmd.Parameters.AddWithValue("class_macro", entity.class_macro);

                cmd.Parameters.AddWithValue("point_origin", entity.point_origin);
                cmd.Parameters.AddWithValue("infestation", entity.infestation);
                cmd.Parameters.AddWithValue("drying_method", entity.drying_method);
                cmd.Parameters.AddWithValue("other_test", entity.other_test);
                cmd.Parameters.AddWithValue("result", entity.result);
                cmd.Parameters.AddWithValue("other_test_remarks", entity.other_test_remarks);
                cmd.Parameters.AddWithValue("result_remarks", entity.result_remarks);

                cmd.Parameters.AddWithValue("additional_unloading", entity.additional_unloading);
                cmd.Parameters.AddWithValue("additional_unloading_remarks", entity.additional_unloading_remarks);
                cmd.Parameters.AddWithValue("start_load", entity.start_load);
                cmd.Parameters.AddWithValue("stop_load", entity.stop_load);
                cmd.Parameters.AddWithValue("@Image", entity.Image);
                int rs = cmd.ExecuteNonQuery();

                return rs;

            }
        }

        //View user details list
        public List<EditMacroModel> ViewMacroDetailsList()
        {
            List<EditMacroModel> _EditMacroModel = new List<EditMacroModel>();

            using (SqlConnection conn = new SqlConnection(DBCon))
            {
                using (SqlCommand cmd = new SqlCommand("GetChecklistMacro", conn))//call Stored Procedure
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        EditMacroModel __EditMacroModel = new EditMacroModel();
                        __EditMacroModel.po_sum_id = int.Parse(reader["po_sum_id"].ToString());
                        __EditMacroModel.item_description = reader["item_description"].ToString();;
                        __EditMacroModel.qty_total_delivered = reader["qty_total_delivered"].ToString();
                        __EditMacroModel.qty_ordered = reader["qty_ordered"].ToString();
                        __EditMacroModel.import_date = reader["import_date"].ToString();
                        __EditMacroModel.qty_delivered = reader["qty_delivered"].ToString();
                        __EditMacroModel.qty_waiting = reader["qty_waiting"].ToString();
                        __EditMacroModel.expiry_date = reader["expiry_date"].ToString();
                        __EditMacroModel.pr_number = reader["pr_number"].ToString();
                        __EditMacroModel.pr_date = reader["pr_date"].ToString();
                        __EditMacroModel.po_number = reader["po_number"].ToString();
                        __EditMacroModel.po_date = reader["po_date"].ToString();
                        __EditMacroModel.vendor_name = reader["vendor_name"].ToString();
                        __EditMacroModel.item_code = reader["item_code"].ToString();
                        __EditMacroModel.qty_uom = reader["qty_uom"].ToString();

                        __EditMacroModel.checklist_remarks = reader["checklist_remarks"].ToString();//hello
                        __EditMacroModel.qty_good = reader["qty_good"].ToString();//hello
                        __EditMacroModel.qty_void = reader["qty_void"].ToString();
                        __EditMacroModel.qty_remarks = reader["qty_remarks"].ToString();
                        __EditMacroModel.stacking_level = reader["stacking_level"].ToString();
                        //__EditUserModel.Image = (byte[])reader["Image"];

                        _EditMacroModel.Add(__EditMacroModel);
                    }
                }
            }

            return _EditMacroModel;

        }







    }
}