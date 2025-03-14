using ASPMVC.Mappers;
using ASPMVC.Models.User;
using BLL.Entities;
//using BLL.Services;
using Common.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASPMVC.Controllers
{
    public class UserController : Controller
    {
        private IUserRepository<User> _userService;

        public UserController(IUserRepository<User> userService)
        {
            _userService = userService;
        }

        // GET: UserController
        public ActionResult Index()
        {
            //IEnumerable<UserListItem> model = _userService.Get();
            //return View(model);
            return View();
        }

        // GET: UserController/Details/5
        public ActionResult Details(Guid id)
        {
            try
            {
                UserDetails model = _userService.Get(id).ToDetails();
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        // GET: UserController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(UserCreateForm form)
        {
            try
            {
                if (!ModelState.IsValid) throw new ArgumentException();
                Guid id = _userService.Insert(form.ToBLL());
                return RedirectToAction(nameof(Details), new {id = id});
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: UserController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
