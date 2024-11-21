namespace BTL.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public override bool Equals(object obj)
        {
            if (obj is Category other)
            {
                return this.Id == other.Id && this.Name == other.Name;
            }
            return false;
        }

        // Override GetHashCode để đảm bảo giá trị băm nhất quán
        public override int GetHashCode()
        {
            return Id;
        }
    }
}