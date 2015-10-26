using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class ProcessTypeModel : BaseModel<ProcessTypeModel>
    {
        public static IEnumerable<ProcessType> FindAll()
        {
            return Db.ProcessTypes.AsEnumerable();
        }
        public static void Add(ProcessType o, string user)
        {
            Db.ProcessTypes.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(ProcessType o, string user)
        {
            var result = from r in Db.ProcessTypes where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(ProcessType o, string user)
        {
            var result = from r in Db.ProcessTypes where r.Id == o.Id select r;
            Db.ProcessTypes.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }

}
