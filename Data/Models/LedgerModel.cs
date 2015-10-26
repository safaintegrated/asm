using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class LedgerModel : BaseModel<LedgerModel>
    {
        public static IEnumerable<Ledger> FindAll()
        {
            return _db.Ledgers.AsEnumerable();
        }
        public static void Add(Ledger o, string user)
        {
            _db.Ledgers.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Ledger o, string user)
        {
            var result = from r in _db.Ledgers where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Ledger o, string user)
        {
            var result = from r in _db.Ledgers where r.Id == o.Id select r;
            _db.Ledgers.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
