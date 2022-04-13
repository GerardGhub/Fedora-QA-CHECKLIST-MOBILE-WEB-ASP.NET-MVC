using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace SodetsoUsersManagement.Models
{
    public class UsersManagementModel
    {
    }
    public class AddUserModel
    {
        [Required]
        [Display(Name = "Firstname")]
        public string Firstname { get; set; }

        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Gender { get; set; }

        [Required]
        [Display(Name = "Email")]
        //Using Remote validation attribute
        [Remote("IsUserExists", "UsersManagement", HttpMethod = "POST", ErrorMessage = "Email already exists!")]
        public string Email { get; set; }

        public string Phone { get; set; }
        public string Position { get; set; }

        [Required]
        [Display(Name = "Password")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        public string Password { get; set; }

        [Required]
        [Display(Name = "Confirm Password")]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Password confirmation must match password.")]
        public string CPassword { get; set; }

        public byte[] Image { get; set; }

        public IEnumerable<GenderModel> sex { get; set; }
    }

    public class GenderModel
    {
        public string GenderID { get; set; }
        public string Description { get; set; }
    }















    public class UsersListModel
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
        public string return_cancelled_po_by { get; set; }

        public string QA_by { get; set; }
        public string unit_price { get; set; }
    }



    public class EditUserModel
    {

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
        [Display(Name = "Truck Remarks 3")]
        public string truck_remarks3 { get; set; }
        [Required]
        [Display(Name = "Truck Remarks 4")]
        public string truck_remarks4 { get; set; }

        [Required]
        [Display(Name = "Truck Remarks 2")]
        public string truck_remarks2 { get; set; }

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
}