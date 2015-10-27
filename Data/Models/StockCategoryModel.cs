using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class StockCategoryModel : BaseModel<StockCategoryModel>
    {
        public static IEnumerable<StockCategory> FindAll()
        {
            return _db.StockCategoryList.AsEnumerable();
        }
        public static void Add(StockCategory o, string user)
        {
            _db.StockCategoryList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(StockCategory o, string user)
        {
            var result = from r in _db.StockCategoryList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(StockCategory o, string user)
        {
            var result = from r in _db.StockCategoryList where r.Id == o.Id select r;
            _db.StockCategoryList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }

  
}
