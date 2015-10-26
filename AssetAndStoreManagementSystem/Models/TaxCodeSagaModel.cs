using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{

    public class TaxCodeSagaModel : BaseModel<TaxCodeSagaModel>
    {
        public static IEnumerable<TaxCodeSaga> FindAll()
        {
            return Db.TaxCodesSaga.AsEnumerable();
        }
        public static void Add(TaxCodeSaga o, string user)
        {
            Db.TaxCodesSaga.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(TaxCodeSaga o, string user)
        {
            var result = from r in Db.TaxCodesSaga where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(TaxCodeSaga o, string user)
        {
            var result = from r in Db.TaxCodesSaga where r.Id == o.Id select r;
            Db.TaxCodesSaga.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
