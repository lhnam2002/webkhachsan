namespace DacsReborn.Models
{
    public class BookingDetail
    {
        public int Id { get; set; }

        public int BookingId { get; set; }

        public int RoomId { get; set; }

        public decimal Price { get; set; }

        public DateTime NgayCheckin { get; set; }

        public DateTime NgayCheckout { get; set; }
        public Booking Booking { get; set; }
        public Room Room { get; set; }
    }
}
