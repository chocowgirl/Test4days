using ASPMVC.Models.User;
using BLL.Entities;

namespace ASPMVC.Mappers
{
    internal static class UserMapper
    {
        public static UserDetails ToDetails(this User user)
        {
            if(user is null) throw new ArgumentNullException(nameof(user));
            return new UserDetails()
            {
                User_Id = user.User_Id,
                Email = user.Email,
                Pseudo = user.Pseudo,
                Date_Created = user.Date_Created
            };
        }

    }
}
