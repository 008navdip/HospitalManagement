using Microsoft.EntityFrameworkCore.Migrations;

namespace HospitalManagement.Migrations
{
    public partial class addedDoctorRef : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Patient_Doctor_DoctorDrCode",
                table: "Patient");

            migrationBuilder.DropIndex(
                name: "IX_Patient_DoctorDrCode",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "DoctorDrCode",
                table: "Patient");

            migrationBuilder.CreateIndex(
                name: "IX_Patient_DrCode",
                table: "Patient",
                column: "DrCode");

            migrationBuilder.AddForeignKey(
                name: "FK_Patient_Doctor_DrCode",
                table: "Patient",
                column: "DrCode",
                principalTable: "Doctor",
                principalColumn: "DrCode",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Patient_Doctor_DrCode",
                table: "Patient");

            migrationBuilder.DropIndex(
                name: "IX_Patient_DrCode",
                table: "Patient");

            migrationBuilder.AddColumn<int>(
                name: "DoctorDrCode",
                table: "Patient",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Patient_DoctorDrCode",
                table: "Patient",
                column: "DoctorDrCode");

            migrationBuilder.AddForeignKey(
                name: "FK_Patient_Doctor_DoctorDrCode",
                table: "Patient",
                column: "DoctorDrCode",
                principalTable: "Doctor",
                principalColumn: "DrCode",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
