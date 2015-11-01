using Data.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Models
{
    public class PurchaseRequestCheckListModel : BaseModel<PurchaseRequestCheckListModel>
    {
        public static IEnumerable<PurchaseRequestCheckList> FindAll()
        {
            return _db.PurchaseRequestCheckListList.AsEnumerable();
        }

        public static IEnumerable<PurchaseRequestCheckList> FindAllByPrId(string prId, bool isMandatory)
        {
            return _db.PurchaseRequestCheckListList.Where(c => (c.PurchaseRequestId == prId) && (c.CheckList.IsMandatory == isMandatory)).OrderBy(d => d.CheckList.Code).AsEnumerable();
        }

        public static void Add(PurchaseRequestCheckList o, string user)
        {
            _db.PurchaseRequestCheckListList.Add(o);
            _db.SaveChanges(user);
        }

        //Update record
        public static void Update(PurchaseRequestCheckList o, string user)
        {
            var result = from r in _db.PurchaseRequestCheckListList where r.Id == o.Id select r;
            _db.SaveChanges(user);

        }
        //Delete record
        public static void Delete(PurchaseRequestCheckList o, string user)
        {
            var result = from r in _db.PurchaseRequestCheckListList where r.Id == o.Id select r;
            _db.PurchaseRequestCheckListList.Remove(result.FirstOrDefault());
            _db.SaveChanges(user);
        }

        public static void ToggleIsChecked(string id, string user)
        {
            try
            {
                var o = _db.PurchaseRequestCheckListList.Where(c => c.Id == id).FirstOrDefault();
                if (o == null)
                    return;
                o.IsChecked = !o.IsChecked;
                _db.Entry(o).State = EntityState.Modified;
                _db.SaveChanges(user);
            }
            catch (OptimisticConcurrencyException)
            {
                var ctx = ((IObjectContextAdapter)_db).ObjectContext;
                ctx.Refresh(RefreshMode.ClientWins, _db.PurchaseRequestCheckListList);
                _db.SaveChanges(user);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
