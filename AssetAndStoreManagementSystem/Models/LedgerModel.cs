using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class LedgerModel : BaseModel<LedgerModel>
    {
        public static IEnumerable<Ledger> FindAll()
        {
            return Db.Ledgers.AsEnumerable();
        }
        public static void Add(Ledger o, string user)
        {
            Db.Ledgers.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Ledger o, string user)
        {
            var result = from r in Db.Ledgers where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Ledger o, string user)
        {
            var result = from r in Db.Ledgers where r.Id == o.Id select r;
            Db.Ledgers.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
