﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class Ledger : EntityBase
    {
        public string GlCode { get; set; }
        public string Description { get; set; }
        public string DrCr { get; set; }
        public int Jumlah { get; set; }
    }
}
