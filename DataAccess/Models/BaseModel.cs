using Data;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Models
{
    public class BaseModel<T>
    {
        public static InMemoryContext _db = new InMemoryContext();
    }
}
