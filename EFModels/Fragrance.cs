using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Fragrance
{
    public int Id { get; set; }

    public int Stock { get; set; }

    public string? FragranceDescription { get; set; }

    public string? Smell { get; set; }

    public string? Notes { get; set; }

    public Char? Sex { get; set; }

    public float Rating { get; set; }

    public float? DiscountPercentage { get; set; }

    public float Price { get; set; }

    public string FragranceName { get; set; } = null!;

    public int BrandId { get; set; }

    public string? FragrancePhoto { get; set; }

    public virtual Brand Brand { get; set; } = null!;

    public virtual ICollection<Cart> Carts { get; set; } = new List<Cart>();

    public virtual ICollection<Ordersdetail> Ordersdetails { get; set; } = new List<Ordersdetail>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
}
