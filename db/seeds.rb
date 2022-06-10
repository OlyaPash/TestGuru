Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all
UserPassedTest.destroy_all


users = User.create!([
  { name: "Анджей Сапковский" },
  { name: "Дж. Р. Р. Толкин" },
  { name: "Тимоти Джон Бернерс-Ли" },
  { name: "Юкихиро Мацумото" }
])

categories = Category.create!([
  { title: "Game" },
  { title: "Programming language" },
  { title: "HyperText Markup Language" },
  { title: "Fantasy genre" }
])

tests = Test.create!([
  { title: "Ruby", level: 1, category_id: categories[1].id, author_id: users[3].id },
  { title: "The Witcher", level: 3, category_id: categories[0].id, author_id: users[0].id },
  { title: "Movie", level: 2, category_id: categories[3].id, author_id: users[1].id },
  { title: "HTML", level: 2, category_id: categories[2].id, author_id: users[2].id }
])

questions = Question.create!([
  { body: "Кем оказывается заколдованный Ума", test_id: tests[1].id },
  { body: "Как называется самый популярный фреймворк языка Ruby для веба?", test_id: tests[0].id },
  { body: "Какие три города Геральт посетил в основной игре «Дикая Охота»?", test_id: tests[1].id },
  { body: "Где проживал Фродо Бэггинс?", test_id: tests[2].id },
  { body: "С помощью какого тега в таблицах создаются строки?", test_id: tests[3].id }
])

answers = Answer.create!([
  { body: "Скьялль", question_id: questions[0].id },
  { body: "Цири", question_id: questions[0].id },
  { body: "Аваллак'х", correct: true, question_id: questions[0].id },
  { body: "Ruby Framework", question_id: questions[1].id },
  { body: "Ruby On Rails", correct: true, question_id: questions[1].id },
  { body: "Ruby Web", question_id: questions[1].id },
  { body: "Новиград, Оксенфурт и Вызима", correct: true, question_id: questions[2].id },
  { body: "Новиград, Боклер и Каэр Трольде", question_id: questions[2].id },
  { body: "Новиград, Оксенфурт и Флотзам", question_id: questions[2].id },
  { body: "В Шире", correct: true, question_id: questions[3].id },
  { body: "В Лориэне", question_id: questions[3].id },
  { body: "В Хогсмиде", question_id: questions[3].id },
  { body: "<th>", question_id: questions[4].id },
  { body: "<td>", question_id: questions[4].id },
  { body: "<tr>", correct: true, question_id: questions[4].id }
])

user_passed_tests = UserPassedTest.create!([
  {user_id: users[0].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[3].id},
  {user_id: users[0].id, test_id: tests[2].id},
])
