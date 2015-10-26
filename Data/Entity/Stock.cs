using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Stock
    {
        public string StockRegisterNo {get;set;}
        public string StockDetail {get;set;}
        public string StockGroup {get;set;}
        public int CatId {get;set;}
        public int SubCatId {get;set;}
        public int StockMeasurament {get;set;}
        public int StockStatusExpiryDate {get;set;}
    }

}
