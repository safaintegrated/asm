using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class PurchaseRequestItemModel : BaseModel<PurchaseRequestItemModel>
    {
        public static IEnumerable<PurchaseRequestItem> FindAll()
        {
            return _db.PurchaseRequestItems.AsEnumerable();
        }
        public static void Add(PurchaseRequestItem o, string user)
        {
            _db.PurchaseRequestItems.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseRequestItem o, string user)
        {
            var result = from r in _db.PurchaseRequestItems where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseRequestItem o, string user)
        {
            var result = from r in _db.PurchaseRequestItems where r.Id == o.Id select r;
            _db.PurchaseRequestItems.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
