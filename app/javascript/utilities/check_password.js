document.addEventListener('turbo:load', function() {

  const confirmation = document.querySelector('.password-confirmation-input')
  const password = document.querySelector('.input-password')

  if (confirmation && password) {
    const confirmation_input = document.getElementById('user_password_confirmation')
    const password_input = document.getElementById('user_password')
    const check_icon = document.querySelector('.octicon-check-circle-fill')
    const x_icon = document.querySelector('.octicon-x-circle-fill')

    confirmation.addEventListener('input', function() {
      confirmPassword(confirmation_input, password_input, check_icon, x_icon)
    })
    password.addEventListener('input', function() {
      confirmPassword(confirmation_input, password_input, check_icon, x_icon)
    })
  }
})

function confirmPassword(confirmation_input, password_input, check_icon, x_icon) {

  if (confirmation_input.value == password_input.value) {
    x_icon.classList.add('hide')
    check_icon.classList.remove('hide')
  } else {
    x_icon.classList.remove('hide')
    check_icon.classList.add('hide')
  }

  if (confirmation_input.value == "") {
    x_icon.classList.add('hide')
    check_icon.classList.add('hide')
  }
}
