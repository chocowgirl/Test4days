using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class Jeu
    {
        public Guid Jeu_Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int Min_Age { get; set; }

        public int Max_Age { get; set; }

        public int Min_Players { get; set; }

        public int Max_Players { get; set; }

        public int? Duration_Mins { get; set; }

        public DateOnly Date_Created { get; set; }
    }
}
