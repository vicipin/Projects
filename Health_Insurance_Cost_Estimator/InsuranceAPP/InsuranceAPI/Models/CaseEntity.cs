using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceAPI.Models
{
    public class CaseEntity
    {
        [Key]
        public int id { get; set; }

        [StringLength(30)]
        public string Name { get; set; }

        [StringLength(30)]
        public string email { get; set; }

        public int age { get; set; }

        [StringLength(30)]
        public string sex { get; set; }

        public int children { get; set; }

        [StringLength(30)]
        public string smoker { get; set; }

        [StringLength(30)]
        public string region { get; set; }
        
        public float cost { get; set; }

    }
}
