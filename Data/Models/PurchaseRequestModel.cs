using Data.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class PurchaseRequestModel : BaseModel<PurchaseRequestModel>
    {
        public static IEnumerable<PurchaseRequest> FindAll()
        {
            return _db.PurchaseRequests.AsEnumerable();
        }
        public static void Add(PurchaseRequest o, string user)
        {
            _db.PurchaseRequests.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseRequest o, string user)
        {
            var result = from r in _db.PurchaseRequests where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseRequest o, string user)
        {
            var result = from r in _db.PurchaseRequests where r.Id == o.Id select r;
            _db.PurchaseRequests.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

        public static PurchaseRequest FindByProcessIdAndRevision(string processId, string revision)
        {
            int rev = int.Parse(revision);
            var result = from r in _db.PurchaseRequests 
                         where r.ProcessId == processId &&
                         r.RevisionNumber == rev
                         select r;
            return result.FirstOrDefault();
        }

        public static PurchaseRequest FindById(string id)
        {
            return _db.PurchaseRequests.Where(c => c.Id == id).FirstOrDefault();
        }

        public static void AddOrUpdate(PurchaseRequest pr, string userName)
        {
            _db.Entry(pr).State = string.IsNullOrEmpty(pr.Id) ? EntityState.Added : EntityState.Modified;
            _db.SaveChanges(userName);
        }

        //public static IEnumerable<Checklist> FindCheckListByPrId(string prId)
        //{
        //    var pr = _db.PurchaseRequests.Where(c => c.Id == prId).FirstOrDefault();
        //    if (pr == null)
        //        return null;
        //    return pr.Checklist.AsEnumerable();
        //}
    }

}
