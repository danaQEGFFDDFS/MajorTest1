using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Task2
{
    public class Doctor
    {
        [Key]
        public int idDoctor{ get; set; }
        public string secondName { get; set; }
        public int cabId { get; set; }
        public string phone { get; set; }
        public DateTime dataLicence { get; set; }
    }
}
