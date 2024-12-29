using Microsoft.AspNetCore.Http;
using CourseWork2.EFModels;
using CourseWork2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Mysqlx.Prepare;
using MySqlConnector;

namespace CourseWork2.Controllers
{
    public class CartController : Controller
    {
        private readonly ILogger<CartController> _logger;
        private readonly Coursework2dbContext _context;
        public CartController(ILogger<CartController> logger, Coursework2dbContext context)
        {
            _logger = logger;
            _context = context;
        }
        public ActionResult Index()
        {
            CustomerReviews model = new CustomerReviews()
            {
                Customers = _context.Customers.ToList(),
                Reviews = _context.Reviews.ToList(),
                Carts = _context.Carts
                .Include(c => c.Fragrance)
                .ToList(),
                Ordersdetails = _context.Ordersdetails.Include(od => od.Fragrance).ToList()
            };
            return View(model);
        }

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Create(int id)
        {
            Cart cart = new Cart()
            {
                FragranceId = id
            };
            _context.Carts.Add(cart);
            _context.SaveChanges();
            return RedirectToAction("Index", "Fragrance");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Cart model)
        {
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
        [Route("Cart/Delete/{id}")]
        public ActionResult Delete(int id)
        {
            Cart cart = _context.Carts.FirstOrDefault(c => c.Id == id);
            if(cart != null)
            {
                _context.Carts.Remove(cart);
                _context.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        [Route("Cart/SendOrders/{id}")]
        public ActionResult SendOrders(int id)
        {
            _context.Database.ExecuteSqlRaw("CALL ProcessOrder(@UserId)",
                new MySqlParameter("@UserId", id));

            return RedirectToAction("Index");
        }

    }
}
