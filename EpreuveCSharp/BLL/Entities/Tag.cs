using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class Tag
    {

        public string Tag_Name { get; set; }


        public Tag(string tag_Name)
        {
            Tag_Name = tag_Name;
        }
    }
}
