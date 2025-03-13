using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Mappers
{
    internal static class UserMapper
    {
        public static BLL.Entities.User ToBLL(this DAL.Entities.User user)
        {
            if (user is null) throw new ArgumentNullException(nameof(user));
            return new BLL.Entities.User(
                user.User_Id,
                user.Email,
                user.Password,
                user.Pseudo,
                user.Date_Created,
                user.Date_Deactivated);
        }

        public static DAL.Entities.User ToDAL(this BLL.Entities.User user)
        {
            if (user is null) throw new ArgumentNullException(nameof(user));
            return new DAL.Entities.User()
            {
                User_Id = user.User_Id,
                Email = user.Email,
                Password = user.Password,
                Pseudo = user.Pseudo,
                Date_Created = user.Date_Created
            };
        }
    }
}
