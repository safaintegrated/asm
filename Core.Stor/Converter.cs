using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Core.Stor
{
    public class Converter
    {
        public static DataTable ParseToDataTable(IList<Data.PemeriksaanDetail> srs)
        {
            DataTable deta = new DataTable();

            foreach (PropertyInfo info in typeof(Data.PemeriksaanDetail).GetProperties())
            {
                deta.Columns.Add(info.Name, info.PropertyType);
            }
            deta.AcceptChanges();


            foreach (var i in srs)
            {
                Data.PemeriksaanDetail sr = new Data.PemeriksaanDetail();
                sr = i;
                DataRow row = deta.NewRow();

                foreach (var property in sr.GetType().GetProperties())
                {
                    row[property.Name] = property.GetValue(sr, null);
                }
                deta.Rows.Add(row);
            }

            deta.AcceptChanges();
            return deta;
        }
        public static DataTable ParseToDataTable(Data.Pemeriksaan theObject)
        {
            DataTable dat = new DataTable();

            Data.Pemeriksaan datos = new Data.Pemeriksaan();

            foreach (PropertyInfo info in typeof(Data.Pemeriksaan).GetProperties())
            {
                if (info.PropertyType != typeof(string)
                     && info.PropertyType.GetInterface(typeof(IEnumerable).Name) != null
                     && info.PropertyType.GetInterface(typeof(IEnumerable<>).Name) != null)
                {
                    continue;
                }
                
                dat.Columns.Add(info.Name, info.PropertyType);
            }

            dat.AcceptChanges();

            DataRow row = dat.NewRow();
          datos = theObject;


          foreach (var info in datos.GetType().GetProperties())
            {

                if (info.PropertyType != typeof(string)
            && info.PropertyType.GetInterface(typeof(IEnumerable).Name) != null
            && info.PropertyType.GetInterface(typeof(IEnumerable<>).Name) != null)
                {
                    continue;
                }
                row[info.Name] = info.GetValue(datos, null);

            }

            dat.Rows.Add(row);
            dat.AcceptChanges();
            return dat;
        }
    }
}
