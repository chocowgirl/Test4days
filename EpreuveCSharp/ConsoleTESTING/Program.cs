using DAL.Entities;
using DAL.Services;
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
            //Jeu jeu3 = s4.Get(1002);
            //if (jeu3 != null)
            //{
            //    Console.WriteLine($"{jeu3.Title} is here!");
            //}
            //else
            //{
            //    Console.WriteLine("Game not found.");
            //}

            





        }
    }
}
