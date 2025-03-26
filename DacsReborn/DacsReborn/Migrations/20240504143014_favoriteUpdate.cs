using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DacsReborn.Migrations
{
    /// <inheritdoc />
    public partial class favoriteUpdate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "FavoriteId",
                table: "FavoriteItems",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Favorite",
                columns: table => new
                {
                    FavoriteId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Favorite", x => x.FavoriteId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_FavoriteItems_CategoryId",
                table: "FavoriteItems",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_FavoriteItems_FavoriteId",
                table: "FavoriteItems",
                column: "FavoriteId");

            migrationBuilder.AddForeignKey(
                name: "FK_FavoriteItems_Categories_CategoryId",
                table: "FavoriteItems",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "CateId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FavoriteItems_Favorite_FavoriteId",
                table: "FavoriteItems",
                column: "FavoriteId",
                principalTable: "Favorite",
                principalColumn: "FavoriteId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_FavoriteItems_Categories_CategoryId",
                table: "FavoriteItems");

            migrationBuilder.DropForeignKey(
                name: "FK_FavoriteItems_Favorite_FavoriteId",
                table: "FavoriteItems");

            migrationBuilder.DropTable(
                name: "Favorite");

            migrationBuilder.DropIndex(
                name: "IX_FavoriteItems_CategoryId",
                table: "FavoriteItems");

            migrationBuilder.DropIndex(
                name: "IX_FavoriteItems_FavoriteId",
                table: "FavoriteItems");

            migrationBuilder.DropColumn(
                name: "FavoriteId",
                table: "FavoriteItems");
        }
    }
}
