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
            return Db.SubCategories.AsEnumerable();
        }
        public static void Add(SubCategory o, string user)
        {
            Db.SubCategories.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(SubCategory o, string user)
        {
            var result = from r in Db.SubCategories where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(SubCategory o, string user)
        {
            var result = from r in Db.SubCategories where r.Id == o.Id select r;
            Db.SubCategories.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }

    }

}
