using DacsReborn.Models;
using Microsoft.EntityFrameworkCore;

namespace DacsReborn.Repository
{
    public class EFRoomRepository : IRoomRepository
    {
        private readonly ApplicationDbContext _context;
        public EFRoomRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<Room>> GetAllAsync()
        {
            return await _context.Rooms.Include(x => x.Category).ToListAsync();
        }
        public async Task<Room> GetByIdAsync(int id)
        {
            return await _context.Rooms.FindAsync(id);
        }
        public async Task AddAsync(Room room)
        {
            _context.Rooms.Add(room);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateAsync(Room room)
        {
            _context.Rooms.Update(room);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {

            var product = await _context.Rooms.FindAsync(id);
            _context.Rooms.Remove(product);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Room>> GetAvailableRoomsAsync(DateTime checkin, DateTime checkout)
        {
            var bookedRooms = await _context.BookingDetails
                .Where(b => (b.NgayCheckin < checkout && b.NgayCheckout > checkin))
                .Select(b => b.RoomId)
                .Distinct()
                .ToListAsync();

            var availableRooms = await _context.Rooms
                .Where(r => !bookedRooms.Contains(r.RoomId))
                .ToListAsync();

            return availableRooms;
        }
    }
}
