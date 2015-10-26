using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class PuDeliveryAddressModel : BaseModel<PuDeliveryAddressModel>
    {
        public static IEnumerable<PuDeliveryAddress> FindAll()
        {

            return _db.PuDeliveryAddresses.AsEnumerable();
        }
        public static void Add(PuDeliveryAddress o)
        {
            _db.PuDeliveryAddresses.Add(o);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(PuDeliveryAddress o)
        {
            var result = from r in _db.PuDeliveryAddresses where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(PuDeliveryAddress o)
        {
            var result = from r in _db.PuDeliveryAddresses where r.Id == o.Id select r;
            _db.PuDeliveryAddresses.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }


        public static PuDeliveryAddress FindById(string id)
        {
            var result = from r in _db.PuDeliveryAddresses where r.Id == id select r;
            return result.FirstOrDefault();
        }
    }
}
