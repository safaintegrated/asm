using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Data.Models
{
    public class BaseModel<T>
    {
        public static AsmContext _db = new AsmContext();
    }
}
