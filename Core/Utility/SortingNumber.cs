using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Core.Utility
{
    public class SortingNumberMethod
    {
        public static Int32 FormNextSortingId(ref DataTable Dt, string ColumnIdName)
        {
            int minSortId = int.MaxValue;

            if (Dt.Rows.Count > 0)
            {

                foreach (DataRow dr in Dt.Rows)
                {
                    int SortId = dr.Field<int>(ColumnIdName);
                    minSortId = Math.Min(minSortId, SortId);
                }

                return minSortId - 1;
            }
            else
                return -1;
        }

        public static Int32 FormNextSortingIdStartWith1(ref DataTable Dt, string ColumnIdName)
        {
            int maxSortId = int.MinValue;

            if (Dt.Rows.Count > 0)
            {

                foreach (DataRow dr in Dt.Rows)
                {
                    int M_EmpDependent_SortId = dr.Field<int>(ColumnIdName);
                    maxSortId = Math.Max(maxSortId, M_EmpDependent_SortId);
                }

                return maxSortId + 1;
            }
            else
                return 1;
        }
    }
}
