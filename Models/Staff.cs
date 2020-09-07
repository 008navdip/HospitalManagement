using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Staff
    {
        [Key] // Data Annotation
        public int StaffId { get; set; } // Make StaffId a Primary key
        public string Name { get; set; } // Name of Staff Memebr
        public string Dept { get; set; } // Department Name
        public string Gender { get; set; } // Gender of member
        public string CellNo { get; set; } // His/her Cell No
        [System.ComponentModel.DataAnnotations.Schema.ForeignKey("Doctor")]
        public int DrCode { get; set; } // Foreign Key from Dr Table
        public Doctor Doctor { get; set; }
    }
}
