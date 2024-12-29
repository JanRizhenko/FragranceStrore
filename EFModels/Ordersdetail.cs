using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Ordersdetail
{
    public int Id { get; set; }

    public int FragranceId { get; set; }

    public int CustomerId { get; set; }

    public float Price { get; set; }

    public float TotalPrice { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual Fragrance Fragrance { get; set; } = null!;
}
