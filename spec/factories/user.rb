FactoryBot.define do
  factory :random_user, class: User do
    name { Faker::Name.first_name }
  end
end
