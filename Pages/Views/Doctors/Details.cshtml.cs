using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Doctors
{
    public class DetailsModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public DetailsModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public Doctor Doctor { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Doctor = await _context.Doctor.FirstOrDefaultAsync(m => m.DrCode == id);

            if (Doctor == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
