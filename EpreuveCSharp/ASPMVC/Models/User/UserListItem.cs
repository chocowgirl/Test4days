using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ASPMVC.Models.User
{
    public class UserListItem
    {
        [ScaffoldColumn(false)]
        public Guid User_Id { get; set; }


        [DisplayName("Email")]
        public string Email { get; set; }


        //[DisplayName("User Pseudonym")]
        //public string Pseudo {  get; set; }
    }
}
