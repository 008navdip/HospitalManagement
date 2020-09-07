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
    public class IndexModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public IndexModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public IList<Bill> Bill { get;set; }

        public async Task OnGetAsync()
        {
            Bill = await _context.Bill
                .Include(b => b.Patient).ToListAsync();
        }
    }
}
