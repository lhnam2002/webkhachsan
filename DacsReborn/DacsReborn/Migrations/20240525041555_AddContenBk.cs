using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DacsReborn.Migrations
{
    /// <inheritdoc />
    public partial class AddContenBk : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Content",
                table: "Bookings",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Notes",
                table: "Bookings",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Content",
                table: "Bookings");

            migrationBuilder.DropColumn(
                name: "Notes",
                table: "Bookings");
        }
    }
}
