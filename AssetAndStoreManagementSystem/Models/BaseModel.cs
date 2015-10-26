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
        private static InMemoryContext _db;// = new InMemoryContext();

        public static InMemoryContext Db
        {
            get
            {
                if (_db == null)
                {
                    _db = new InMemoryContext();
                    InMemoryContextInitializer.Seed(Db);
                }

                return _db;

            }
        }
    }
}
