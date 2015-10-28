using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class DepartmentModel : BaseModel<DepartmentModel>
    {
        public static IEnumerable<Department> FindAll()
        {
            return _db.Departments.AsEnumerable();
        }
        public static void Add(Department o, string user)
        {
            _db.Departments.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Department o, string user)
        {
            var result = from r in _db.Departments where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Department o, string user)
        {
            var result = from r in _db.Departments where r.Id == o.Id select r;
            _db.Departments.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
