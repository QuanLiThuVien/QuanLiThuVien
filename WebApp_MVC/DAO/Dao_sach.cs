using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model4;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
   
     public static class Dao_sach
    {
        static QuanLiThuVienEntities1 db = new QuanLiThuVienEntities1();
        public static List<DauSachInfo> dssach1()
        {
            var list = (from n in db.DauSaches
                        select new DauSachInfo
                        {
                            Ten = n.Ten,
                            Soluong1 = n.Soluong,
                            TrangThai1 = n.TrangThai,
                            MieuTa1 = n.MieuTa
                        }).ToList();
            //var list = db.DauSaches.ToList();
            return list;
        }
        public static List<DauSachInfo> timkiemsach(string ten)
        {
            var listtimkiem = (from n in db.DauSaches
                               where n.Ten.Contains(ten)
                               select new DauSachInfo
                               {
                                   Ten = n.Ten,
                                   Soluong1=n.Soluong,
                                   TrangThai1=n.TrangThai,
                                   MieuTa1=n.MieuTa  
                               }).ToList();
            return listtimkiem;
        }
        public static bool them(DauSach ds)
        {
            try
            {
                db.DauSaches.Add(ds);
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public static bool sua(DauSach ds)
        {
            try
            {
                db.Entry(ds).State= System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public static bool xoa(int id)
        {
            try
            {
                var dausach = db.DauSaches.Find(id);
                db.DauSaches.Remove(dausach);
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public static bool themmoi(DauSach ds)
        {
            //try
            //{
            long maxdong = db.DauSaches.OrderByDescending(n => n.ID).Select(i => i.ID).FirstOrDefault();
            maxdong = maxdong + 1;
             db.DauSaches.Add(ds);
            db.SaveChanges();
                for (var i = 0; i<ds.Soluong;i++)
                {
                    string trangthai = "Khả dụng";
                    Sach s = new Sach();
                    s.ID_DauSach = maxdong;
                    s.TinhTrang = trangthai;
                    db.Saches.Add(s);
                    db.SaveChanges();
                }
                return true;
            //}
            //catch(Exception)
            //{
               // return false;
            //}
        }
        public static bool bosung(DauSach ds)
        {
            try
            {
                var dausach = db.DauSaches.Where(n => n.ID.Equals(ds.ID)).Select(n => new DauSach(n)).FirstOrDefault();
                dausach.Soluong = dausach.Soluong + ds.Soluong;
                db.Entry(dausach).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                for(var i=0;i<ds.Soluong;i++)
                {
                    string tinhtrang = "Khả dụng";
                    long iddausach = dausach.ID;
                    Sach s = new Sach();
                    s.ID_DauSach = iddausach;
                    s.TinhTrang = tinhtrang;
                    db.Saches.Add(s);
                    db.SaveChanges();
                }
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
        public static List<DauSach> timkiemsach1(string ten)
        {
            var list = (from n in db.DauSaches
                        where n.Ten == ten
                        select new DauSach
                        {
                            ID = n.ID
                        }).ToList();
            return list;
        }
        public static long laydong()
        {
            var maxdong = db.DauSaches.OrderByDescending(n => n.ID).Select(i => i.ID).FirstOrDefault();
            return maxdong;
        }
        public static long iddausach(string ten)
        {
            long iddausach = db.DauSaches.Where(n => n.Ten.Equals(ten)).Select(n => n.ID).FirstOrDefault();
            return iddausach;
        }
        
    }
}
