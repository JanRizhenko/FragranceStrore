using CourseWork2.EFModels;

namespace CourseWork2.Models
{
    public class Find
    {
        public string Input { set; get; }
        public string Gender { set; get; }
        public float PriceMin { set; get; }
        public float PriceMax { set; get; }
        public List<Fragrance> Fragrances { set; get; }
        public List<Brand> Brands { set; get; }
    }
}
    