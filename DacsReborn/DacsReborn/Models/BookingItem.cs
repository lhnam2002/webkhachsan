namespace DacsReborn.Models
{
    public class BookingItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string? ImageUrl { get; set; }
        public DateTime CheckOut { get; set; }
        public DateTime CheckIn { get; set; }
        public decimal Price { get; set; }
    }
}
