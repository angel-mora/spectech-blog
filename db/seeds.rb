60.times do
  User.create( name: Faker::Name.name_with_middle )
end

rails = Category.create(name: 'rails', priority: 2)
react = Category.create(name: 'react', priority: 1)
devops = Category.create(name: 'devops', priority: 5)
news = Category.create(name: 'news', priority: 3)
linux = Category.create(name: 'linux', priority: 4)
postgres = Category.create(name: 'postgres', priority: 6)

User.all.each do |author|
  random = 1 + rand(6)
  Article.create(
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph(sentence_count: 10),
    category_id: random,
    user_id: author.id
  )
end

60.times do
  rand_usr = User.all.sample
  rand_art = Article.all.sample
  Vote.create( article_id: rand_art.id, user_id: rand_usr.id )
end
