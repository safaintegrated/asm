using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class KenyataanTawaranTender
    {
        public int KenyataanTawaranId { get; set; }
        public string NoTender { get; set; }
        public DateTime TarikhLihatPada {get; set;}
        public DateTime TarikhLihatHingga {get; set;}
        public DateTimeOffset JamLihatPada {get; set;}
        public DateTimeOffset JamLihatHingga {get; set;}
        public DateTime TenderTutup { get; set; }
        public string PetiTender {get; set;}

    }
}
