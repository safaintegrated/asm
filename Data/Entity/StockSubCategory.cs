﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class StockSubCategory : EntityBase
    {
        public string StockSubCategoryId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
    }
}
