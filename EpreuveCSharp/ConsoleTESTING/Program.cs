using DAL.Entities;
using DAL.Services;
//using BLL.Entities;
//using BLL.Services;
using Microsoft.Identity.Client;

namespace ConsoleTESTING
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //******* GET ALL JEUX
            //JeuService service = new JeuService();
            //foreach (Jeu j in service.Get())
            //{
            //    Console.WriteLine($"{j.Jeu_Id}, {j.Title}, Description: '{j.Description}', players {j.Min_Age} to {j.Max_Age} years old, {j.Min_Players} to {j.Max_Players} players.  {j.Duration_Mins}m");
            //}


            //******* GET JEU (DE SCRIPT POSTDEPLOYMENT) BY ID
            //JeuService s2 = new JeuService();
            //Jeu jeu2 = s2.Get(1);
            //if (jeu2 != null)
            //{
            //    Console.WriteLine($"{jeu2.Title}");
            //}
            //else
            //{
            //    Console.WriteLine("Game not found.");
            //}

            //***********INSERT NEW JEU
            //JeuService s3 = new JeuService();

            //Jeu newJeu = new Jeu
            //{
            //    Title = "Life",
            //    Description = "A game of chance and misfortune",
            //    Min_Age = 6,
            //    Max_Age = 129,
            //    Min_Players = 2,
            //    Max_Players = 8,
            //    Duration_Mins = 60
            //};
            //int newJeuId = s3.Insert(newJeu);

            //Console.WriteLine($"New game inserted with ID: {newJeuId}");


            //******GET NEWLY INSERTED JEU BY ID
            //JeuService s4 = new JeuService();
            //Jeu jeu3 = s4.Get(3);
            //if (jeu3 != null)
            //{
            //    Console.WriteLine($"{jeu3.Title} is here!");
            //}
            //else
            //{
            //    Console.WriteLine("Game not found.");
            //}


            //*******GET USER(DE SCRIPT POSTDEPLOYMENT) BY ID
            //UserService us = new UserService();
            //User u = us.Get(Guid.Parse("916a7414-b651-4662-a047-9bd359b98a98"));
            //if (u != null)
            //{
            //    Console.WriteLine($"{u.User_Id} is the user Id for {u.Pseudo} from email: {u.Email}.  This user has been here since {u.Date_Created}");
            //}
            //else
            //{
            //    Console.WriteLine("User not found.");
            //}


            ////***********INSERT NEW USER
            //UserService us = new UserService();

            //User newUser = new User
            //{
            //    Email = "dingdong@hotmail.com",
            //    Password = "Test1234=",
            //    Pseudo = "dingdongDon",
            //};
            //Guid newUserId = us.Insert(newUser);

            //Console.WriteLine($"New user inserted with ID: {newUserId}");


            ////*************USER UPDATE
            //UserService uS = new UserService();

            //Guid userId = new Guid("916a7414-b651-4662-a047-9bd359b98a98");
            //User userToUpdate = uS.Get(userId);

            //Console.WriteLine($"Before Update: {userToUpdate.User_Id} has pseudo of {userToUpdate.Pseudo}.");

            //userToUpdate.Pseudo = "PseudoJohn";

            //uS.Update(userId, userToUpdate);

            //User updatedUser = uS.Get(userId);
            //Console.WriteLine($"After Update: {updatedUser.User_Id} has pseudo of {updatedUser.Pseudo}");


            //**********USER DELETE (deactivating Don)
            //UserService uS = new UserService();
            //Guid userId = new Guid("0b673808-3c0b-4596-83a1-ca421a1ec8dc");
            //uS.Delete(userId);


        }
    }
}
