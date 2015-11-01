using Data.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Constant
    {
        public static string GetProcessStateDescription(Enum.ProcessStateEnum e)
        {
            return e.ToString();
            switch (e)
            {
                //case ProcessStateEnum.Draft:
                //    return "Draf";
                //case ProcessStateEnum.Submitted:
                //    return "Dihantar";
                //case ProcessStateEnum.Updated:
                //    return "Kemaskini";
                //case ProcessStateEnum.CheckedByFinance1:
                //    return "Disemak Bendahari 1";
                //case ProcessStateEnum.ApprovedByPtj:
                //    return "Diluluskan PTJ";
                //case ProcessStateEnum.ApprovedByFinance:
                //    return "Diluluskan Bendahari";
                //case ProcessStateEnum.NotApproved:
                //    return "Tidak Lulus";
                //case ProcessStateEnum.SendToSaga:
                //    return "Posted";
                //default:
                //    return "";
            }

        }
    }
}
