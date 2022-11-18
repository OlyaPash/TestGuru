TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
Feedback.destroy_all
User.destroy_all


users = User.create!([
  { name: "Анджей", last_name: "Сапковский", email: "fortestsmyapps@gmail.com", password: "gurus1" },
  { name: "Дж. Р. Р.", last_name: "Толкин", email: "pashk0vaolya@yandex.ru", password: "gurus2" }
])

categories = Category.create!([
  { title: "Game" },
  { title: "Fantasy genre" }
])

tests = Test.create!([
  { title: "The Witcher", level: 1, category: categories[0], author: users[0] },
  { title: "Movie", level: 2, category: categories[1], author: users[1] }
])

questions = Question.create!([
  { body: "Кем оказывается заколдованный Ума?", test: tests[0] },
  { body: "Какие три города Геральт посетил в основной игре «Дикая Охота»?", test: tests[0] },
  { body: "Где проживал Фродо Бэггинс?", test: tests[1] }
])

answers = Answer.create!([
  { body: "Скьялль", question: questions[0] },
  { body: "Цири", question: questions[0] },
  { body: "Аваллак'х", correct: true, question: questions[0] },
  { body: "Новиград, Оксенфурт и Вызима", correct: true, question: questions[1] },
  { body: "Новиград, Боклер и Каэр Трольде", question: questions[1] },
  { body: "Новиград, Оксенфурт и Флотзам", question: questions[1] },
  { body: "В Шире", correct: true, question: questions[2] },
  { body: "В Лориэне", question: questions[2] },
  { body: "В Хогсмиде", question: questions[2] }
])
