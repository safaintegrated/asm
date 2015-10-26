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

            return Db.UtemInfos.AsEnumerable();
        }
        public static void Add(UtemInfo product)
        {
            Db.UtemInfos.Add(product);
            Db.SaveChanges();
        }

        //Update record
        public static void Update(UtemInfo o)
        {
            var result = from r in Db.UtemInfos where r.Id == o.Id select r;
            Db.SaveChanges();

        }
        //Delete record
        public static void Delete(UtemInfo o)
        {
            var result = from r in Db.UtemInfos where r.Id == o.Id select r;
            Db.UtemInfos.Remove(result.FirstOrDefault());
            Db.SaveChanges();

        }
    }
 
}