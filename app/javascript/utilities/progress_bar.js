document.addEventListener('turbo:load', function() {
  const progressBar = document.querySelector('.progress-bar')
  
  if (progressBar) {
    const currentQuestion = progressBar.dataset.currentQuestion
    const questionsCount = progressBar.dataset.questionsCount

    progressBar.style.width = percentProgress(currentQuestion, questionsCount) + "%"
  }
})

function percentProgress(currentQuestion, questionsCount) {
  return (parseFloat(currentQuestion) / parseFloat(questionsCount) * 100)
}
