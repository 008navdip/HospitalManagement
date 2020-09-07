using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HospitalManagement.Models
{
    public class Diagnose
    {
        [Key]
        public int DiagNo { get; set; } // Make DiagNo a Primary Key
        public string DiagnosisDetails { get; set; } // some details about Diagnosis 
        public string Remarks { get; set; } // Remarks on diagnosis
        [DataType(DataType.Date)]
        public DateTime DiagnosisDate { get; set; } // Date of diagnosis
        [ForeignKey("Patient")]
        public int PatientId { get; set; } // Foreign Key for Patient
        public Patient Patient { get; set; }
    }
}
