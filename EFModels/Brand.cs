using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Brand
{
    public int Id { get; set; }

    public string BrandName { get; set; } = null!;

    public string BrandFounder { get; set; } = null!;

    public DateOnly BrandCreationDate { get; set; }

    public string? BrandCountry { get; set; }

    public string? BrandMainOfficeAddress { get; set; }

    public string? BrandLogo { get; set; }

    public string? BrandSite { get; set; }

    public virtual ICollection<Fragrance> Fragrances { get; set; } = new List<Fragrance>();
}
