using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class ChecklistModel : BaseModel<ChecklistModel>
    {
        public static IEnumerable<Checklist> FindAll()
        {
            return Db.Checklists.AsEnumerable();
        }
        public static void Add(Checklist o, string user)
        {
            Db.Checklists.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Checklist o, string user)
        {
            var result = from r in Db.Checklists where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Checklist o, string user)
        {
            var result = from r in Db.Checklists where r.Id == o.Id select r;
            Db.Checklists.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }

    }
}
