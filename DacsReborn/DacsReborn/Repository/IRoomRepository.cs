using DacsReborn.Models;

namespace DacsReborn.Repository
{
    public interface IRoomRepository
    {
        Task<IEnumerable<Room>> GetAllAsync();
        Task<Room> GetByIdAsync(int id);
        Task AddAsync(Room room);
        Task UpdateAsync(Room room);
        Task DeleteAsync(int id);
        Task<IEnumerable<Room>> GetAvailableRoomsAsync(DateTime checkin, DateTime checkout);
    }
}
