﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entity
{
    public class Workflow : EntityBase
    {
        //public string Id { get; set; }
        public string Description { get; set; }
        public DateTime Date { get; set; }
        public string EmployeeId { get; set; }
        public string EmployeeName { get; set; }
    }
}
