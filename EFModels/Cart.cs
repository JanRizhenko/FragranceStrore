using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Cart
{
    public int Id { get; set; }

    public int FragranceId { get; set; }

    public int? Quantity { get; set; }

    public DateTime? DateAdded { get; set; }

    public virtual Fragrance Fragrance { get; set; } = null!;
}
