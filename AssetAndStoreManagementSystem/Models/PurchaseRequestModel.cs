using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class PurchaseRequestModel : BaseModel<PurchaseRequestModel>
    {
        public PurchaseRequestModel()
            :base()
        {

        }

        public static IEnumerable<PurchaseRequest> FindAll()
        {
            return Db.PurchaseRequests.AsEnumerable();
        }
        public static void Add(PurchaseRequest o, string user)
        {
            Db.PurchaseRequests.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseRequest o, string user)
        {
            var result = from r in Db.PurchaseRequests where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseRequest o, string user)
        {
            var result = from r in Db.PurchaseRequests where r.Id == o.Id select r;
            Db.PurchaseRequests.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }

        public static PurchaseRequest FindByProcessIdAndRevision(string processId, string revision)
        {
            int rev = int.Parse(revision);
            var result = from r in Db.PurchaseRequests 
                         where r.ProcessId == processId &&
                         r.RevisionNumber == rev
                         select r;
            return result.FirstOrDefault();
        }
    }

}
