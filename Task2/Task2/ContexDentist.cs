using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task2
{
   public  class ContexDentist:DbContext
    {
        public DbSet<Priem> Priems { get; set; }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<Uslugy> Uslugies { get; set; }
        public DbSet<Doctor> Doctors { get; set; }
        
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=Homework1Db;Trusted_Connection=True;");
        }
    }
}
