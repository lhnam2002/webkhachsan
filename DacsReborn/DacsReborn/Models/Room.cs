using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class Room
    {
        [Key]
        public int RoomId { get; set; }
        [Required, StringLength(100)]
        public string Name { get; set; }
        [Range(0.01, 999999999.00)]
        public decimal Price { get; set; }
        public string Description { get; set; }

        public string? ImageUrl { get; set; }
        public string? Image1 { get; set; }
        public string? Image2 { get; set; }
        //public string? Image3 { get; set; }
        public List<RoomImage>? Images { get; set; }
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
    }
}
