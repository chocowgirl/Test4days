using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Game_And_Tag
    {

        public int Jeu_Id { get; set; }

        public string Tag_Name { get; set; }


        public Game_And_Tag(int jeu_Id, string tag_Name)
        {
            Jeu_Id = jeu_Id;
            Tag_Name = tag_Name;
        }
    }
}
