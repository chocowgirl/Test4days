using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Jeu
    {

        public int Jeu_Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int Min_Age { get; set; }

        public int Max_Age { get; set; }

        public int Min_Players { get; set; }

        public int Max_Players { get; set; }

        public int? Duration_Mins { get; set; }

        public DateOnly Date_Created { get; set; }



        public Jeu() { }

        public Jeu(int jeu_Id, string title, string description, int min_Age, int max_Age, int min_Players, int max_Players, int? duration_Mins, DateOnly date_Created)
        {
            Jeu_Id = jeu_Id;
            Title = title;
            Description = description;
            Min_Age = min_Age;
            Max_Age = max_Age;
            Min_Players = min_Players;
            Max_Players = max_Players;
            Duration_Mins = duration_Mins;
            Date_Created = date_Created;
        }
    }

}
