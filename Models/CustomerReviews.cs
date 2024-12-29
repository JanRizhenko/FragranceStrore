using CourseWork2.EFModels;
using CourseWork2.Models;
namespace CourseWork2.Models
{
    public class CustomerReviews
    {
        public List<Customer> Customers { get; set; }
        public List<Review> Reviews { get; set; }
        public List<Ordersdetail> Ordersdetails { get; set; }
        public List<Cart> Carts { get; set; }
    }
}
