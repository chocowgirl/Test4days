using ASPMVC.Models.Jeu;
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
    }
}
