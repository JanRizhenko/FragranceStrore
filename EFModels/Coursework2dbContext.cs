using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;

namespace CourseWork2.EFModels;

public partial class Coursework2dbContext : DbContext
{
    public Coursework2dbContext()
    {
    }

    public Coursework2dbContext(DbContextOptions<Coursework2dbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Brand> Brands { get; set; }

    public virtual DbSet<Cart> Carts { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Fragrance> Fragrances { get; set; }

    public virtual DbSet<Ordersdetail> Ordersdetails { get; set; }

    public virtual DbSet<Review> Reviews { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=127.0.0.1;port=3306;database=coursework2db;user=root;password=Jan2006mamanana", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.40-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Brand>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("brands");

            entity.HasIndex(e => e.BrandName, "idx_brand_name");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BrandCountry)
                .HasMaxLength(75)
                .HasColumnName("brandCountry")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.BrandCreationDate).HasColumnName("brandCreationDate");
            entity.Property(e => e.BrandFounder)
                .HasMaxLength(150)
                .HasColumnName("brandFounder")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.BrandLogo)
                .HasMaxLength(1500)
                .HasColumnName("brandLogo")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.BrandMainOfficeAddress)
                .HasMaxLength(300)
                .HasColumnName("brandMainOfficeAddress")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.BrandName)
                .HasMaxLength(125)
                .HasColumnName("brandName")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.BrandSite)
                .HasMaxLength(250)
                .HasColumnName("brandSite")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
        });

        modelBuilder.Entity<Cart>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("cart");

            entity.HasIndex(e => e.FragranceId, "FK_cart_fragrance_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DateAdded)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp")
                .HasColumnName("dateAdded");
            entity.Property(e => e.FragranceId).HasColumnName("fragrance_id");
            entity.Property(e => e.Quantity)
                .HasDefaultValueSql("'1'")
                .HasColumnName("quantity");

            entity.HasOne(d => d.Fragrance).WithMany(p => p.Carts)
                .HasForeignKey(d => d.FragranceId)
                .HasConstraintName("FK_cart_fragrance_id");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("customers");

            entity.HasIndex(e => e.CustomerEmail, "customerEmail").IsUnique();

            entity.HasIndex(e => e.PhoneNumber, "phoneNumber").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AddressDelivery)
                .HasMaxLength(250)
                .HasColumnName("addressDelivery")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.CityDelivery)
                .HasMaxLength(100)
                .HasColumnName("cityDelivery")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.CountryDelivery)
                .HasMaxLength(100)
                .HasColumnName("countryDelivery")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.CustomerEmail)
                .HasMaxLength(150)
                .HasColumnName("customerEmail")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(150)
                .IsFixedLength()
                .HasColumnName("customerName");
            entity.Property(e => e.CustomerSurname)
                .HasMaxLength(150)
                .IsFixedLength()
                .HasColumnName("customerSurname");
            entity.Property(e => e.NumberOfOrders).HasColumnName("numberOfOrders");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(13)
                .HasColumnName("phoneNumber");
            entity.Property(e => e.StateDelivery)
                .HasMaxLength(100)
                .HasColumnName("stateDelivery")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
        });

        modelBuilder.Entity<Fragrance>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("fragrances");

            entity.HasIndex(e => e.BrandId, "FK_fragrance_brand_id");

            entity.HasIndex(e => e.FragranceName, "idx_fragrance_name");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BrandId).HasColumnName("brand_id");
            entity.Property(e => e.DiscountPercentage)
                .HasDefaultValueSql("'0.00'")
                .HasColumnType("float(4,2)")
                .HasColumnName("discountPercentage");
            entity.Property(e => e.FragranceDescription)
                .HasMaxLength(750)
                .HasColumnName("fragranceDescription")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.FragranceName)
                .HasMaxLength(75)
                .HasColumnName("fragranceName")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.FragrancePhoto)
                .HasMaxLength(1500)
                .HasColumnName("fragrancePhoto")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.Notes)
                .HasMaxLength(350)
                .HasColumnName("notes")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.Price)
                .HasColumnType("float(8,2)")
                .HasColumnName("price");
            entity.Property(e => e.Rating)
                .HasColumnType("float(2,1)")
                .HasColumnName("rating");
            entity.Property(e => e.Sex)
                .HasMaxLength(1)
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.Smell)
                .HasMaxLength(250)
                .HasColumnName("smell")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.Stock).HasColumnName("stock");

            entity.HasOne(d => d.Brand).WithMany(p => p.Fragrances)
                .HasForeignKey(d => d.BrandId)
                .HasConstraintName("FK_fragrance_brand_id");
        });

        modelBuilder.Entity<Ordersdetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("ordersdetails");

            entity.HasIndex(e => e.CustomerId, "FK_ordersdetails_customer_id");

            entity.HasIndex(e => e.FragranceId, "FK_ordersdetails_fragrance_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.FragranceId).HasColumnName("fragrance_id");
            entity.Property(e => e.Price)
                .HasColumnType("float(8,2)")
                .HasColumnName("price");
            entity.Property(e => e.TotalPrice)
                .HasColumnType("float(8,2)")
                .HasColumnName("totalPrice");

            entity.HasOne(d => d.Customer).WithMany(p => p.Ordersdetails)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_ordersdetails_customer_id");

            entity.HasOne(d => d.Fragrance).WithMany(p => p.Ordersdetails)
                .HasForeignKey(d => d.FragranceId)
                .HasConstraintName("FK_ordersdetails_fragrance_id");
        });

        modelBuilder.Entity<Review>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("reviews");

            entity.HasIndex(e => e.CustomerId, "FK_reviews_customer_id");

            entity.HasIndex(e => e.FragranceId, "FK_reviews_fragrance_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.FragranceId).HasColumnName("fragrance_id");
            entity.Property(e => e.Rating)
                .HasColumnType("float(2,1)")
                .HasColumnName("rating");
            entity.Property(e => e.ReviewDate)
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("timestamp")
                .HasColumnName("reviewDate");
            entity.Property(e => e.ReviewText)
                .HasMaxLength(1000)
                .HasColumnName("reviewText")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");

            entity.HasOne(d => d.Customer).WithMany(p => p.Reviews)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_reviews_customer_id");

            entity.HasOne(d => d.Fragrance).WithMany(p => p.Reviews)
                .HasForeignKey(d => d.FragranceId)
                .HasConstraintName("FK_reviews_fragrance_id");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
