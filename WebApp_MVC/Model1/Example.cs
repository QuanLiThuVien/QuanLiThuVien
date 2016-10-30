using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model1
{
    public class Example
    {
        public List<DocGia> getDocGia()
        {
            List<DocGia> list = new QuanLiThuVien().DocGias.ToList();
            return list;
        }
    }
}
