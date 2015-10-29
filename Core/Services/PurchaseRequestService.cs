using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public class PurchaseRequestService
    {
        public PurchaseRequest CreateNewPr(PurchaseRequest pr, string userName)
        {
            DateTime dt = DateTime.Now;

            Data.Models.PurchaseRequestModel.Add(pr, userName);

            Workflow wf = new Workflow
             {
                 DateTime = dt,
                 ProcessTypeEnum = ProcessTypeEnum.PurchaseRequest,
                 ProcessStateEnum = Data.Entity.ProcessStateEnum.New,
                 UserName = userName,
                 //FullName = pr.RequestorName,
                 Description = "",
                 ProcessId = pr.Id,
                 //ProcessState = Data.Models.ProcessStateModel.FindByType(Data.ProcessStateType.New),
             };
            Data.Models.WorkflowModel.Add(wf, userName);
            return pr;
        }

    }
}
