﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Repositories
{
    public interface IJeuRepository<TJeu>
    {
        IEnumerable<TJeu> Get();

        TJeu Get(int id);

        int Insert(TJeu jeu);
    }
}
