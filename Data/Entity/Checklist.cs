using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Checklist : EntityBase
    {
        public ProcessDetailCategory ProcessCategory { get; set; }
        public int Index { get; set; }
        public bool IsMandatory { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public Checklist()
        {
            ProcessCategory = ProcessDetailCategory.PrValueNotDefined;
        }
    }

    public enum ProcessDetailCategory
    {
        PrValueNotDefined,
        PrValueUnder1k,
        PrValueUnder20k,
        PrValueBetweek20kTo50k,
        PrValueMoreThan50k
    }
}
