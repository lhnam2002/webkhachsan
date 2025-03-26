using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class Category
    {
        [Key]
        public int CateId { get; set; }
        [Required, StringLength(500)]
        public string Name { get; set; }
        public List<Room> Rooms { get; set; }

    }
}
