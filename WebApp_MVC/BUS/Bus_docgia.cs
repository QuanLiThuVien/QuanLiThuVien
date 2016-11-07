using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Model4;

namespace BUS
{
     public class Bus_docgia
    {
        public static List<DocGiainfo> dsdocgia()
        {
            return Dao_docgia.dsdocgia();
        }
        public static List<DocGiainfo> timkiemdocgia(string ten)
        {
            return Dao_docgia.timkiemdocgia(ten);
        }
        public static bool them(DocGia dg)
        {
            return Dao_docgia.them(dg);
        }
        public static bool sua(DocGia dg)
        {
            return Dao_docgia.Sua(dg);
        }
    }
}
