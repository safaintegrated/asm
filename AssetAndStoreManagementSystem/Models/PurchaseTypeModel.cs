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
            return Db.PurchaseTypes.AsEnumerable();
        }
        public static void Add(PurchaseType o, string user)
        {
            Db.PurchaseTypes.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseType o, string user)
        {
            var result = from r in Db.PurchaseTypes where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseType o, string user)
        {
            var result = from r in Db.PurchaseTypes where r.Id == o.Id select r;
            Db.PurchaseTypes.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
