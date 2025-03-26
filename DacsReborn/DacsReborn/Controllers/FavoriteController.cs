using DacsReborn.Extensions;
using DacsReborn.Models;
using DacsReborn.Repository;
using Microsoft.AspNetCore.Mvc;

namespace DacsReborn.Controllers
{
    public class FavoriteController : Controller
    {
        private readonly IRoomRepository _roomRepository;

        public FavoriteController(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;

        }
        public async Task<IActionResult> AddToWishlist(int roomId)
        {
            // Giả sử bạn có phương thức lấy thông tin sản phẩm từ productId
            var room = await GetProductFromDatabase(roomId);
            var wlItem = new FavoriteItem
            {
                RoomId = roomId,
                Name = room.Name,
                Price = room.Price,
                Description = room.Description,
                ImageUrl = room.ImageUrl,
                Category = room.Category,
                
            };
            var wl =
           HttpContext.Session.GetObjectFromJson<Favorite>("Wishlist") ?? new Favorite();
            wl.AddItem(wlItem);
            HttpContext.Session.SetObjectAsJson("Wishlist", wl);
            return RedirectToAction("Index");
        }
        public IActionResult Index()
        {
            var wl =
           HttpContext.Session.GetObjectFromJson<Favorite>("Wishlist") ?? new Favorite();
            return View(wl);
        }
        // Các actions khác...
        private async Task<Room> GetProductFromDatabase(int roomId)
        {
            // Truy vấn cơ sở dữ liệu để lấy thông tin sản phẩm
            var room = await _roomRepository.GetByIdAsync(roomId);
            return room;
        }
        public IActionResult RemoveFromCart(int roomId)
        {
            var wl =
           HttpContext.Session.GetObjectFromJson<Favorite>("Wishlist");
            if (wl is not null)
            {
                wl.RemoveItem(roomId);
                // Lưu lại giỏ hàng vào Session sau khi đã xóa mục
                HttpContext.Session.SetObjectAsJson("Wishlist", wl);
            }
            return RedirectToAction("Index");
        }

    }
}