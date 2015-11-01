using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class PurchaseRequestCheckList : EntityBase
    {
        public string PurchaseRequestId { get; set; }
        public virtual Checklist CheckList { get; set; }

        [NotMapped]
        public string Description {
            get
            {
                if (CheckList == null)
                    return "";
                else
                    return CheckList.Description;
            }
    
    }
        public string CheckListId { get; set; }
        public bool IsChecked { get; set; }
    }
}
