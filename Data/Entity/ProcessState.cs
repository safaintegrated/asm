using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ProcessState : EntityBase
    {
        //public int Id { get; set; }
        public ProcessStateType State { get; set; }
        public string Description { get; set; }
    }

    public enum ProcessStateType
    {
        New         =   0,
        TidakLulus  =   1,
        Lulus       =   2,
        Pengeluaran =   3
    }
}
