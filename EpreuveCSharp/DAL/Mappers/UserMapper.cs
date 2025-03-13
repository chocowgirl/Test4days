using DAL.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Mappers
{
    internal static class UserMapper
    {
        public static User ToUser(this IDataRecord record)
        {
            if (record is null) throw new ArgumentNullException(nameof(record));
            return new User()
            {
                User_Id = (Guid)record[nameof(User.User_Id)],
                Email = (string)record[nameof(User.Email)],
                Password = "********",
                Pseudo = (string)record[nameof(User.Pseudo)],
                Date_Created = DateOnly.FromDateTime((DateTime)record[nameof(User.Date_Created)]),
                //Date_Deactivated = record[nameof(User.Date_Deactivated)] is DBNull
                //    ? null
                //    : DateOnly.FromDateTime((DateTime)record[nameof(User.Date_Deactivated)])
            };

        }

        
    }
}
