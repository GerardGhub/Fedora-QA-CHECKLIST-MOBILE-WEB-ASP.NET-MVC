using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SodetsoUsersManagement.Models
{
    public class HomeModel
    {
    }
    public class LoginModel
    {
        public string UserID { get; set; }

        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Password")]
        public string Password { get; set; }
    }

    public class LoginResultModel
    {
        public int UserID { get; set; }
        public string Email { get; set; }
        public string Firstname { get; set; }
        public string Position { get; set; }
        public string Lastname { get; set; }
        public byte[] Image { get; set; }
    }

    public class DashboardModels
    {
        public string UsersList { get; set; }
        public string ActiveUsers { get; set; }
        public string InActiveUsers { get; set; }
        public string ArchivedUsers { get; set; }
        public string PoSummaryList { get; set; }
        public string QTYDelivered { get; set; }
        public string ArchivedRawMaterials { get; set; }
        public string ReceivedRawMaterials { get; set; }
        public string MacroRawMaterials { get; set; }
        public string RejectRawMaterials { get; set; }
        public string VendorList { get; set; }
    }
}