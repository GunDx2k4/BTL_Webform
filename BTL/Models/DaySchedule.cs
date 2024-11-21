using System.Collections.Generic;

namespace BTL.Models
{
    public class DaySchedule
    {
        public string DayOfWeek { get; set; }
        public string Date { get; set; }
        public List<ClassDetail> Classes { get; set; }
    }
}