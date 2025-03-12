using DAL.Entities;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Mappers;

namespace DAL.Services
{
    public class JeuService
    {
        private const string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DBT4D;Integrated Security=True;";

        public IEnumerable<Jeu> Get()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Jeu_GetAll";
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader()) 
                    {
                        while (reader.Read()) 
                        {
                            yield return reader.ToJeu();
                        }
                    }
                }
            }

        }

        public Jeu Get(int jeu_id)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Jeu_GetById";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("jeuId", jeu_id);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return reader.ToJeu();
                        }
                        else
                        {
                            throw new ArgumentOutOfRangeException(nameof(jeu_id));
                        }
                    }

                }
            }
        }

        public int Insert(Jeu jeu)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Jeu_Create";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(Jeu.Title), jeu.Title);
                    command.Parameters.AddWithValue(nameof(Jeu.Description), jeu.Description);
                    command.Parameters.AddWithValue(nameof(Jeu.Min_Age), jeu.Min_Age);
                    command.Parameters.AddWithValue(nameof(Jeu.Max_Age), jeu.Max_Age);
                    command.Parameters.AddWithValue(nameof(Jeu.Min_Players), jeu.Min_Players);
                    command.Parameters.AddWithValue(nameof(Jeu.Max_Players), jeu.Max_Players);
                    command.Parameters.AddWithValue(nameof(Jeu.Duration_Mins), jeu.Duration_Mins);
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
    }
}
