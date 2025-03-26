using DacsReborn.Extensions;
using DacsReborn.Models;
using DacsReborn.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MoMo;
using Newtonsoft.Json.Linq;
using System.Linq;
using System.Threading.Tasks;
using ThanhToanMoMo.Others;

namespace DacsReborn.Controllers
{
    [Authorize]
    public class BookingController : Controller
    {
        private readonly IRoomRepository _roomRepository;
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public BookingController(IRoomRepository roomRepository, ApplicationDbContext context, UserManager<ApplicationUser> userManager)
        {
            _roomRepository = roomRepository;
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> AddToBooking(int roomId, DateTime checkIn, DateTime checkOut)
        {
            var room = await GetRoomFromDatabase(roomId);
            if (room == null)
            {
                return NotFound();
            }

            var bookingItem = new BookingItem
            {
                Id = roomId,
                Name = room.Name,
                Price = room.Price,
                Description = room.Description,
                CheckIn = checkIn,
                CheckOut = checkOut
            };

            var bookingCart = HttpContext.Session.GetObjectFromJson<BookingCart>("BookingCart") ?? new BookingCart();

            try
            {
                bookingCart.AddItem(bookingItem);
                HttpContext.Session.SetObjectAsJson("BookingCart", bookingCart);
                return RedirectToAction("Index");
            }
            catch (ArgumentException ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
                return View("Error");
            }
            catch (InvalidOperationException ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
                return View("Error");
            }
        }

        public IActionResult Index()
        {
            var bookingCart = HttpContext.Session.GetObjectFromJson<BookingCart>("BookingCart") ?? new BookingCart();
            return View(bookingCart);
        }

        public IActionResult Checkout()
        {
            var bookingCart = HttpContext.Session.GetObjectFromJson<BookingCart>("BookingCart");
            if (bookingCart == null || !bookingCart.Items.Any())
            {
                // Xử lý giỏ hàng trống...
                return RedirectToAction("Index");
            }

            var booking = new Booking
            {
                TotalPrice = bookingCart.Items.Sum(i => i.Price * (i.CheckOut - i.CheckIn).Days) // Tính toán tổng giá
            };

            return View(booking);
        }

        [HttpPost]
        public async Task<IActionResult> Checkout(Booking booking)
        {
            var bookingCart = HttpContext.Session.GetObjectFromJson<BookingCart>("BookingCart");
            if (bookingCart == null || !bookingCart.Items.Any())
            {
                // Xử lý giỏ hàng trống...
                return RedirectToAction("Index");
            }

            var user = await _userManager.GetUserAsync(User);
            booking.UserId = user.Id;
            booking.NgayDatPhong = DateTime.UtcNow;
            booking.TotalPrice = bookingCart.Items.Sum(i => i.Price * (i.CheckOut - i.CheckIn).Days); // Tính toán tổng giá
            booking.BookingDetails = bookingCart.Items.Select(i => new BookingDetail
            {
                RoomId = i.Id,
                NgayCheckin = i.CheckIn,
                NgayCheckout = i.CheckOut,
                Price = i.Price
            }).ToList();

            _context.Bookings.Add(booking);
            await _context.SaveChangesAsync();
            HttpContext.Session.Remove("BookingCart");

            return RedirectToAction("BookingCompleted", new { id = booking.BkId }); // Chuyển hướng đến trang xác nhận với ID đơn hàng
        }

        public async Task<IActionResult> BookingCompleted(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            return View(booking);
        }

        public async Task<IActionResult> RemoveFromCart(int roomId, DateTime checkIn, DateTime checkOut)
        {
            var bookingCart = HttpContext.Session.GetObjectFromJson<BookingCart>("BookingCart");
            if (bookingCart != null)
            {
                var itemToRemove = bookingCart.Items.FirstOrDefault(i => i.Id == roomId && i.CheckIn == checkIn && i.CheckOut == checkOut);
                if (itemToRemove != null)
                {
                    bookingCart.RemoveItem(itemToRemove);
                    HttpContext.Session.SetObjectAsJson("BookingCart", bookingCart);
                }
            }
            return RedirectToAction("Index");
        }

        private async Task<Room> GetRoomFromDatabase(int roomId)
        {
            return await _roomRepository.GetByIdAsync(roomId);
        }

        [HttpPost]
        public IActionResult Payment(int tongTien)
        {
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMOOJOI20210710";
            string accessKey = "iPXneGmrJH0G8FOP";
            string serectkey = "sFcbSGRSJjwGxwhhcEktCHWYUuTuPNDB";
            string orderInfo = "Thanh toán online";
            string returnUrl = "https://localhost:7285";
            string notifyurl = "https://Home/SavePayment"; // Địa chỉ URL mà MoMo sẽ gửi kết quả thanh toán đến.
            string amount = tongTien.ToString();
            string orderid = DateTime.Now.Ticks.ToString(); // mã đơn hàng
            string requestId = DateTime.Now.Ticks.ToString();
            string extraData = "";

            string rawHash = "partnerCode=" + partnerCode +
                             "&accessKey=" + accessKey +
                             "&requestId=" + requestId +
                             "&amount=" + amount +
                             "&orderId=" + orderid +
                             "&orderInfo=" + orderInfo +
                             "&returnUrl=" + returnUrl +
                             "&notifyUrl=" + notifyurl +
                             "&extraData=" + extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            string signature = crypto.signSHA256(rawHash, serectkey);

            // Build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }
            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(responseFromMomo);

            return Redirect(jmessage.GetValue("payUrl").ToString());
        }
    }
}
