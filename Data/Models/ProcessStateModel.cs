using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class ProcessStateModel : BaseModel<ProcessStateModel>
    {
        public static IEnumerable<ProcessState> FindAll()
        {
            return _db.ProcessStateList.AsEnumerable();
        }
        public static void Add(ProcessState o, string user)
        {
            _db.ProcessStateList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(ProcessState o, string user)
        {
            var result = from r in _db.ProcessStateList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(ProcessState o, string user)
        {
            var result = from r in _db.ProcessStateList where r.Id == o.Id select r;
            _db.ProcessStateList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

        public static ProcessState FindByType(ProcessStateType processStateType)
        {
            return _db.ProcessStateList.Where(c => c.State == processStateType).FirstOrDefault();
        }
    }
}
