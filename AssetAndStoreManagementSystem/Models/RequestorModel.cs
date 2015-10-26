using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class RequestorModel : BaseModel<RequestorModel>
    {
        public static IEnumerable<Requestor> FindAll()
        {
            return Db.RequestorList.AsEnumerable();
        }
        public static void Add(Requestor o, string user)
        {
            Db.RequestorList.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Requestor o, string user)
        {
            var result = from r in Db.RequestorList where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Requestor o, string user)
        {
            var result = from r in Db.RequestorList where r.Id == o.Id select r;
            Db.RequestorList.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
