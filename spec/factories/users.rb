# fixtureみたいな感じ
FactoryBot.define do
  factory :user do
    name {"sakuragi"}
    email {"sakuragi@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
    trait :invalid do
      name nil
    end
  end

  factory :rukawa, class: User do
    name {"rukawa"}
    email {"rukawa@example.com" }
  end

  factory :akagi, class: User do
    name {"akagi"}
    email {"akagi@example.com"}

  end
end
