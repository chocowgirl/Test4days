using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ASPMVC.Models.User
{
    public class UserDetails
    {
        [ScaffoldColumn(false)]
        public Guid User_Id { get; set; }


        [DisplayName("Email")]
        [EmailAddress]
        public string Email { get; set; }


        [DisplayName("User Handle")]
        public string Pseudo {  get; set; }


        [DisplayName("Member since")]
        [DataType(DataType.Date)]
        public DateOnly Date_Created { get; set; }
    }
}
