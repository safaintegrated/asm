using Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{

    public class PusatTanggungjawabModel : BaseModel<PusatTanggungjawabModel>
    {
        public static IEnumerable<PusatTanggungjawab> FindAll()
        {
            return _db.PusatTanggungjawabList.AsEnumerable();
        }
        public static void Add(PusatTanggungjawab o, string user)
        {
            _db.PusatTanggungjawabList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PusatTanggungjawab o, string user)
        {
            var result = from r in _db.PusatTanggungjawabList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PusatTanggungjawab o, string user)
        {
            var result = from r in _db.PusatTanggungjawabList where r.Id == o.Id select r;
            _db.PusatTanggungjawabList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);

        }
    }
}
