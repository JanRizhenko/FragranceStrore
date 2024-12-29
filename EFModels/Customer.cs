using System;
using System.Collections.Generic;

namespace CourseWork2.EFModels;

public partial class Customer
{
    public int Id { get; set; }

    public string CustomerName { get; set; } = null!;

    public string CustomerSurname { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string CustomerEmail { get; set; } = null!;

    public int NumberOfOrders { get; set; }

    public string CountryDelivery { get; set; } = null!;

    public string StateDelivery { get; set; } = null!;

    public string CityDelivery { get; set; } = null!;

    public string AddressDelivery { get; set; } = null!;

    public virtual ICollection<Ordersdetail> Ordersdetails { get; set; } = new List<Ordersdetail>();

    public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
}
