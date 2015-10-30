using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Supplier : EntityBase
    {
        public Supplier()
        {
            StartDate = new DateTime(1753,1,1);
            EndDate = new DateTime(1753, 1, 1);
        }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address4 { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public string Contact { get; set; }
        public string Status { get; set; }
        public string GlacControlCode { get; set; }
        public string GlacDescription { get; set; }
        public string CertificateNumber { get; set; }
        public string RegistrationReference { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string VatRegstrionNo { get; set; }
        public string BumiStatus { get; set; }
    }
}
