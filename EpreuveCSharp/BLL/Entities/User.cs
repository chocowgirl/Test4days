using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Entities
{
    public class User
    {

        public Guid User_Id { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Pseudo { get; set; }

        public DateOnly Date_Created { get; set; }

        public DateOnly? Date_Deactivated { get; set; }


        public User() { }

        public User(Guid user_Id, string email, string password, string pseudo, DateOnly date_Created, DateOnly? date_Deactivated)
        {
            User_Id = user_Id;
            Email = email;
            Password = password;
            Pseudo = pseudo;
            Date_Created = date_Created;
            Date_Deactivated = date_Deactivated;
        }
    }
}
