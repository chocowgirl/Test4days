using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ASPMVC.Models.User
{
    public class UserDelete
    {
        [ScaffoldColumn(false)]
        public Guid User_Id { get; set; }


        [DisplayName("Email")]
        [EmailAddress]
        public string Email { get; set; }


        [DisplayName("User Handle")]
        public string Pseudo { get; set; }


        [DisplayName("Member since")]
        [DataType(DataType.Date)]
        public DateOnly Date_Created { get; set; }
    }
}
