using DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Mappers
{
    internal static class EmpruntMapper
    {
        public static Emprunt ToEmprunt(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));
            return new Emprunt()
            {
                Emprunt_Id = (int)record[nameof(Emprunt.Emprunt_Id)],
                Date_Lent = (DateOnly)record[nameof(Emprunt.Date_Lent)],
                Date_Returned = (record[nameof(Emprunt.Date_Returned)] is DBNull)? null : (DateOnly?)record[nameof(Emprunt.Date_Returned)],
                GameCopy_Id = (Guid)record[nameof(Emprunt.GameCopy_Id)],
                Eval_By_Lender = (int)record[nameof(Emprunt.Eval_By_Lender)],
                Eval_By_Borrower = (int)record[nameof(Emprunt.Eval_By_Borrower)],
                Borrower_Id = (Guid)record[nameof(Emprunt.Borrower_Id)],
                Lender_Id = (Guid)record[nameof(Emprunt.Lender_Id)]
            };

        }
    }
}
