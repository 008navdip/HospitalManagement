using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Diagnosis
{
    public class DeleteModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public DeleteModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Diagnose Diagnose { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Diagnose = await _context.Diagnose
                .Include(d => d.Patient).FirstOrDefaultAsync(m => m.DiagNo == id);

            if (Diagnose == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Diagnose = await _context.Diagnose.FindAsync(id);

            if (Diagnose != null)
            {
                _context.Diagnose.Remove(Diagnose);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
