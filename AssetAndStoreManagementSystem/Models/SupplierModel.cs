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

            return Db.Suppliers.AsEnumerable();
        }
        public static void Add(Supplier product)
        {
            Db.Suppliers.Add(product);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(Supplier o)
        {
            var result = from r in Db.Suppliers where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(Supplier o)
        {
            var result = from r in Db.Suppliers where r.Id == o.Id select r;
            Db.Suppliers.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }

        public static Supplier FindById(string id)
        {
            var result = from r in Db.Suppliers where r.Id == id select r;
            return result.FirstOrDefault();
        }
    }

 
}
