using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class AssetInventoryModel : BaseModel<AssetInventoryModel>
    {
        public static IEnumerable<AssetInventory> FindAll()
        {
            return _db.AssetInventoryList.AsEnumerable();
        }
        public static void Add(AssetInventory o, string user)
        {
            _db.AssetInventoryList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(AssetInventory o, string user)
        {
            var result = from r in _db.AssetInventoryList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(AssetInventory o, string user)
        {
            var result = from r in _db.AssetInventoryList where r.Id == o.Id select r;
            _db.AssetInventoryList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
