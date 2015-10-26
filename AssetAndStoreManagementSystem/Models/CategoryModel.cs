using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class CategoryModel : BaseModel<CategoryModel>
    {
        public static IEnumerable<Category> FindAll()
        {
            return Db.Categories.AsEnumerable();
        }
        public static void Add(Category o, string user)
        {
            Db.Categories.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Category o, string user)
        {
            var result = from r in Db.Categories where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Category o, string user)
        {
            var result = from r in Db.Categories where r.Id == o.Id select r;
            Db.Categories.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
