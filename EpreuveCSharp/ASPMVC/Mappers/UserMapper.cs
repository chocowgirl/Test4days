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


        public static User ToBLL(this UserCreateForm user)
        {
            if(user is null) throw new ArgumentNullException(nameof(user));
            return new User(
                Guid.NewGuid(),
                user.Email,
                user.Password,
                user.Pseudo,
                DateOnly.FromDateTime(DateTime.Now),
                null
                );
        }


        public static UserEditForm ToEditForm(this User user)
        {
            if(user is null) throw new ArgumentNullException(nameof(user));
            return new UserEditForm()
            {
                Pseudo = user.Pseudo
            };
        }

        public static User ToBLL(this UserEditForm user)
        {
            if (user is null) throw new ArgumentNullException(nameof(user));
            return new User(
                Guid.Empty,
                "",
                "",
                user.Pseudo,
                DateOnly.FromDateTime(DateTime.Now),
                null
                );

        }
    }
}
