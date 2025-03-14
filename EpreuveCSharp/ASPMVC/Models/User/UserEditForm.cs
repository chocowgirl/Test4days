using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ASPMVC.Models.User
{
    public class UserEditForm
    {
        [DisplayName("User Handle")]
        [Required(ErrorMessage = "You must fill out this field")]
        [MaxLength(50, ErrorMessage = "Your handle cannot exceed 50 characters")]
        public string Pseudo { get; set; }

    }
}
