using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class CategoryModel : BaseModel<CategoryModel>
    {
        public static IEnumerable<Category> FindAll()
        {
            return _db.Categories.AsEnumerable();
        }
        public static void Add(Category o, string user)
        {
            _db.Categories.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Category o, string user)
        {
            var result = from r in _db.Categories where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Category o, string user)
        {
            var result = from r in _db.Categories where r.Id == o.Id select r;
            _db.Categories.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
