using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Employee : EntityBase
    {
        //public int EmployeeSysId { get; set; }
        //public string EmployeeId { get; set; }
        //public string EmployeeName { get; set; }
        //public string EmployeeDesignation { get; set; }
        //public string EmployeeEmail { get; set; }
        //public string EmploeeTelephone { get; set; }
        //public string EmployeeIdNo { get; set; }
        //public string PtjCode { get; set; }
        //public string PtjName { get; set; }
        public string UserId { get; set; }
        public string Salutation { get; set; }
        public string FullName { get; set; }
        public string IcNo { get; set; }
        public string EmailAddress { get; set; }
        public string HandPhone { get; set; }
        public string OfficeNumber { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Address4 { get; set; }

        public string CurrentDepartmentCode { get; set; }
        public string CurrentDesignationCode { get; set; }
        public string DesignationGrade { get; set; }
        public string StatusCode { get; set; }
        public string StatusName { get; set; }
        public string LevelCode { get; set; }
        public string LevelName { get; set; }
        public string TypeCode { get; set; }
        public string TypeName { get; set; }
        public string UserType { get; set; }
        public string Password { get; set; }
        public string PtjCode { get; set; }
        public string PtjName { get; set; }
        public string DesignationName { get; set; }

    }
}
