using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Employee : EntityBase
    {
        public int EmployeeSysId { get; set; }
        public string EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeDesignation { get; set; }
        public string EmployeeEmail { get; set; }
        public string EmploeeTelephone { get; set; }
        public string EmployeeIdNo { get; set; }
        public string PtjCode { get; set; }
        public string PtjName { get; set; }
    }
}
