using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Models;

namespace HospitalManagement.Data
{
    public class HospitalManagementContext : DbContext
    {
        public HospitalManagementContext (DbContextOptions<HospitalManagementContext> options)
            : base(options)
        {
        }

        public DbSet<HospitalManagement.Models.Patient> Patient { get; set; }

        public DbSet<HospitalManagement.Models.Doctor> Doctor { get; set; }

        public DbSet<HospitalManagement.Models.Bill> Bill { get; set; }

        public DbSet<HospitalManagement.Models.Diagnose> Diagnose { get; set; }

        public DbSet<HospitalManagement.Models.Staff> Staff { get; set; }
    }
}
