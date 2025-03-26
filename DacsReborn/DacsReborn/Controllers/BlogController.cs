using Microsoft.AspNetCore.Mvc;

namespace DacsReborn.Controllers
{
    public class BlogController : Controller
    {
        public ActionResult Index()
        {
            // Trả về view của trang Blog
            return View();
        }
    }
}
