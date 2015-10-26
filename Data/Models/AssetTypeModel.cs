using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class AssetTypeModel : BaseModel<AssetTypeModel>
    {
        public static IEnumerable<AssetType> FindAll()
        {
            return _db.AssetTypes.AsEnumerable();
        }
        public static void Add(AssetType o, string user)
        {
            _db.AssetTypes.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(AssetType o, string user)
        {
            var result = from r in _db.AssetTypes where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(AssetType o, string user)
        {
            var result = from r in _db.AssetTypes where r.Id == o.Id select r;
            _db.AssetTypes.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }

        public static IEnumerable<AssetType> FindAllBySubCatId(string sCatId)
        {
            var result = from r in _db.AssetTypes where r.SubCategoryId == sCatId select r;
            return result;
        }
    }

}
