using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS.DTO
{
     public class DauSachInfo
    {

        public long ID { get; internal set; }
        public string MieuTa1 { get; internal set; }
        public double? Soluong1 { get; internal set; }
        public string Ten { get; internal set; }
        public string TrangThai1 { get; internal set; }
    }
}

