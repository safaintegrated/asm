using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class StockTypeModel : BaseModel<StockTypeModel>
    {
        public static IEnumerable<StockType> FindAll()
        {
            return _db.StockTypeList.AsEnumerable();
        }
        public static void Add(StockType o, string user)
        {
            _db.StockTypeList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(StockType o, string user)
        {
            var result = from r in _db.StockTypeList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(StockType o, string user)
        {
            var result = from r in _db.StockTypeList where r.Id == o.Id select r;
            _db.StockTypeList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
