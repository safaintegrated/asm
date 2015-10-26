using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class ChecklistModel : BaseModel<ChecklistModel>
    {
        public static IEnumerable<Checklist> FindAll()
        {
            return _db.Checklists.AsEnumerable();
        }
        public static void Add(Checklist o, string user)
        {
            _db.Checklists.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Checklist o, string user)
        {
            var result = from r in _db.Checklists where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Checklist o, string user)
        {
            var result = from r in _db.Checklists where r.Id == o.Id select r;
            _db.Checklists.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

    }
}
