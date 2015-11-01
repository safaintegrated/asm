using Data.Enum;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Workflow : EntityBase
    {
        public Workflow()
        {
            DateTime = new DateTime(1753, 1, 1);
        }

        public string ProcessId { get; set; }
        public string Description { get; set; }
        public DateTime DateTime { get; set; }

        [NotMapped]
        public string DateTimeView
        {
            get
            {
                return DateTime.ToString("dd/MM/yyyy HH:mm:ss");
            }
        }

        //public virtual Employee Employee { get; set; }

        public string EmployeeId { get; set; }

        public string EmployeeUserName { get; set; }

        public string EmployeePtjCode { get; set; }

        public string EmployeeFullName { get; set; }

        public ProcessTypeEnum ProcessTypeEnum { get; set; }
        public ProcessStateEnum ProcessStateEnum { get; set; }

        [NotMapped]
        public string ProcessStateString
        {
            get
            {
                return Constant.GetProcessStateDescription(ProcessStateEnum);
            }
        }
    }

    public enum ProcessTypeEnum
    {
        PurchaseRequest
    }


}
