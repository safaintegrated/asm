﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entity
{
    public class Category : EntityBase
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public string VotCode { get; set; }

    }
}
