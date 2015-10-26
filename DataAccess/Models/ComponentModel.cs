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
            return _db.Components.AsEnumerable();
        }
        public static void Add(Component o, string user)
        {
            _db.Components.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(Component o, string user)
        {
            var result = from r in _db.Components where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(Component o, string user)
        {
            var result = from r in _db.Components where r.Id == o.Id select r;
            _db.Components.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
