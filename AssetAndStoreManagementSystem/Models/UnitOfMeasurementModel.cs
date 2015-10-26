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
            return Db.UnitOfMeasurements.AsEnumerable();
        }
        public static void Add(UnitOfMeasurement o, string user)
        {
            Db.UnitOfMeasurements.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(UnitOfMeasurement o, string user)
        {
            var result = from r in Db.UnitOfMeasurements where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(UnitOfMeasurement o, string user)
        {
            var result = from r in Db.UnitOfMeasurements where r.Id == o.Id select r;
            Db.UnitOfMeasurements.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
