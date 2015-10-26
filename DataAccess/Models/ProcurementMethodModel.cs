using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataAccess.Models
{
    public class ProcurementMethodModel : BaseModel<ProcurementMethodModel>
    {
        public static IEnumerable<ProcurementMethod> FindAll()
        {

            return _db.ProcurementMethods.AsEnumerable();
        }
        public static void Add(ProcurementMethod o)
        {
            _db.ProcurementMethods.Add(o);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementMethod o)
        {
            var result = from r in _db.ProcurementMethods where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementMethod o)
        {
            var result = from r in _db.ProcurementMethods where r.Id == o.Id select r;
            _db.ProcurementMethods.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }
    }

  

  
}