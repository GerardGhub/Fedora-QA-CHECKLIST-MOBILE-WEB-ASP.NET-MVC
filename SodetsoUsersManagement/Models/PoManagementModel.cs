using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace SodetsoUsersManagement.Models
{
    public class PoManagementModel
    {
    }

    public class PoSummaryListModel
    {
        public string po_sum_id { get; set; }
        public string pr_number { get; set; }
        public string pr_date { get; set; }
        public string po_number { get; set; }
        public string po_date { get; set; }
        public string item_code { get; set; }
        public string item_description { get; set; }
        public string qty_ordered { get; set; }
        // public byte[] Image { get; set; }
        public string qty_delivered { get; set; }
        public string qty_billed { get; set; }
        public string qty_uom { get; set; }
        public string unit_price { get; set; }
        public string vendor_name { get; set; }
        public DateTime import_date { get; set; }
        public string qty_good {get; set;}
    public string qty_reject {get; set;}
public string qty_remarks {get; set;}
    public string status {get; set;}
        public string expiration_details { get; set; }
      public int IsActive { get; set; }
      //  public int IsArchived { get; set; }

     
    }


    public class EditPoSummaryModel
    {
        public int po_sum_id{ get; set; }
        public string pr_number { get; set; }
        public string pr_date { get; set; }
        public string po_number { get; set; }
        public string po_date { get; set; }
        public string item_code { get; set; }
        public string item_description { get; set; }
        public string qty_ordered { get; set; }
        public string qty_good { get; set; }
        public DateTime? import_date { get; set; }
        public string qty_void { get; set; }
        public string qty_waiting { get; set; }
        public string qty_reject { get; set; }
        public string qty_billed { get; set; }
        public string qty_uom { get; set; }
        public string qty_remarks { get; set; }
        public string vendor_name { get; set; }
        public string expiration_details { get; set; }
        [Required]
        [Display(Name = "qty_good")]
        //public string Firstname { get; set; }
        //public string Middlename { get; set; }
        //public string Lastname { get; set; }
        //public string Gender { get; set; }

        //[Required]
        //[Display(Name = "Email")]
        //public string Email { get; set; }
        //public string Phone { get; set; }
        //public string Position { get; set; }

        //[Required]
        //[Display(Name = "Password")]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        //public string Password { get; set; }

        //[Required]
        //[Display(Name = "Confirm Password")]
        //[System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "Password confirmation must match password.")]
        //public string CPassword { get; set; }
        public byte[] Image { get; set; }

        //public IEnumerable<GenderModel> sex { get; set; }
    }

}