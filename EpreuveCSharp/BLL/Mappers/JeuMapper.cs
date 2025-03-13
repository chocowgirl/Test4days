using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Mappers
{
    internal static class JeuMapper
    {
        public static BLL.Entities.Jeu ToBLL(this DAL.Entities.Jeu jeu)
        {
            if(jeu is null) throw new ArgumentNullException(nameof(jeu));
            return new BLL.Entities.Jeu(
                jeu.Jeu_Id,
                jeu.Title,
                jeu.Description,
                jeu.Min_Age,
                jeu.Max_Age,
                jeu.Min_Players,
                jeu.Max_Players,
                jeu.Duration_Mins,
                jeu.Date_Created);
        }


        public static DAL.Entities.Jeu ToDAL(this BLL.Entities.Jeu jeu)
        {
            if(jeu is null) throw new ArgumentNullException(nameof(jeu));
            return new DAL.Entities.Jeu()
            {
                Title = jeu.Title,
                Description = jeu.Description,
                Min_Age = jeu.Min_Age,
                Max_Age = jeu.Max_Age,
                Min_Players = jeu.Min_Players,
                Max_Players = jeu.Max_Players,
                Duration_Mins = jeu.Duration_Mins
            };
        }
    }
}
