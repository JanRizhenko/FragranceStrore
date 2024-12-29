using CourseWork2.EFModels;
using CourseWork2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;

namespace CourseWork2.Controllers
{
    public class ReviewController : Controller
    {
        private readonly Coursework2dbContext _context;

        public ReviewController(Coursework2dbContext context)
        {
            _context = context;
        }
        [Route("Review/Delete/{id}")]
        public IActionResult Delete(int id)
        {
            Review review = _context.Reviews.Include(r => r.Fragrance).FirstOrDefault(r => r.Id == id);
            if (review != null)
            {
                _context.Reviews.Remove(review);
                _context.SaveChanges();
            }
            return RedirectToAction("Details","Fragrance", new { id = review.Fragrance.Id });
        }



        [Route("Review/CreateReviewForm/{fragranceId}")]
        public IActionResult CreateReviewForm(int fragranceId)
        {
            var model = new CreateReview
            {
                FragranceId = fragranceId,
                Customers = _context.Customers.ToList(),
                Fragrance = _context.Fragrances.FirstOrDefault(f => f.Id == fragranceId)
            };

            ViewBag.CustomerList = new SelectList(model.Customers, "Id", "CustomerName");
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateReview(CreateReview model)
        {

            if (false)
            {
                model.Customers = _context.Customers.ToList();
                ViewBag.CustomerList = new SelectList(model.Customers, "Id", "CustomerName");
                return View(model);
            }

            var review = new Review
            {
                CustomerId = model.CustomerId,
                FragranceId = model.FragranceId,
                Rating = model.Rating,
                ReviewText = model.ReviewText,
                ReviewDate = DateTime.Now
            };

            _context.Reviews.Add(review);
            _context.SaveChanges();

            return RedirectToAction("Details", "Fragrance", new { id = model.FragranceId });
        }

    }
}
