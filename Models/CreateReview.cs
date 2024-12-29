using CourseWork2.EFModels;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CourseWork2.Models
{
    public class CreateReview
    {
        public int FragranceId { get; set; }

        public int CustomerId { get; set; }

        public float Rating { get; set; }

        public string ReviewText { get; set; }

        public List<Customer> Customers { get; set; }
        public Fragrance Fragrance { get; set; }
    }
}
