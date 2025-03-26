using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using DacsReborn.Models;

namespace DacsReborn.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>

    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
        public DbSet<Amenity> Amenities { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<RoomImage> RoomImages { get; set; }

        public DbSet<FavoriteItem> FavoriteItems { get; set; }
        public DbSet<DacsReborn.Models.Favorite> Favorite { get; set; } = default!;
        //public DbSet<DacsReborn.Models.BookingCart> BookingCart { get; set; } = default!;
        public DbSet<BookingCart> BookingCarts { get; set; }
        public DbSet<BookingItem> BookingItems { get; set; }

        public DbSet<Booking> Bookings { get; set; }
        public DbSet<BookingDetail> BookingDetails { get; set; }



    }
}
