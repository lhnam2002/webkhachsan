using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class Amenity
    {
        [Key]
        public int AmId { get; set; }
        [Required, StringLength(500)]
        public string Name { get; set; }
        public List<Room>? Rooms { get; set; }
    }
}
