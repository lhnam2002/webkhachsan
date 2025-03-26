using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace DacsReborn.Models
{
    public class BookingCart
    {
        [Key]
        public int BkId { get; set; }
        public List<BookingItem> Items { get; set; } = new List<BookingItem>();

        public void AddItem(BookingItem item)
        {
            var existingItem = Items.FirstOrDefault(i => i.Id == item.Id && i.CheckIn == item.CheckIn && i.CheckOut == item.CheckOut);

            if (existingItem != null)
            {
                throw new InvalidOperationException("This booking already exists in the cart.");
            }
            else
            {
                if (item.CheckIn >= DateTime.Now && item.CheckOut > item.CheckIn)
                {
                    Items.Add(item);
                }
                else
                {
                    throw new ArgumentException("Invalid CheckIn or CheckOut date.");
                }
            }
        }

        public void RemoveItem(BookingItem item)
        {
            var itemToRemove = Items.FirstOrDefault(i => i.Id == item.Id && i.CheckIn == item.CheckIn && i.CheckOut == item.CheckOut);
            if (itemToRemove != null)
            {
                Items.Remove(itemToRemove);
            }
        }
    }
}
