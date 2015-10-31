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
        public string UserName { get; set; }
        public string FullName { get; set; }
        public ProcessTypeEnum ProcessTypeEnum { get; set; }
        public ProcessStateEnum ProcessStateEnum { get; set; }
        //public virtual ProcessState ProcessState { get; set; }
        //public virtual ProcessType ProcessType { get; set; }

        [NotMapped]
        public string ProcessStateString
        {
            get
            {
                switch (ProcessStateEnum)
                {
                    case ProcessStateEnum.Draft:
                        return "Draf";
                    case ProcessStateEnum.Submited:
                        return "Baru";
                    case ProcessStateEnum.Updated:
                        return "Kemaskini";
                    case ProcessStateEnum.Approved:
                        return "Diluluskan";
                    case ProcessStateEnum.NotApproved:
                        return "Tidak Lulus";
                    case ProcessStateEnum.Submitted:
                        return "Posted";
                    default:
                        return "";
                }
            }
        }
    }

    public enum ProcessTypeEnum 
    {
        PurchaseRequest
    }

    public enum ProcessStateEnum
    {
        Draft,
        Submited,
        NotApproved,
        Updated,
        Approved,
        Submitted
    }

}
