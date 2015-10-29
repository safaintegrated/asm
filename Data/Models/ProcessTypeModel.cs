using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class ProcessTypeModel : BaseModel<ProcessTypeModel>
    {
        public static IEnumerable<ProcessType> FindAll()
        {
            return _db.ProcessTypes.AsEnumerable();
        }
        public static void Add(ProcessType o, string user)
        {
            _db.ProcessTypes.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(ProcessType o, string user)
        {
            var result = from r in _db.ProcessTypes where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(ProcessType o, string user)
        {
            var result = from r in _db.ProcessTypes where r.Id == o.Id select r;
            _db.ProcessTypes.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

        public static ProcessType FindByCode(string code)
        {
            return _db.ProcessTypes.Where(c => c.Code == code).FirstOrDefault();
        }
    }

}
