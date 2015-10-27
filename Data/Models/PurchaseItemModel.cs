using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class PurchaseItemModel : BaseModel<PurchaseItemModel>
    {
        public static IEnumerable<PurchaseItem> FindAll()
        {
            return _db.PurchaseItems.AsEnumerable();
        }
        public static void Add(PurchaseItem o, string user)
        {
            _db.PurchaseItems.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseItem o, string user)
        {
            var result = from r in _db.PurchaseItems where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseItem o, string user)
        {
            var result = from r in _db.PurchaseItems where r.Id == o.Id select r;
            _db.PurchaseItems.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
