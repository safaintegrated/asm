using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class SupplierModel : BaseModel<SupplierModel>
    {
        public static IEnumerable<Supplier> FindAll()
        {

            return _db.Suppliers.AsEnumerable();
        }
        public static void Add(Supplier product)
        {
            _db.Suppliers.Add(product);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(Supplier o)
        {
            var result = from r in _db.Suppliers where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(Supplier o)
        {
            var result = from r in _db.Suppliers where r.Id == o.Id select r;
            _db.Suppliers.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }

        public static Supplier FindById(string id)
        {
            var result = from r in _db.Suppliers where r.Id == id select r;
            return result.FirstOrDefault();
        }
    }

 
}
