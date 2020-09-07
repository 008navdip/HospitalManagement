using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Patients
{
    public class DetailsModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public DetailsModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public Patient Patient { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Patient = await _context.Patient
                .Include(p => p.Doctor).FirstOrDefaultAsync(m => m.PatientId == id);

            if (Patient == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
