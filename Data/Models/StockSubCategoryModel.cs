using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class StockSubCategoryModel : BaseModel<StockSubCategoryModel>
    {
        public static IEnumerable<StockSubCategory> FindAll()
        {
            return _db.StockSubCategoryList.AsEnumerable();
        }
        public static void Add(StockSubCategory o, string user)
        {
            _db.StockSubCategoryList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(StockSubCategory o, string user)
        {
            var result = from r in _db.StockSubCategoryList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(StockSubCategory o, string user)
        {
            var result = from r in _db.StockSubCategoryList where r.Id == o.Id select r;
            _db.StockSubCategoryList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
