using BLL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class JeuService
    {
        private DAL.Services.JeuService _service;

        public JeuService()
        {
            _service = new DAL.Services.JeuService();
        }

        public IEnumerable<Jeu> Get()
        {
            return _service.Get();
        }

    }
}
