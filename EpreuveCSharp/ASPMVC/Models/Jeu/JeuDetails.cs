using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ASPMVC.Models.Jeu
{
    public class JeuDetails
    {
        [DisplayName("Game Id")]
        public int Jeu_Id { get; set; }


        [DisplayName("Game Title")]
        public string Title { get; set; }


        [DisplayName("Game Description")]
        public string Description { get; set; }


        [DisplayName("Minimum Age to play")]
        public int Min_Age { get; set; }


        [DisplayName("Maximum Age to play")]
        public int Max_Age { get; set; }


        [DisplayName("Minimum players")]
        public int Min_Players { get; set; }

        [DisplayName("Maximum players")]
        public int Max_Players { get; set; }


        [DisplayName("Duration in minutes (if applicable)")]
        public int? Duration_Mins { get; set; }
    }
}
