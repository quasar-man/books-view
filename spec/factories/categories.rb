FactoryBot.define do
  factory :category do
    name { "Test Category" }
  end

  factory :sample_category, class: Category do
    name { "Sample Category" }
  end
end
