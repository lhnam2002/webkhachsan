using DacsReborn.Models;
using DacsReborn.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace DacsReborn.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryController(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }
        [Authorize(Roles = "Admin, Employee")]
        public async Task<IActionResult> Index()
        {
            var categories = await _categoryRepository.GetAllAsync();
            return View(categories);
        }
        [Authorize(Roles = "Admin, Employee")]
        public async Task<IActionResult> Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(Category category)
        {

            await _categoryRepository.AddAsync(category);
            return RedirectToAction(nameof(Index));
        }
        [Authorize(Roles = "Admin, Employee")]
        public async Task<IActionResult> Display(int id)
        {
            var category = await _categoryRepository.GetByIdAsync(id);
            ViewBag.Category = category.Name;

            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }
        [Authorize(Roles = "Admin, Employee")]
        public async Task<IActionResult> Delete(int id)
        {

            var category = await _categoryRepository.GetByIdAsync(id);
            ViewBag.Category = category.Name;
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> Delete(int id, Category category)
        {
            if (id != category.CateId)
            {
                return NotFound();
            }

            await _categoryRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }
        [Authorize(Roles = "Admin, Employee")]
        public async Task<IActionResult> Update(int id)
        {
            var category = await _categoryRepository.GetByIdAsync(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        [HttpPost]
        public async Task<IActionResult> Update(int id, Category category)
        {
            if (id != category.CateId)
            {
                return NotFound();
            }
            await _categoryRepository.UpdateAsync(category);
            return RedirectToAction(nameof(Index));
        }
    }
}
