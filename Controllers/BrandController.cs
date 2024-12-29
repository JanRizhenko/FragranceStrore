using CourseWork2.EFModels;
using CourseWork2.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CourseWork2.Controllers
{
    public class BrandController : Controller
    {

        private readonly ILogger<BrandController> _logger;
        private readonly Coursework2dbContext _context;

        public BrandController(ILogger<BrandController> logger, Coursework2dbContext context)
        {
            _logger = logger;
            _context = context;
        }
        public ActionResult Index()
        {
            Find model = new Find()
            {
                Brands = _context.Brands.ToList()
            };
            return View(model);
        }
        public ActionResult Details(int id)
        {
            Brand brand = _context.Brands.FirstOrDefault(b => b.Id == id);
            return View(brand);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Brand model)
        {
            if (ModelState.IsValid)
            {
                _context.Brands.Add(model);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }
        public ActionResult Edit(int id)
        {
            return View();
        }
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
        [Route("/Brand/Delete/{id}")]
        public ActionResult Delete(int id)
        {
            Brand brand = _context.Brands.FirstOrDefault(b => b.Id == id);
            if(brand != null)
            {
                _context.Brands.Remove(brand);
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }
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
