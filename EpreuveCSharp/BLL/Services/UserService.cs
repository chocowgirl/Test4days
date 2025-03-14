using BLL.Entities;
using BLL.Mappers;
using Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class UserService : IUserRepository<User>
    {
        //private DAL.Services.UserService _service;
        private IUserRepository<DAL.Entities.User> _service;

        public UserService(IUserRepository<DAL.Entities.User> userService)
        {
            _service = userService;
        }


        public User Get(Guid user_id)
        {
            return _service.Get(user_id).ToBLL();
        }

        public Guid Insert(User user)
        {
            return _service.Insert(user.ToDAL());
        }

        public void Update(Guid user_id, User updatedUser)
        {
            _service.Update(user_id, updatedUser.ToDAL());
        }

        public void Delete(Guid user_id)
        {
            _service.Delete(user_id);
        }

        public Guid CheckPassword(string email, string password)
        {
            return _service.CheckPassword(email, password);
        }
    }
}
