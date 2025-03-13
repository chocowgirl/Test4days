using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class GameCopy
    {

        public Guid Copy_Id { get; set; }

        public int Jeu_Id { get; set; }

        public Guid UserOwner_Id { get; set; }

        public string Copy_Condition { get; set; }

        public bool Is_Owned { get; set; }



        public GameCopy(Guid copy_Id, int jeu_Id, Guid userOwner_Id, string copy_Condition, bool is_Owned)
        {
            Copy_Id = copy_Id;
            Jeu_Id = jeu_Id;
            UserOwner_Id = userOwner_Id;
            Copy_Condition = copy_Condition;
            Is_Owned = is_Owned;
        }
    }
}
