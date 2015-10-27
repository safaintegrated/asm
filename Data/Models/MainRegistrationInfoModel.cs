using Data.Entity;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class MainRegistrationInfoModel : BaseModel<MainRegistrationInfoModel>
    {
        public static IEnumerable<MainRegistrationInfo> FindAll()
        {
            return _db.MainRegistrationInfos.AsEnumerable();
        }
        public static void Add(MainRegistrationInfo o, string user)
        {
            _db.MainRegistrationInfos.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(MainRegistrationInfo o, string user)
        {
            var result = from r in _db.MainRegistrationInfos where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(MainRegistrationInfo o, string user)
        {
            var result = from r in _db.MainRegistrationInfos where r.Id == o.Id select r;
            _db.MainRegistrationInfos.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
