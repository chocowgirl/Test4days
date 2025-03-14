using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ASPMVC.Models.User
{
    public class UserCreateForm
    {

        [DisplayName("Email")]
        [EmailAddress]
        [Required(ErrorMessage = "You must fill out this field")]
        public string Email { get; set; }


        [DisplayName("User Handle")]
        [Required(ErrorMessage = "You must fill out this field")]
        [MaxLength(50, ErrorMessage = "Your handle cannot exceed 50 characters")]
        public string Pseudo { get; set; }


        [DisplayName("Password")]
        [MinLength(8, ErrorMessage = "Your password must be at least 8 characters long")]
        [MaxLength(32, ErrorMessage = "Your password may not exceed 32 characters")]
        [Required(ErrorMessage = "You must fill out this field")]
        public string Password { get; set; }


        [DisplayName("Confirm your Password")]
        [Required(ErrorMessage = "You must fill out this field")]
        [Compare(nameof(Password), ErrorMessage ="The two password fields do not match!")]
        public string ConfirmPassword { get; set; }

    }
}
