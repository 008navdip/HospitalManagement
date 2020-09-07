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
    public class IndexModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public IndexModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public IList<Diagnose> Diagnose { get;set; }

        public async Task OnGetAsync()
        {
            Diagnose = await _context.Diagnose
                .Include(d => d.Patient).ToListAsync();
        }
    }
}
