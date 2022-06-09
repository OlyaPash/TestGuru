tests = Test.create!([
  { title: "Ruby", level: 1, category: categories[1], author: users[3] },
  { title: "The Witcher", level: 3, category: categories[0], author: users[0] },
  { title: "Movie", level: 2, category: categories[3], author: users[1] },
  { title: "HTML", level: 2, category: categories[2], author: users[2] }
])

questions = Question.create!([
  { body: "Кем оказывается заколдованный Ума", test: tests[1] },
  { body: "Как называется самый популярный фреймворк языка Ruby для веба?", test: tests[0] },
  { body: "Какие три города Геральт посетил в основной игре «Дикая Охота»?", test: tests[1] },
  { body: "Где проживал Фродо Бэггинс?", test: tests[2] },
  { body: "С помощью какого тега в таблицах создаются строки?", test: tests[3] }
])

answers = Answer.create!([
  { body: "Скьялль", question: questions[0] },
  { body: "Цири", question: questions[0] },
  { body: "Аваллак'х", correct: true, question: questions[0] },
  { body: "Ruby Framework", question: questions[1] },
  { body: "Ruby On Rails", correct: true, question: questions[1] },
  { body: "Ruby Web", question: questions[1] },
  { body: "Новиград, Оксенфурт и Вызима", correct: true, question: questions[2] },
  { body: "Новиград, Боклер и Каэр Трольде", question: questions[2] },
  { body: "Новиград, Оксенфурт и Флотзам", question: questions[2] },
  { body: "В Шире", correct: true, question: questions[3] },
  { body: "В Лориэне", question: questions[3] },
  { body: "В Хогсмиде", question: questions[3] },
  { body: "<th>", question: questions[4] },
  { body: "<td>", question: questions[4] },
  { body: "<tr>", correct: true, question: questions[4] }
])

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