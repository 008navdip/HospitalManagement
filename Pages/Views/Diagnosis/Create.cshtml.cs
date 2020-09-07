using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Diagnosis
{
    public class CreateModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public CreateModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["PatientId"] = new SelectList(_context.Patient, "PatientId", "PatientId");
            return Page();
        }

        [BindProperty]
        public Diagnose Diagnose { get; set; }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Diagnose.Add(Diagnose);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
