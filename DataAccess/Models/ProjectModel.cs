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
            return _db.Projects.AsEnumerable();
        }
        public static void Add(Project o, string user)
        {
            _db.Projects.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Project o, string user)
        {
            var result = from r in _db.Projects where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Project o, string user)
        {
            var result = from r in _db.Projects where r.Id == o.Id select r;
            _db.Projects.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
