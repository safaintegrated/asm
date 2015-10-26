using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Models
{
    public class AssetTypeModel : BaseModel<AssetTypeModel>
    {
        public static IEnumerable<AssetType> FindAll()
        {
            return Db.AssetTypes.AsEnumerable();
        }
        public static void Add(AssetType o, string user)
        {
            Db.AssetTypes.Add(o);
            Db.SaveChanges(user);
        }

        //Update record
        public static void Update(AssetType o, string user)
        {
            var result = from r in Db.AssetTypes where r.Id == o.Id select r;
            Db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(AssetType o, string user)
        {
            var result = from r in Db.AssetTypes where r.Id == o.Id select r;
            Db.AssetTypes.Remove(result.FirstOrDefault());
            Db.SaveChanges(user);

        }

        public static IEnumerable<AssetType> FindAllBySubCatId(string sCatId)
        {
            var result = from r in Db.AssetTypes where r.SubCategoryId == sCatId select r;
            return result;
        }
    }

}
