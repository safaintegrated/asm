using Data.Entity;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class AssetRegistrationModel : BaseModel<AssetRegistrationModel>
    {
        public static IEnumerable<AssetRegistration> FindAll()
        {
            return _db.AssetRegistrationList.AsEnumerable();
        }
        public static void Add(AssetRegistration o, string user)
        {
            _db.AssetRegistrationList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(AssetRegistration o, string user)
        {
            var result = from r in _db.AssetRegistrationList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(AssetRegistration o, string user)
        {
            var result = from r in _db.AssetRegistrationList where r.Id == o.Id select r;
            _db.AssetRegistrationList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
