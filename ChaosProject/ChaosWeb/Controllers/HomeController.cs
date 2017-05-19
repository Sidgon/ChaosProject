using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL;
using BLL;

namespace ChaosWeb.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult RegisterView()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterView(User user)
        {
            UserManager um = new UserManager();

            if (ModelState.IsValid)
            {
                //check if the member is already in that database
                if (um.insertUser(user) == -1)
                {
                    ModelState.AddModelError(string.Empty, "Login already used");
                    return View(user);
                }
                else
                {
                    //if not then add him
                    um.insertUser(user);
                }

                //go right to the details of the member
                return RedirectToAction("Login");
            }
            return View(user);

        }


        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}