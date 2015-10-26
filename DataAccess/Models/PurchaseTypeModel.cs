using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class PurchaseTypeModel : BaseModel<PurchaseTypeModel>
    {
        public static IEnumerable<PurchaseType> FindAll()
        {
            return _db.PurchaseTypes.AsEnumerable();
        }
        public static void Add(PurchaseType o, string user)
        {
            _db.PurchaseTypes.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseType o, string user)
        {
            var result = from r in _db.PurchaseTypes where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseType o, string user)
        {
            var result = from r in _db.PurchaseTypes where r.Id == o.Id select r;
            _db.PurchaseTypes.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
