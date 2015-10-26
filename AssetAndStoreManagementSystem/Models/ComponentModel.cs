using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class ComponentModel : BaseModel<ComponentModel>
    {
        public static IEnumerable<Component> FindAll()
        {
            return Db.Components.AsEnumerable();
        }
        public static void Add(Component o, string user)
        {
            Db.Components.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(Component o, string user)
        {
            var result = from r in Db.Components where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Component o, string user)
        {
            var result = from r in Db.Components where r.Id == o.Id select r;
            Db.Components.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }
    }
}
