﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;

namespace DAO
{
     public static class Dao_tacgia
    {
         static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<TacGia> dstacgia()
        {
            var list = db.TacGias.ToList();
            return list;
        }

        public static long idtacgia(string ten)
        {
            long id = db.TacGias.Where(n => n.HoTen.Equals(ten)).Select(i => i.ID).FirstOrDefault();
            return id;
        }
    }
}
