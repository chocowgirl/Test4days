using DAL.Entities;
using DAL.Mappers;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Services
{
    public class GameCopyService
    {
        private const string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DBT4D;Integrated Security=True;";

        public IEnumerable<GameCopy> Get(Guid user_id)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_GameCopy_GetByOwnerId";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(user_id), user_id);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            yield return reader.ToGameCopy();
                        }
                    }
                }
            }
        }


        public Guid Insert(GameCopy gameCopy)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_GameCopy_Create";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(GameCopy.Jeu_Id), gameCopy.Jeu_Id);
                    command.Parameters.AddWithValue(nameof(GameCopy.UserOwner_Id), gameCopy.UserOwner_Id);
                    command.Parameters.AddWithValue(nameof(GameCopy.Copy_Condition), gameCopy.Copy_Condition);
                    connection.Open();
                    return (Guid)command.ExecuteScalar();
                }
            }
        }

        public void Update(Guid copy_id, GameCopy gameCopy)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_GameCopy_Update";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(GameCopy.Copy_Id), gameCopy.Copy_Id);
                    command.Parameters.AddWithValue(nameof(GameCopy.Copy_Condition), gameCopy.Copy_Condition);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }


        public void Delete(Guid copy_id, Guid userOwner_id)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_GameCopy_Disown";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(copy_id), copy_id);
                    command.Parameters.AddWithValue(nameof(userOwner_id), userOwner_id);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
