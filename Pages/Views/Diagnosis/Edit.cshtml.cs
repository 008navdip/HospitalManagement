using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Diagnosis
{
    public class EditModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public EditModel(HospitalManagement.Data.HospitalManagementContext context)
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
           ViewData["PatientId"] = new SelectList(_context.Patient, "PatientId", "PatientId");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(Diagnose).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DiagnoseExists(Diagnose.DiagNo))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool DiagnoseExists(int id)
        {
            return _context.Diagnose.Any(e => e.DiagNo == id);
        }
    }
}
