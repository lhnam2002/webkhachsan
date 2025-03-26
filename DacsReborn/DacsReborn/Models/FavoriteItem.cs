﻿using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class FavoriteItem
    {
        [Key]
        public int RoomId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string? ImageUrl { get; set; }
        public int CategoryId { get; set; }

        public Category? Category { get; set; }
    }
}
