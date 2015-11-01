using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Enum
{
    public enum ProcessStateEnum
    {
        //Requestor
        DraftByRequestor,
        UpdatedByRequestor,
        SubmittedByRequestor,
        
        //Approval by PTJ
        ApprovedByPtj,
        NotApprovedByPtj,

        CheckedByFinance1,
        ApprovedByFinance1,
        NotApprovedByFinance1,

        ApprovedByFinance2,
        NotApprovedByFinance2,

        SendToSaga,
    }
}
