using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Doctor
    {
        [Key] 
        public int DrCode { get; set; } // Make DrCode a Primary Key using [Key] Annotation
        public string Name { get; set; } // Name of the Dr
        public string Gender { get; set; } // Gender of Dr
        public string  Designation { get; set; } // Designation of Dr
        public string Address { get; set; } // address of dr
        public bool Surgeon { get; set; } // is doctor surgeon
        public IList<Patient> Patient { get; set; } // List of Paitnets 
        // ctor
        public Doctor()
        {
            // Initialization
            Patient = new List<Patient>();
        }
    }
}
