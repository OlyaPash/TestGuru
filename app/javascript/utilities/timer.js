document.addEventListener('turbo:load', function() {
  const timer = document.querySelector('.countdown')

  if (timer) {
    let deadline = new Date(timer.dataset.timer)

    let x = setInterval(function() {
      let currentTime = Date.now()
      let difference = deadline - currentTime

      if (difference < 0) {
        clearInterval(x);
        timer.innerHTML = "Время вышло!"
      }

      let minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60)) 
      let seconds = Math.floor((difference % (1000 * 60)) / 1000)

      minutes = minutes < 10 ? "0" + minutes : minutes
      seconds = seconds < 10 ? "0" + seconds : seconds

      if (currentTime < deadline) {
        timer.innerHTML = "Осталось: " + minutes + ":" + seconds
      }
      else {
        document.querySelector('form').submit()
      }
    }, 1000)
  }
})
