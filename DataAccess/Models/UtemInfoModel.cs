using DataAccess.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataAccess.Models
{
    public class UtemInfoModel : BaseModel<UtemInfoModel>
    {
        public static IEnumerable<UtemInfo> FindAll()
        {

            return _db.UtemInfos.AsEnumerable();
        }
        public static void Add(UtemInfo product)
        {
            _db.UtemInfos.Add(product);
            _db.SaveChanges();
        }

        //Update record
        public static void Update(UtemInfo o)
        {
            var result = from r in _db.UtemInfos where r.Id == o.Id select r;
            _db.SaveChanges();

        }
        //Delete record
        public static void Delete(UtemInfo o)
        {
            var result = from r in _db.UtemInfos where r.Id == o.Id select r;
            _db.UtemInfos.Remove(result.FirstOrDefault());
            _db.SaveChanges();

        }
    }
 
}