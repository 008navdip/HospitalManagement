using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Bills
{
    public class DetailsModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public DetailsModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public Bill Bill { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Bill = await _context.Bill
                .Include(b => b.Patient).FirstOrDefaultAsync(m => m.BillNo == id);

            if (Bill == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
