using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data.Models
{
    public class ProcurementTypeModel : BaseModel<ProcurementTypeModel>
    {
        public static IEnumerable<ProcurementType> FindAll()
        {

            return _db.ProcurementTypes.AsEnumerable();
        }
        public static void Add(ProcurementType o)
        {
            _db.ProcurementTypes.Add(o);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(ProcurementType o)
        {
            var result = from r in _db.ProcurementTypes where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(ProcurementType o)
        {
            var result = from r in _db.ProcurementTypes where r.Id == o.Id select r;
            _db.ProcurementTypes.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }

        public static ProcurementType FindById(string id)
        {
            return _db.ProcurementTypes.Where(c => c.Id == id).FirstOrDefault();
        }
    }
}