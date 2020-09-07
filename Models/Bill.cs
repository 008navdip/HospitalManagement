using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Bill
    {
        [Key] // Data Annotation
        public int BillNo { get; set; } // Make BillNo a Primary Key
        [ForeignKey("Patient")]
        public int PatientId { get; set; } // Foreign Key for Patient Table
        public Patient Patient { get; set; }
        public double Amount { get; set; } // Bill Amount

    }
}
