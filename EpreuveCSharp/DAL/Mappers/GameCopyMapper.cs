using DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Mappers
{
    internal static class GameCopyMapper
    {
        public static GameCopy ToGameCopy(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));
            return new GameCopy()
            {
                Copy_Id = (Guid)record[nameof(GameCopy.Copy_Id)],
                Jeu_Id = (int)record[nameof(GameCopy.Jeu_Id)],
                UserOwner_Id = (Guid)record[nameof(GameCopy.UserOwner_Id)],
                Copy_Condition = (string)record[nameof(GameCopy.Copy_Condition)],
                Is_Owned = (bool)record[nameof(GameCopy.Is_Owned)]
            };

        }
    }
}
