using Data.Entity;
using Data.Models;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetAndStoreManagementSystem.Models
{

    public class EmployeeModel : BaseModel<EmployeeModel>
    {
        public static IEnumerable<Employee> FindAll()
        {
            return _db.Employees.AsEnumerable();// _db.Employees.AsEnumerable();
        }

        public static void Add(Employee o, string user)
        {
            _db.Employees.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Employee o, string user)
        {
            var result = from r in _db.Employees where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }

        //Delete record
        public static void Delete(Employee o, string user)
        {
            var result = from r in _db.Employees where r.Id == o.Id select r;
            _db.Employees.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}