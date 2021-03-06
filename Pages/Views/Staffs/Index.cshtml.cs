﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Data;
using HospitalManagement.Models;

namespace HospitalManagement.Pages.Views.Staffs
{
    public class IndexModel : PageModel
    {
        private readonly HospitalManagement.Data.HospitalManagementContext _context;

        public IndexModel(HospitalManagement.Data.HospitalManagementContext context)
        {
            _context = context;
        }

        public IList<Staff> Staff { get;set; }

        public async Task OnGetAsync()
        {
            Staff = await _context.Staff
                .Include(s => s.Doctor).ToListAsync();
        }
    }
}
