using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class UnitOfMeasurementModel : BaseModel<UnitOfMeasurementModel>
    {
        public static IEnumerable<UnitOfMeasurement> FindAll()
        {
            return _db.UnitOfMeasurements.AsEnumerable();
        }
        public static void Add(UnitOfMeasurement o, string user)
        {
            _db.UnitOfMeasurements.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(UnitOfMeasurement o, string user)
        {
            var result = from r in _db.UnitOfMeasurements where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(UnitOfMeasurement o, string user)
        {
            var result = from r in _db.UnitOfMeasurements where r.Id == o.Id select r;
            _db.UnitOfMeasurements.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
