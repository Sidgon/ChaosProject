using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL;
using BLL;
using ChaosWeb.Models;

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
        [HttpPost]
        public ActionResult Login(LoginView loginVM)
        {
            if (ModelState.IsValid)
            {
                //BLL
                UserManager usermanager = new UserManager();
                bool isCorrect = usermanager.checkUser(loginVM.Login, loginVM.Password);

                if (!isCorrect)
                {
                    ModelState.AddModelError(string.Empty, "Username or password are incorrect");

                    return View(loginVM);
                }
                User userlogin = new User();
                List<User> users = usermanager.GetUsers();
                foreach (User u in users)
                {
                    if (u.Login.Equals(loginVM.Login))
                    {
                        userlogin = u;
                    }
                }

                return RedirectToAction("UserDetails", new { id = userlogin.Id });

            }
            return View(loginVM);
        }

        public ActionResult UserDetails(int id)
        {
            UserManager usermanager = new UserManager();
            List<User> user = usermanager.GetUsers();
            for (int i = 0; i < user.Count; i++)
                if (user[i].Id == id)
                {
                    User m = new User();
                    m = user[i];
                    return View(m);
                }
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

        public ActionResult ListUser(string firstname, string lastname)
        {

            UserManager usermanager = new UserManager();
            List<User> listUsers = usermanager.GetUsers();
            if (firstname == null && lastname == null)
            {
                return View(listUsers);
            }
            List<User> foundUsers = new List<User>();

            foreach (User u in listUsers)
            {
                if (u.Firstname.ToLower().Equals(firstname.ToLower()) && u.Lastname.ToLower().Equals(lastname.ToLower()))
                {
                    foundUsers.Add(u);
                }
            }
            return View(foundUsers);
        }





        public ActionResult Map()
        {
            LocationManager sm = new LocationManager();
            List <Location> list= sm.getLocation();
            return View(list);
        }

       
    }
}