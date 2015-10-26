using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class LedgerItemModel : BaseModel<LedgerItemModel>
    {
        public static IEnumerable<LedgerItem> FindAll()
        {
            return Db.LedgerItemList.AsEnumerable();
        }
        public static void Add(LedgerItem o, string user)
        {
            Db.LedgerItemList.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(LedgerItem o, string user)
        {
            var result = from r in Db.LedgerItemList where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(LedgerItem o, string user)
        {
            var result = from r in Db.LedgerItemList where r.Id == o.Id select r;
            Db.LedgerItemList.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
