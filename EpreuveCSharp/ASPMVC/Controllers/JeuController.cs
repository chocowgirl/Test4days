using ASPMVC.Mappers;
using ASPMVC.Models.Jeu;
using BLL.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ASPMVC.Controllers
{
    public class JeuController : Controller
    {
        private BLL.Services.JeuService _jeuService;

        public JeuController(JeuService jeuService)
        {
            _jeuService = jeuService;
        }

        // GET: JeuController
        public ActionResult Index()
        {
            try
            {
                IEnumerable<JeuListItem> model = _jeuService.Get().Select(bll => bll.ToListItem());
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        // GET: JeuController/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                JeuDetails model = _jeuService.Get(id).ToDetails();
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }

        }




        // GET: JeuController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: JeuController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
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

        // GET: JeuController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: JeuController/Edit/5
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

        // GET: JeuController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: JeuController/Delete/5
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
