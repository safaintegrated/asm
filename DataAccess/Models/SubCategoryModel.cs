using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class SubCategoryModel : BaseModel<SubCategoryModel>
    {
        public static IEnumerable<SubCategory> FindAll()
        {
            return _db.SubCategories.AsEnumerable();
        }
        public static void Add(SubCategory o, string user)
        {
            _db.SubCategories.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(SubCategory o, string user)
        {
            var result = from r in _db.SubCategories where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(SubCategory o, string user)
        {
            var result = from r in _db.SubCategories where r.Id == o.Id select r;
            _db.SubCategories.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
        public static IEnumerable<SubCategory> FindAllByCategoryId(string catId)
        {
            var result = from r in _db.SubCategories where r.CategoryId == catId select r;
            return result;
        }
    }

}
