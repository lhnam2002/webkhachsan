using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class RoomImage
    {
        [Key]
        public int ImageId { get; set; }
        public string Url { get; set; }
        public int ProductId { get; set; }
        public Room? Room { get; set; }
    }
}
