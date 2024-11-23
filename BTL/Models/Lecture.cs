using System;

namespace BTL.Models
{
    public class Lecture
    {
        public int Id { get; set; } = -1;
        public string Name { get; set; }
        public DateTime TimeStart { get; set; } = DateTime.Now;
        public DateTime TimeEnd { get; set; } = DateTime.Now;
        public int Status { get; set; }
        public string Url { get; set; }
    }
}