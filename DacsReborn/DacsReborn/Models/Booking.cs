using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DacsReborn.Models
{
    public class Booking
    {
        [Key]
        public int BkId {  get; set; }
        public string UserId { get; set; }

        public DateTime NgayDatPhong { get; set; }

        public decimal TotalPrice { get; set; }

        public string? Content { get; set; }
        public string? Notes { get; set; }

        [ForeignKey("UserId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }
        public List<BookingDetail> BookingDetails { get; set; }

    }
}
