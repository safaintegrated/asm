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
            switch (e)
            {
                case ProcessStateEnum.DraftByRequestor:
                    return "Draf Pemohon";
                case ProcessStateEnum.UpdatedByRequestor:
                    return "Dikemaskini Pemohon";
                case ProcessStateEnum.SubmittedByRequestor:
                    return "Dihantar Pemohon";
                case ProcessStateEnum.ApprovedByPtj:
                    return "Diluluskan PTJ";
                case ProcessStateEnum.NotApprovedByPtj:
                    return "Tidak Diluluskan PTJ";
                case ProcessStateEnum.CheckedByFinance1:
                    return "Disemak Bendahari 1";
                case ProcessStateEnum.ApprovedByFinance1:
                    return "Diluluskan Bendahari 1";
                case ProcessStateEnum.NotApprovedByFinance1:
                    return "Tidak Diluluskan Bendahari 1";
                case ProcessStateEnum.ApprovedByFinance2:
                    return "Diluluskan Bendahari 2";
                case ProcessStateEnum.NotApprovedByFinance2:
                    return "Tidak Diluluskan Bendahari 2";
                case ProcessStateEnum.SendToSaga:
                    return "Dihantar ke SAGA";
                default:
                    break;
            }
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
