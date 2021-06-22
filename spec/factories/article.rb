FactoryBot.define do
  factory :random_article, class: Article do
    title { Faker::Lorem.sentence(word_count: 3) }
    text { Faker::Lorem.paragraph(sentence_count: 3) }
  end
end
