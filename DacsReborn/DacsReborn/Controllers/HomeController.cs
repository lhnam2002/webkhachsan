using DacsReborn.Models;
using DacsReborn.Repository;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DacsReborn.Controllers
{
    public class HomeController : Controller
    {
        private readonly IRoomRepository _roomRepository;

        public HomeController(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;
        }

        public async Task<IActionResult> Index()
        {
            var rooms = await _roomRepository.GetAllAsync();
            return View(rooms);
        }

        [HttpGet]
        public async Task<IActionResult> Search(DateTime checkin, DateTime checkout)
        {
            if (checkin >= checkout)
            {
                ModelState.AddModelError("", "Ngày check-out phải sau ngày check-in.");
                var rooms = await _roomRepository.GetAllAsync();
                return View("Index", rooms); // Trả về toàn bộ phòng nếu có lỗi
            }

            var availableRooms = await _roomRepository.GetAvailableRoomsAsync(checkin, checkout);
            return View("Index", availableRooms); // Trả về các phòng trống
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


    }
}
