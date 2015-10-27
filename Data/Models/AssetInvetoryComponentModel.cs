using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class AssetInvetoryComponentModel : BaseModel<AssetInvetoryComponentModel>
    {
        public static IEnumerable<AssetInvetoryComponent> FindAll()
        {
            return _db.AssetInvetoryComponentList.AsEnumerable();
        }
        public static void Add(AssetInvetoryComponent o, string user)
        {
            _db.AssetInvetoryComponentList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(AssetInvetoryComponent o, string user)
        {
            var result = from r in _db.AssetInvetoryComponentList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(AssetInvetoryComponent o, string user)
        {
            var result = from r in _db.AssetInvetoryComponentList where r.Id == o.Id select r;
            _db.AssetInvetoryComponentList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
