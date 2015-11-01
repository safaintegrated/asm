using Data.Entity;
using Data.Enum;
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

            var e = Data.Models.EmployeeModel.FindByUserId(userName);

            Workflow wf = new Workflow
             {
                 DateTime = dt,
                 ProcessTypeEnum = ProcessTypeEnum.PurchaseRequest,
                 ProcessStateEnum =ProcessStateEnum.DraftByRequestor,
                 //UserName = userName,
                 //Employee = e,
                 EmployeeId = e.Id,
                 EmployeePtjCode = e.PtjCode,
                  EmployeeUserName = e.UserId,
                   EmployeeFullName = e.FullName,
                 Description = "",
                 ProcessId = pr.Id,
             };
            Data.Models.WorkflowModel.Add(wf, userName);
            return pr;
        }

        public PurchaseRequest UpdatePrState(PurchaseRequest pr, ProcessStateEnum e, string detail, string userName)
        {
            pr.Status = e;
            if (e == ProcessStateEnum.SubmittedByRequestor)
            {
                if ((0 >= pr.TotalPrice) && (pr.TotalPrice <= 100000))
                {
                    pr.ProcessCategory = ProcessDetailCategory.PrValueUnder1k;
                    var pcs = Data.Models.ChecklistModel.FindAllByProcessCategory(pr.ProcessCategory);
                    foreach (var pc in pcs)
                    {
                        //Data.Models
                    }
                    //pr.Checklist.Add(pc);
                }
                if ((100000 > pr.TotalPrice) && (pr.TotalPrice <= 2000000))
                {
                    pr.ProcessCategory = ProcessDetailCategory.PrValueUnder20k;
                    var pcs = Data.Models.ChecklistModel.FindAllByProcessCategory(pr.ProcessCategory);
                    foreach (var pc in pcs)
                    {
                        //Data.Models
                    }
                        //pr.Checklist.Add(pc);
                }
                if ((2000000 > pr.TotalPrice) && (pr.TotalPrice <= 5000000))
                {
                    pr.ProcessCategory = ProcessDetailCategory.PrValueBetweek20kTo50k;
                }
                if (pr.TotalPrice > 5000000)
                {
                    pr.ProcessCategory = ProcessDetailCategory.PrValueMoreThan50k;
                }
            }
            Data.Models.PurchaseRequestModel.AddOrUpdate(pr, userName);
            Employee employee = Data.Models.EmployeeModel.FindByUserId(userName);
            Workflow wf = new Workflow
            {
                DateTime = DateTime.Now,
                ProcessTypeEnum = ProcessTypeEnum.PurchaseRequest,
                ProcessStateEnum = pr.Status,
                //UserName = userName,
                //Employee = employee,
                EmployeeFullName = employee.FullName,
                EmployeeUserName = employee.UserId,
                EmployeePtjCode = employee.PtjCode,
                EmployeeId = employee.Id,
                Description = "",
                ProcessId = pr.Id,
            };
            Data.Models.WorkflowModel.Add(wf, userName);

            return pr;
        }

    
        public PurchaseRequestItem AddPrItem(PurchaseRequestItem pri, string userName)
        {
            Data.Models.PurchaseRequestItemModel.Add(pri, userName);

            return pri;
        }
    }
}
