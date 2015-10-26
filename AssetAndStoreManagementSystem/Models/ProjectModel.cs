using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class ProjectModel : BaseModel<ProjectModel>
    {
        public static IEnumerable<Project> FindAll()
        {
            return Db.Projects.AsEnumerable();
        }
        public static void Add(Project o, string user)
        {
            Db.Projects.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Project o, string user)
        {
            var result = from r in Db.Projects where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Project o, string user)
        {
            var result = from r in Db.Projects where r.Id == o.Id select r;
            Db.Projects.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
