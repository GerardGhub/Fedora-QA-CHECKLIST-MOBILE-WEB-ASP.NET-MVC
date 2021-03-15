using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SodetsoUsersManagement.Services;
using SodetsoUsersManagement.Models;
using System.Net;


namespace SodetsoUsersManagement.Controllers
{
    public class PoSummaryController : Controller
    {
        //
        // GET: /PoSummary/

        PoManagementService _PoManagementService = new PoManagementService();
        SystemTools _SystemTools = new SystemTools();

        public ActionResult PoSummaryList()
        {
            //return View();

            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "PoSummaryList";
                return View(_PoManagementService.PoSummaryList().ToList()); // redirecting to all Users List
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        [HttpGet]
        public ActionResult EditPoSummary(int id)
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "AddUser";
                EditPoSummaryModel _EditPoSummaryModel = _PoManagementService.ViewPoSummaryDetailsList().Find(uid => uid.po_sum_id == id);
              //  _EditUserModel.sex = _SystemTools.GetGender();
                return View(_EditPoSummaryModel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        [HttpPost]
        public ActionResult UpdatePoSummary(EditPoSummaryModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                   HttpPostedFileBase file = Request.Files["ImageData"];
                    _PoManagementService.UpdatePoSummary(file, model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoSummaryList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoSummaryList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoSummaryList");
               
            }

        }

    }
}
