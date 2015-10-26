using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataAccess.Models
{
    public class ProcurementCategoryModel : BaseModel<ProcurementCategoryModel>
    {
        public static IEnumerable<ProcurementCategory> FindAll()
        {

            return Db.ProcurementCategories.AsEnumerable();
        }
        public static void Add(ProcurementCategory o)
        {
            Db.ProcurementCategories.Add(o);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementCategory o)
        {
            var result = from r in Db.ProcurementCategories where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementCategory o)
        {
            var result = from r in Db.ProcurementCategories where r.Id == o.Id select r;
            Db.ProcurementCategories.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }
    }
}