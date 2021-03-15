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
    public class QAPoSummaryCheckController : Controller
    {
        //
        // GET: /QAPoSummaryCheck/
        //

        PoServices _PoServices = new PoServices();
        SystemTools _SystemTools = new SystemTools();

        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult PoList()
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "UsersList";
                return View(_PoServices.MicroUsersList().ToList()); // redirecting to all Users List
  
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        public ActionResult ArchivedRawMaterials()
        {
            ViewBag.ActiveMenu = "UsersList";
            return View(_PoServices.ArchivedRawMaterialsList().ToList()); // redirecting to all Removed Raw Material's List

        }

        public ActionResult ReceivedRawMaterial()
        {
            ViewBag.ActiveMenu = "Raw Materials Received";
            return View(_PoServices.PartialRawMaterialsList().ToList()); // redirecting to all Removed Raw Material's List

        }

        public ActionResult RejectFinalMaterial()
        {
            ViewBag.ActiveMenu = "Raw Materials Reject";
            return View(_PoServices.RejectionsRawMaterialsList().ToList()); // redirecting to all Removed Raw Material's List

        }


        public ActionResult CancelRawMats()
        {
            ViewBag.ActiveMenu = "Cancelled Raw Materials";
            return View(_PoServices.CanceledRawMaterialsList().ToList()); // redirecting to all Removed Raw Material's List

        }

        [HttpGet]
        public ActionResult EditPo(int id)
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "AddUser";
                EditUserModel _EditUserModel = _PoServices.ViewUserDetailsList().Find(uid => uid.po_sum_id == id);
                _EditUserModel.sex = _SystemTools.GetGender();
                return View(_EditUserModel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        [HttpGet]
        public ActionResult PartialReceivingCancel(int id)
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "AddUser";
                EditUserModel _EditUserModel = _PoServices.ViewUserDetailsList2().Find(uid => uid.po_sum_id == id);
                //_EditUserModel.sex = _SystemTools.GetGender();
                return View(_EditUserModel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }

        public ActionResult EditPoRejection(int id)
        {
            if (Session["Email"] != null && Session["UserID"] != null)
            {
                ViewBag.ActiveMenu = "AddUser";
                EditUserModel _EditUserModel = _PoServices.ViewRejectionDetailsList().Find(uid => uid.po_sum_id == id);
                //_EditUserModel.sex = _SystemTools.GetGender();
                return View(_EditUserModel);
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }

        }




        [HttpPost]
        public ActionResult UpdatePo(EditUserModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    HttpPostedFileBase file = Request.Files["ImageData"];
                    _PoServices.UpdateUser(file, model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoList");
            }

        }



        [HttpPost]
        public ActionResult UpdatePoRejection(EditUserModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    HttpPostedFileBase file = Request.Files["ImageData"];
                    _PoServices.UpdateRawRejection(file, model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("RejectFinalMaterial");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("RejectFinalMaterial", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("RejectFinalMaterial");
            }

        }

        [HttpPost]
        public ActionResult ActiveUsersPageDeactivateUser(UsersListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _PoServices.DeactivateActivateUser(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("ActiveUsers");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("ActiveUsers", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("ActiveUsers");
            }

        }
     




        [HttpPost]
        public ActionResult DeactivateActivateUser(UsersListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _PoServices.DeactivateActivateUser(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoList");
            }

        }


        [HttpPost]
        public ActionResult DeactivateActivateRawMaterials(UsersListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _PoServices.DeactivateActivateRawMaterials(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoList");
            }

        }



        [HttpPost]
        public ActionResult CancelQARawMaterials(UsersListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _PoServices.CancelQARawMaterials(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoList");
            }

        }




        [HttpPost]
        public ActionResult CancelQAForReceivingRawMaterials(EditUserModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    HttpPostedFileBase file = Request.Files["ImageData"];
                    _PoServices.CancelQAForReceivingRawMaterials(file, model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("ReceivedRawMaterial");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("ReceivedRawMaterial", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("ReceivedRawMaterial");
            }

        }





        [HttpPost]
        public ActionResult RemoveRawMaterials(UsersListModel model)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    _PoServices.RemoveRawMaterials(model);
                    TempData["Success"] = "Success";
                    return RedirectToAction("PoList");
                }
                catch (Exception e)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    ModelState.AddModelError("", e.Message);
                    TempData["Fail"] = "Fail";
                    return View("PoList", model);
                }
            }
            else
            {
                TempData["ModelsError"] = "Error";
                return RedirectToAction("PoList");
            }

        }

    }
}
