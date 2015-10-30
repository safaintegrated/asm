using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Models
{
    public class ProcurementCategoryModel : BaseModel<ProcurementCategoryModel>
    {
        public static IEnumerable<ProcurementCategory> FindAll()
        {

            return _db.ProcurementCategories.AsEnumerable();
        }
        public static void Add(ProcurementCategory o)
        {
            _db.ProcurementCategories.Add(o);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementCategory o)
        {
            var result = from r in _db.ProcurementCategories where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementCategory o)
        {
            var result = from r in _db.ProcurementCategories where r.Id == o.Id select r;
            _db.ProcurementCategories.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }

        public static ProcurementCategory FindById(string id)
        {
            return _db.ProcurementCategories.Where(c => c.Id == id).FirstOrDefault();
        }
    }
}