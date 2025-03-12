using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entities
{
    public class GameCopy
    {
        public Guid Copy_Id { get; set; }

        public int Jeu_Id { get; set; }

        public Guid UserOwner_Id { get; set; }

        public string Copy_Condition { get; set; }

        public bool Is_Owned { get; set; }

    }
}
