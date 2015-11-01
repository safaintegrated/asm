using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class WorkflowModel : BaseModel<WorkflowModel>
    {
        public static IEnumerable<Workflow> FindAllByPrId(string id)
        {
            return _db.Workflows.Where(c => c.ProcessId == id).OrderByDescending(c => c.DateTime).AsEnumerable();
        }
        public static IEnumerable<Workflow> FindAll()
        {
            return _db.Workflows.AsEnumerable().OrderByDescending(c => c.DateTime);
        }
        public static void Add(Workflow o, string user)
        {
            _db.Workflows.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Workflow o, string user)
        {
            var result = from r in _db.Workflows where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Workflow o, string user)
        {
            var result = from r in _db.Workflows where r.Id == o.Id select r;
            _db.Workflows.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

    }
}
