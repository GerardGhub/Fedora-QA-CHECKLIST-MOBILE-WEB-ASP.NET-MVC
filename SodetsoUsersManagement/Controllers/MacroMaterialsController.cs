using SodetsoUsersManagement.Models;
using SodetsoUsersManagement.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace SodetsoUsersManagement.Controllers
{
    public class MacroMaterialsController : Controller
    {
        //
        // GET: /MacroMaterials/

        //public ActionResult Index()
        //{
        //    return View();
        //}

        MacroService _MacroServices = new MacroService();
        SystemTools _SystemTools = new SystemTools();

        public ActionResult MacroRawMaterials()
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "UsersList";
                return View(_MacroServices.MacroList().ToList()); // redirecting to all Users List

            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }



        [HttpPost]
        public ActionResult UpdateMacroPo(EditMacroModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    HttpPostedFileBase file = Request.Files["ImageData"];
                    _MacroServices.UpdateMacro(file, model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("MacroRawMaterials");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("MacroRawMaterials", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("MacroRawMaterials");
            }

        }







        [HttpPost]
        public ActionResult CancelQAMacroRawMaterials(MacroListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _MacroServices.CancelQAMacroRawMaterials(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("MacroRawMaterials");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("MacroRawMaterials", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("MacroRawMaterials");
            }

        }









        [HttpGet]
        public ActionResult EditMacroRawMaterials(int id)
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "AddUser";
                EditMacroModel _EditMacroModel = _MacroServices.ViewMacroDetailsList().Find(uid => uid.po_sum_id == id);
                _EditMacroModel.sex = _SystemTools.GetGender();
                return View(_EditMacroModel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }





    }
}
