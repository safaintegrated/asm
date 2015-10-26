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

            return Db.PuDeliveryAddresses.AsEnumerable();
        }
        public static void Add(PuDeliveryAddress o)
        {
            Db.PuDeliveryAddresses.Add(o);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(PuDeliveryAddress o)
        {
            var result = from r in Db.PuDeliveryAddresses where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(PuDeliveryAddress o)
        {
            var result = from r in Db.PuDeliveryAddresses where r.Id == o.Id select r;
            Db.PuDeliveryAddresses.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }


        public static PuDeliveryAddress FindById(string id)
        {
            var result = from r in Db.PuDeliveryAddresses where r.Id == id select r;
            return result.FirstOrDefault();
        }
    }
}
