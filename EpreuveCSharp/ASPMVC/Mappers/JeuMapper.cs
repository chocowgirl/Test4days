using ASPMVC.Models.Jeu;
using ASPMVC.Models.User;
using BLL.Entities;

namespace ASPMVC.Mappers
{
    internal static class JeuMapper
    {
        public static JeuListItem ToListItem(this Jeu jeu)
        {
            if(jeu is null) throw new ArgumentNullException(nameof(jeu));
            return new JeuListItem()
            {
                Jeu_Id = jeu.Jeu_Id,
                Title = jeu.Title,
                Description = jeu.Description
            };
        }


        public static JeuDetails ToDetails(this Jeu jeu)
        {
            if (jeu is null) throw new ArgumentNullException(nameof(jeu));
            return new JeuDetails()
            {
                Jeu_Id = jeu.Jeu_Id,
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
