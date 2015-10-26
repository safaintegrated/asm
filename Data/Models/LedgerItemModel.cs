using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class LedgerItemModel : BaseModel<LedgerItemModel>
    {
        public static IEnumerable<LedgerItem> FindAll()
        {
            return _db.LedgerItemList.AsEnumerable();
        }
        public static void Add(LedgerItem o, string user)
        {
            _db.LedgerItemList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(LedgerItem o, string user)
        {
            var result = from r in _db.LedgerItemList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(LedgerItem o, string user)
        {
            var result = from r in _db.LedgerItemList where r.Id == o.Id select r;
            _db.LedgerItemList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
