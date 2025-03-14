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
    public class JeuService : IJeuRepository<Jeu>
    {
        //private DAL.Services.JeuService _service;
        private IJeuRepository<DAL.Entities.Jeu> _service;

        public JeuService(IJeuRepository<DAL.Entities.Jeu> jeuService)
        {
            _service = jeuService;
        }

        public IEnumerable<Jeu> Get()
        {
            return _service.Get().Select(dal => dal.ToBLL());
        }

        public Jeu Get(int jeu_id)
        {
            return _service.Get(jeu_id).ToBLL();
        }

        public int Insert(Jeu jeu)
        {
            return _service.Insert(jeu.ToDAL());
        }
    }
}
