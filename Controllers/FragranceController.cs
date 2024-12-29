using CourseWork2.Models;
using CourseWork2.EFModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CourseWork2.Controllers
{
    public class FragranceController : Controller
    {
        private readonly ILogger<FragranceController> _logger;
        private readonly Coursework2dbContext _context;

        public FragranceController(ILogger<FragranceController> logger, Coursework2dbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public ActionResult Index()
        {
            Find model = new Find()
            {
                Fragrances = _context.Fragrances.Include(f => f.Brand).ToList()
            };
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(Find model)
        {
            var query = _context.Fragrances
                .Include(f => f.Brand)
                .AsQueryable();

            int parsedId;
            bool isIdSearch = int.TryParse(model.Input, out parsedId);

            if (!string.IsNullOrEmpty(model.Input))
            {
                query = query.Where(fragrance =>
                    fragrance.FragranceName.Contains(model.Input) ||
                    fragrance.Brand.BrandName.Contains(model.Input) ||
                    fragrance.FragranceDescription.Contains(model.Input) ||
                    fragrance.Smell.Contains(model.Input) ||
                    fragrance.Notes.Contains(model.Input) ||
                    (isIdSearch && fragrance.Id == parsedId));
            }

            if (!string.IsNullOrEmpty(model.Gender))
            {
                string genderCode = model.Gender switch
                {
                    "Для неї" => "F",
                    "Для нього" => "M",
                    "Унісекс" => "U",
                    _ => null
                };

                if (!string.IsNullOrEmpty(genderCode))
                {
                    query = query.Where(fragrance => fragrance.Sex.ToString() == genderCode);
                }
            }

            if (model.PriceMin > 0)
            {
                query = query.Where(fragrance => fragrance.Price * (1 - fragrance.DiscountPercentage / 100) >= model.PriceMin);
            }

            if (model.PriceMax > 0)
            {
                query = query.Where(fragrance => fragrance.Price * (1 - fragrance.DiscountPercentage / 100) <= model.PriceMax);
            }

            model.Fragrances = query.ToList();

            return View(model);
        }


        public ActionResult Details(int id)
        {
            Fragrance fragrance = _context.Fragrances
                .Include(f => f.Brand).FirstOrDefault(f => f.Id == id);
            ViewData["Reviews"] = _context.Reviews.Include(r => r.Customer).Where(r => r.FragranceId == fragrance.Id).ToList();
            return View(fragrance);
        }

        public ActionResult Create()
        {
            CreateFragrance model = new CreateFragrance()
            {
                Brands = _context.Brands.ToList()
            };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreateFragrance model)
        {
            if (!ModelState.IsValid)
            {
                _context.Fragrances.Add(model.Fragrance);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            model.Brands = _context.Brands.ToList();

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
        [Route("Fragrance/Delete/{id}")]
        public ActionResult Delete(int id)
        {
            Fragrance fragrance = _context.Fragrances.FirstOrDefault(f => f.Id == id);
            if(fragrance != null)
            {
                _context.Fragrances.Remove(fragrance);
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
