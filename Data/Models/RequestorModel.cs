using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class RequestorModel : BaseModel<RequestorModel>
    {
        public static IEnumerable<Requestor> FindAll()
        {
            return _db.RequestorList.AsEnumerable();
        }
        public static void Add(Requestor o, string user)
        {
            _db.RequestorList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Requestor o, string user)
        {
            var result = from r in _db.RequestorList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Requestor o, string user)
        {
            var result = from r in _db.RequestorList where r.Id == o.Id select r;
            _db.RequestorList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
