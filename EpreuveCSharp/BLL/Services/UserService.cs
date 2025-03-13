using BLL.Entities;
using BLL.Mappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class UserService
    {
        private DAL.Services.UserService _service;

        public UserService()
        {
            _service = new DAL.Services.UserService();
        }


        public User Get(Guid user_id)
        {
            return _service.Get(user_id).ToBLL();
        }

        public Guid Insert(User user)
        {
            return _service.Insert(user.ToDAL());
        }

        public void Update(string pseudo, Guid user_id)
        {
            _service.Update(user_id, new User { Pseudo = pseudo }.ToDAL());
        }


        public void Delete(Guid user_id)
        {
            _service.Delete(user_id);
        }
    }
}
