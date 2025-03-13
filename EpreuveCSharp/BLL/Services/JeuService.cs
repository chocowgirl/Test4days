using BLL.Entities;
using BLL.Mappers;
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
            return _service.Get().Select(dal => dal.ToBLL());
        }

        public Jeu Get(int jeu_id)
        {
            return _service.Get(jeu_id).ToBLL();
        }


    }
}
