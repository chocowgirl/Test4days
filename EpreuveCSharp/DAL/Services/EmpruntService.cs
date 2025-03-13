using DAL.Entities;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Services
{
    public class EmpruntService
    {
        private const string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DBT4D;Integrated Security=True;";


        public int Insert(Emprunt emprunt)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Emprunt_Create";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(Emprunt.Date_Lent), emprunt.Date_Lent);
                    command.Parameters.AddWithValue(nameof(Emprunt.GameCopy_Id), emprunt.GameCopy_Id);
                    command.Parameters.AddWithValue(nameof(Emprunt.Borrower_Id), emprunt.Borrower_Id);
                    command.Parameters.AddWithValue(nameof(Emprunt.Lender_Id), emprunt.Lender_Id);

                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }


        public void Update(int emprunt_id, Emprunt emprunt)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SP_Emprunt_Update";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue(nameof(Emprunt.Emprunt_Id), emprunt.Emprunt_Id);
                    command.Parameters.AddWithValue(nameof(Emprunt.Date_Returned), emprunt.Date_Returned);
                    command.Parameters.AddWithValue(nameof(Emprunt.Eval_By_Lender), emprunt.Eval_By_Lender);
                    command.Parameters.AddWithValue(nameof(Emprunt.Eval_By_Borrower), emprunt.Eval_By_Borrower);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}
