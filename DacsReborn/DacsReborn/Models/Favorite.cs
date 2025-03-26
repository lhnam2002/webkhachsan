using System.ComponentModel.DataAnnotations;

namespace DacsReborn.Models
{
    public class Favorite
    {
        [Key]
        public int FavoriteId { get; set; }

        public List<FavoriteItem> Items { get; set; } = new List<FavoriteItem>();

        public void AddItem(FavoriteItem item)
        {
            var existingItem = Items.FirstOrDefault(i => i.RoomId == item.RoomId);
            if (existingItem == null)
            {
                Items.Add(item);
            }
            
        }
        public void RemoveItem(int productId)
        {
            Items.RemoveAll(i => i.RoomId == productId);
        }

    }
}
