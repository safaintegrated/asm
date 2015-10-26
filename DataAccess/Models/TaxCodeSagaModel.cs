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
            return _db.TaxCodesSaga.AsEnumerable();
        }
        public static void Add(TaxCodeSaga o, string user)
        {
            _db.TaxCodesSaga.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(TaxCodeSaga o, string user)
        {
            var result = from r in _db.TaxCodesSaga where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(TaxCodeSaga o, string user)
        {
            var result = from r in _db.TaxCodesSaga where r.Id == o.Id select r;
            _db.TaxCodesSaga.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
