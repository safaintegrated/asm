using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{   
    public class ProjectItemModel : BaseModel<ProjectItemModel>
    {
        public static IEnumerable<ProjectItem> FindAll()
        {
            return _db.ProjectItemList.AsEnumerable();
        }
        public static void Add(ProjectItem o, string user)
        {
            _db.ProjectItemList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(ProjectItem o, string user)
        {
            var result = from r in _db.ProjectItemList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(ProjectItem o, string user)
        {
            var result = from r in _db.ProjectItemList where r.Id == o.Id select r;
            _db.ProjectItemList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
