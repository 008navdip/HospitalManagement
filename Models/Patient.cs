using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Patient
    {
        [Key] // Key Data Annotation is used to Set Primary Key
        public int PatientId { get; set; } // Here PatientId is set as Priamry Key
        public string Name { get; set; } // NAme
        public int Age { get; set; } // Age
        public string Gender { get; set; } // Gender
        [ForeignKey("Doctor")]
        public int DrCode { get; set; } // Foregin Key from Dr Table
        public Doctor Doctor { get; set; }
        public IList<Bill> Bill { get; set; } // Iteratable List for Many Bills
        public IList<Diagnose> Diagnose { get; set; } // Iteratable List for Many Diagnosis

        //ctor
        public Patient()
        {
            // initialization
            Bill = new List<Bill>();
            Diagnose = new List<Diagnose>();
        }

    }
}
