using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class WorkflowModel : BaseModel<WorkflowModel>
    {
        public static IEnumerable<Workflow> FindAll()
        {
            return Db.Workflows.AsEnumerable();
        }
        public static void Add(Workflow o, string user)
        {
            Db.Workflows.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Workflow o, string user)
        {
            var result = from r in Db.Workflows where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Workflow o, string user)
        {
            var result = from r in Db.Workflows where r.Id == o.Id select r;
            Db.Workflows.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }

    }
}
