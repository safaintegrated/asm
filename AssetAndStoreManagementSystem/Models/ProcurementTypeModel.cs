using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataAccess.Models
{
    public class ProcurementTypeModel : BaseModel<ProcurementTypeModel>
    {
        public static IEnumerable<ProcurementType> FindAll()
        {

            return Db.ProcurementTypes.AsEnumerable();
        }
        public static void Add(ProcurementType o)
        {
            Db.ProcurementTypes.Add(o);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementType o)
        {
            var result = from r in Db.ProcurementTypes where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementType o)
        {
            var result = from r in Db.ProcurementTypes where r.Id == o.Id select r;
            Db.ProcurementTypes.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }
    }
}