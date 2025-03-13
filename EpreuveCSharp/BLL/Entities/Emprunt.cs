using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Emprunt
    {

        public int Emprunt_Id { get; set; }

        public DateOnly Date_Lent { get; set; }

        public DateOnly? Date_Returned { get; set; }

        public Guid GameCopy_Id { get; set; }

        public int? Eval_By_Lender { get; set; }

        public int? Eval_By_Borrower { get; set; }

        public Guid Borrower_Id { get; set; }

        public Guid Lender_Id { get; set; }



        public Emprunt(int emprunt_Id, DateOnly date_Lent, DateOnly? date_Returned, Guid gameCopy_Id, int? eval_By_Lender, int? eval_By_Borrower, Guid borrower_Id, Guid lender_Id)
        {
            Emprunt_Id = emprunt_Id;
            Date_Lent = date_Lent;
            Date_Returned = date_Returned;
            GameCopy_Id = gameCopy_Id;
            Eval_By_Lender = eval_By_Lender;
            Eval_By_Borrower = eval_By_Borrower;
            Borrower_Id = borrower_Id;
            Lender_Id = lender_Id;
        }
    }
}
