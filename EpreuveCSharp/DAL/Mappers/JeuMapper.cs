using DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Mappers
{
    internal static class JeuMapper
    {
        public static Jeu ToJeu(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));
            return new Jeu()
            {
                Jeu_Id = (int)record[nameof(Jeu.Jeu_Id)],
                Title = (string)record[nameof(Jeu.Title)],
                Description = (string)record[nameof(Jeu.Description)],
                Min_Age = (int)record[nameof(Jeu.Min_Age)],
                Max_Age = (int)record[nameof(Jeu.Max_Age)],
                Min_Players = (int)record[nameof(Jeu.Min_Players)],
                Max_Players = (int)record[nameof(Jeu.Max_Players)],
                Duration_Mins = (record[nameof(Jeu.Duration_Mins)] is DBNull) ? null : (int?)record[nameof(Jeu.Duration_Mins)],
                Date_Created = (DateOnly)record[nameof(Jeu.Date_Created)]
            };

        }
    }
}
