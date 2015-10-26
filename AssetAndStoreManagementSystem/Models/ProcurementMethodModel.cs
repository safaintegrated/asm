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

            return Db.ProcurementMethods.AsEnumerable();
        }
        public static void Add(ProcurementMethod o)
        {
            Db.ProcurementMethods.Add(o);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementMethod o)
        {
            var result = from r in Db.ProcurementMethods where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementMethod o)
        {
            var result = from r in Db.ProcurementMethods where r.Id == o.Id select r;
            Db.ProcurementMethods.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }
    }

  

  
}