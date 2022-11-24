using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SodetsoUsersManagement.Models
{
    public class MacroModel
    {

    }
    public class EditMacroModel
    {

        [Required]
        [Display(Name ="Start Load")]
        public string start_load { get; set; }

        [Required]
        [Display(Name ="Stop Load")]
        public string stop_load { get; set; }


        [Required]
        [Display(Name = "Plate No")]
        public string plate_no { get; set; }

        [Required]
        [Display(Name = "Truck Scale Rec No")]
        public string truck_scale_rec_no { get; set; }

        [Required]
        [Display(Name = "Vehicle Type")]
        public string vehicle_type { get; set; }

        [Required]
        [Display(Name = "Truck Gross Weight")]
        public string truck_gross_weight { get; set; }


        [Required]
        [Display(Name = "Truck Tare Weight")]
        public string truck_tare_weight { get; set; }


        [Required]
        [Display(Name = "Truck Net Weight")]
        public string truck_net_weight { get; set; }

        [Required]
        [Display(Name = "Actual UOM")]
        public string actual_delivered_uom { get; set; }

        [Required]
        [Display(Name = "Unloading Date")]
        public string unloading_date { get; set; }

        [Required]
        [Display(Name = "Tet Date")]
        public string test_date { get; set; }
       
        [Required]
        [Display(Name = "Lot No")]
        public string lot_no { get; set; }

        [Required]
        [Display(Name = "Delivery Acceptance")]
        public string delivery_acceptance { get; set; }


        [Required]
        [Display(Name = "Re-sack")]
        public string resack_others { get; set; }


        [Required]
        [Display(Name = "Qty Reject UOM")]
        public string qty_reject_uom { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data1 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data2 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data3 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data4 { get; set; }

        public string rej_data5 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data6 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string rej_data7 { get; set; }

        [Required]
        [Display(Name = "Reject Remarks")]
        public string rej_others { get; set; }

        [Required]
        [Display(Name = "Sample Weight 1")]
        public string sample_weight1 { get; set; }

        [Required]
        [Display(Name = "Sample Weight 2")]
        public string sample_weight2 { get; set; }

        [Required]
        [Display(Name = "Sample Weight 3")]
        public string sample_weight3 { get; set; }


        [Required]
        [Display(Name = "COA")]
        public string lab_1 { get; set; }
        [Required]
        [Display(Name = "Moisture %")]
        public string lab_2 { get; set; }

        [Required]
        [Display(Name = "Aflatoxin, pbb")]
        public string lab_3 { get; set; }

        [Required]
        [Display(Name = "T2, pbb")]
        public string lab_4 { get; set; }

        [Required]
        [Display(Name = "Zea, pbb")]
        public string lab_5 { get; set; }

        [Required]
        [Display(Name = "FFA as lauric")]
        public string lab_6 { get; set; }

        [Required]
        [Display(Name = "FFA as oleic")]
        public string lab_7 { get; set; }

        [Required]
        [Display(Name = "Urease")]
        public string lab_8 { get; set; }


        [Required]
        [Display(Name = "Adulterant")]
        public string lab_9 { get; set; }

        [Required]
        [Display(Name = "Brix")]
        public string lab_10 { get; set; }

      
        public string class_macro { get; set; }
        public string infestation { get; set; }
        public string drying_method { get; set; }

        [Required]
        [Display(Name = "Point Origin")]
        public string point_origin { get; set; }

        [Required]
        [Display(Name = "Other Test")]
        public string other_test { get; set; }



        [Required]
        [Display(Name = "Result")]
        public string result { get; set; }



        [Required]
        [Display(Name = "Other Test Remarks")]
        public string other_test_remarks { get; set; }


        [Required]
        [Display(Name = "Result Remarks")]
        public string result_remarks { get; set; }



        [Required]
        [Display(Name = "Unloading Remarks")]
        public string additional_unloading_remarks { get; set; }
        public string additional_unloading { get; set; }

        public string phys_1 { get; set; }

     
        public string phys_2 { get; set; }

     
        public string phys_3 { get; set; }

     
        public string phys_4 { get; set; }

   
        public string phys_5 { get; set; }



        public string phys_6 { get; set; }
        public string phys_7_total { get; set; }

        public string cancel_date { get; set; }
        public string pepe { get; set; }
        public string papa { get; set; }
        public string qty_remarks { get; set; }
        public string rejectioncontrol { get; set; }
        public string CompareActualDelivedtoReject { get; set; }
        public string date_modified_status { get; set; }
        public string tenprecentallowableused { get; set; }
        public string qty_good { get; set; }
        public string qty_void { get; set; }
        public string reverse_mfg_date { get; set; }
        public string reverse_expiry_date { get; set; }
        public string reverse_good_qty { get; set; }
        public string reverse_actual_delivered { get; set; }
        public string reverse_reject_date { get; set; }
        public string reverse_restockin_date { get; set; }
        public string reverse_remarks { get; set; }
        public string DateChecklistCreated { get; set; }
        public int UserID { get; set; }
        public int po_sum_id { get; set; }
        public string qty_total_delivered { get; set; }
        public string item_code { get; set; }

        [Required]
        [Display(Name = "UOM")]
        public string qty_uom { get; set; }

        [Required]
        [Display(Name = "Item Description")]
        public string item_description { get; set; }

        [Required]
        [Display(Name = "Negative Needed")]
        public string FinalFormulaNegative { get; set; }

        [Required]
        [Display(Name = "10 Percent")]
        public string tenPercentAllow { get; set; }

        public string Firstname { get; set; }
        public string pr_number { get; set; }
        public string pr_date { get; set; }
        public string po_number { get; set; }
        public string po_date { get; set; }
        public string import_date { get; set; }

        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Gender { get; set; }



        //[Required]
        //[Display(Name = "Manufacturing Date")]
        [Required]
        [Display(Name = "Mfg Date")]
        //[DataType(DataType.Date)]
        public string mfg_date { get; set; }




        [Required]
        [Display(Name = "Expiry")]
        //[Display(Name = "Start Date:")]
        [DataType(DataType.Date)]

        public string expiry_date { get; set; }

        public string vendor_name { get; set; }
        [Required]
        [Display(Name = "batch number")]
        public string batch_number { get; set; }

        public string qty_delivered { get; set; }

        [Required]
        [Display(Name = "Stacking Level")]
        public string stacking_level { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 1")]
        public string truck_remarks1 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 1")]
        public string truck_remarks2 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 3")]
        public string truck_remarks3 { get; set; }
        [Required]
        [Display(Name = "Truck Remarks 4")]
        public string truck_remarks4 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 5")]
        public string truck_remarks5 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 6")]
        public string truck_remarks6 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 7")]
        public string truck_remarks7 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 8")]
        public string truck_remarks8 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 9")]
        public string truck_remarks9 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 10")]
        public string truck_remarks10 { get; set; }



        [Required]
        [Display(Name = "Truck Remarks")]
        public string truck_remarks_all { get; set; }

        [Required]
        [Display(Name = "Unloading Remarks 1")]
        public string unload_remarks1 { get; set; }

        [Required]
        [Display(Name = "Unloading Remarks 2")]
        public string unload_remarks2 { get; set; }
        [Required]
        [Display(Name = "Unload Remarks 3")]
        public string unload_remarks3 { get; set; }

        [Required]
        [Display(Name = "Unloading Remarks 4")]
        public string unload_remarks4 { get; set; }


        [Required]
        [Display(Name = "Checklist Remarks !")]
        public string checklist_remarks { get; set; }

        public string checklist_approval { get; set; }

        [Required]
        [Display(Name = "Checking Remarks 1")]
        public string checking_remarks1 { get; set; }

        [Required]
        [Display(Name = "Checking Remarks 2")]
        public string checking_remarks2 { get; set; }


        [Required]
        [Display(Name = "Qty Missing")]
        public string qty_missing { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string checking_approval1 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string checking_approval2 { get; set; }


        [Required]
        [Display(Name = "checklist")]
        public string truck_approval1 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval2 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval3 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval4 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval5 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval6 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval7 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval8 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval9 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string truck_approval10 { get; set; }

        [Required]
        [Display(Name = "checklist")]
        public string unload_approval1 { get; set; }
        [Required]
        [Display(Name = "checklist")]
        public string unload_approval2 { get; set; }
        [Required]
        [Display(Name = "checklist")]
        public string unload_approval3 { get; set; }
        [Required]
        [Display(Name = "checklist")]
        public string unload_approval4 { get; set; }


        public string qty_ordered { get; set; }




        public string QA_by { get; set; }
        public string qty_waiting { get; set; }

        public string qty_reject { get; set; }
        [System.ComponentModel.DataAnnotations.Compare("qty_reject", ErrorMessage = "No. of Qty Reject confirmation must match.")]
        public string CQTYReject { get; set; }

        //[Required]
        //[Display(Name = "Email")]
        public string Email { get; set; }
        public string Phone { get; set; }

        public string Position { get; set; }




        public string remarksof_reject1 { get; set; }
        public string remarksof_reject2 { get; set; }
        public string remarksof_reject3 { get; set; }
        public string remarksof_reject4 { get; set; }
        public string remarksof_reject5 { get; set; }
        public string remarksof_reject6 { get; set; }
        ////rejection SIDE
        [Required]
        [Display(Name = "Qty")]
        public string rejectqty1 { get; set; }
        [Required]
        [Display(Name = "Qty2")]
        public string rejectqty2 { get; set; }
        [Required]
        [Display(Name = "Qty3")]
        public string rejectqty3 { get; set; }
        [Required]
        [Display(Name = "Qty4")]
        public string rejectqty4 { get; set; }
        [Required]
        [Display(Name = "Qty5")]
        public string rejectqty5 { get; set; }
        [Required]
        [Display(Name = "Qty6")]
        public string rejectqty6 { get; set; }














        [Required]
        [Display(Name = "Quantity Good")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {1} characters long.", MinimumLength = 1)]
        public string Password { get; set; }

        [Required]
        [Display(Name = "Confirm No. of Quantity Good")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Password confirmation must match password.")]
        public string CPassword { get; set; }



        public byte[] Image { get; set; }

        public IEnumerable<GenderModel> sex { get; set; }
    }



    public class MacroListModel
    {


        public string UserID { get; set; }
        //public string QTYDelivered { get; set; }
        public string batch_number { get; set; }
        public string DateChecklistCreated { get; set; }
        public string UsersList { get; set; }
        public string ActiveUsers { get; set; }
        public string InActiveUsers { get; set; }
        public string ArchivedUsers { get; set; }
        public string PoSummaryList { get; set; }

        public string qty_total_delivered { get; set; }
        public string cancel_date { get; set; }
        //
        public string expiry_date { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string item_description { get; set; }
        public string po_number { get; set; }
        public string po_sum_id { get; set; }
        public string Lastname { get; set; }
        public string vendor_name { get; set; }

        public string Category { get; set; }

        public string qty_ordered { get; set; }
        public string qty_delivered { get; set; }
        public string qty_waiting { get; set; }
        public string stacking_level { get; set; }
        public string truck_remarks1 { get; set; }
        public string truck_remarks2 { get; set; }
        public string truck_remarks3 { get; set; }
        public string truck_remarks4 { get; set; }

        public string truck_approval1 { get; set; }
        public string truck_approval2 { get; set; }
        public string truck_approval3 { get; set; }
        public string truck_approval4 { get; set; }

        public string unload_remarks1 { get; set; }
        public string unload_remarks2 { get; set; }
        public string unload_remarks3 { get; set; }
        public string unload_remarks4 { get; set; }
        public string unload_approval1 { get; set; }
        public string unload_approval2 { get; set; }
        public string unload_approval3 { get; set; }
        public string unload_approval4 { get; set; }

        public string checking_remarks1 { get; set; }
        public string checking_remarks2 { get; set; }

        public string checking_approval1 { get; set; }
        public string checking_approval2 { get; set; }

        public string pr_number { get; set; }
        public string pr_date { get; set; }


        public string item_code { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Position { get; set; }
        public byte[] Image { get; set; }
        public string DateCreated { get; set; }
        public int IsActive { get; set; }
        public int IsArchived { get; set; }

        public string Operation { get; set; }
        public string import_date { get; set; }
        public string qty_void { get; set; }
        public string qty_reject { get; set; }
        public string Password { get; set; }
        public string qty_uom { get; set; }
        public string checklist_approval { get; set; }
        public string checklist_remarks { get; set; }

        public string primary_key { get; set; }
        public string reverse_remarks { get; set; }

        public string reverse_mfg_date { get; set; }
        public string reverse_expiry_date { get; set; }
        public string reverse_good_qty { get; set; }
        public string reverse_actual_delivered { get; set; }
        public string reverse_reject_date { get; set; }
        public string reverse_restockin_date { get; set; }

        public string tenprecentallowableused { get; set; }
        public string date_modified_status { get; set; }
        public string qty_good { get; set; }
        public string qty_remarks { get; set; }

        public string cancelled_po_by { get; set; }

        public string unit_price { get; set; }
    }




}