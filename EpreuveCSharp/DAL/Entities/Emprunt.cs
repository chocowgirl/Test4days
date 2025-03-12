using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class Emprunt
    {
        public int Emprunt_Id { get; set; }

        public DateOnly Date_Lent {  get; set; }

        public DateOnly? Date_Returned { get; set; }

        public Guid GameCopy_Id { get; set; }

        public int? Eval_By_Lender { get; set; }

        public int? Eval_By_Borrower { get; set; }

        public Guid Borrower_Id { get; set; }

        public Guid Lender_Id { get; set; }

    }
}
