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
            return Db.ProjectItemList.AsEnumerable();
        }
        public static void Add(ProjectItem o, string user)
        {
            Db.ProjectItemList.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(ProjectItem o, string user)
        {
            var result = from r in Db.ProjectItemList where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(ProjectItem o, string user)
        {
            var result = from r in Db.ProjectItemList where r.Id == o.Id select r;
            Db.ProjectItemList.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
