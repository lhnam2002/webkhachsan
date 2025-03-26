using DacsReborn.Repository;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc;
using DacsReborn.Models;
using Microsoft.AspNetCore.Authorization;

namespace DacsReborn.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin)]
    public class RoomController : Controller
    {
        private readonly IRoomRepository _roomRepository;
        private readonly ICategoryRepository _categoryRepository;

        public RoomController(IRoomRepository productRepository, ICategoryRepository categoryRepository)
        {
            _roomRepository = productRepository;
            _categoryRepository = categoryRepository;
        }

        public async Task<IActionResult> Index()
        {
            var rooms = await _roomRepository.GetAllAsync();
            return View(rooms);
        }
        // Hiển thị form thêm phòng mới
        public async Task<IActionResult> Add()
        {
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "CateId", "Name");
            return View();
        }
        // Xử lý thêm sản phẩm mới
        [HttpPost]
        public async Task<IActionResult> Add(Room room, IFormFile imageUrl, List<IFormFile> imageUrls)
        {
            if (ModelState.IsValid)
            {
                if (imageUrl != null)
                {
                    // Lưu hình ảnh đại diện
                    room.ImageUrl = await SaveImage(imageUrl);
                }
                if (imageUrls != null)
                {
                    //Lưu các hình ảnh
                    foreach (var file in imageUrls)
                    {
                        // Lưu các hình ảnh khác
                        var roomImage = new RoomImage();
                        roomImage.ProductId = room.RoomId;
                        roomImage.Url = await SaveImage(file);

                    }
                }
                await _roomRepository.AddAsync(room);
                return RedirectToAction(nameof(Index));
            }
            // Nếu ModelState không hợp lệ, hiển thị form với dữ liệu đã nhập
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "CateId", "Name");
            return View(room);
        }
        // Hiển thị thông tin chi tiết phòng
        public async Task<IActionResult> Display(int id)
        {
            var room = await _roomRepository.GetByIdAsync(id);
            var category = await _categoryRepository.GetByIdAsync(room.CategoryId);
            ViewBag.Category = category.Name;

            if (room == null)
            {
                return NotFound();
            }
            return View(room);
        }
        // Hiển thị form cập nhật sản phẩm
        public async Task<IActionResult> Update(int id)
        {
            var room = await _roomRepository.GetByIdAsync(id);
            if (room == null)
            {
                return NotFound();
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "CateId", "Name", room.CategoryId);
            ViewBag.Image = room.ImageUrl;
            return View(room);
        }
        // Xử lý cập nhật sản phẩm
        [HttpPost]
        public async Task<IActionResult> Update(int id, Room room, IFormFile imageUrl, List<IFormFile> imageUrls)
        {
            if (id != room.RoomId)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                if (imageUrl != null)
                {
                    // Lưu hình ảnh đại diện
                    room.ImageUrl = await SaveImage(imageUrl);
                }
                await _roomRepository.UpdateAsync(room);
                return RedirectToAction(nameof(Index));
            }
            return View(room);
        }
        // Hiển thị form xác nhận xóa sản phẩm
        public async Task<IActionResult> Delete(int id)
        {
            var room = await _roomRepository.GetByIdAsync(id);
            var category = await _categoryRepository.GetByIdAsync(room.CategoryId);
            ViewBag.Category = category.Name;
            if (room == null)
            {
                return NotFound();
            }
            return View(room);
        }
        // Xử lý xóa sản phẩm
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _roomRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }

        private async Task<string> SaveImage(IFormFile image)
        {
            var savePath = Path.Combine("wwwroot/images/Room", image.FileName); // Thay đổi đường dẫn theo cấu hình của bạn
            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }
            return "/images/Room/" + image.FileName; // Trả về đường dẫn tương đối
        }
    }
}
