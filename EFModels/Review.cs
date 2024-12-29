using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Review
{
    public int Id { get; set; }

    public int CustomerId { get; set; }

    public int FragranceId { get; set; }

    public float? Rating { get; set; }

    public string? ReviewText { get; set; }

    public DateTime? ReviewDate { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual Fragrance Fragrance { get; set; } = null!;
}
