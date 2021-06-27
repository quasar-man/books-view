FactoryBot.define do
  factory :author do
    name { "Test Author" }
  end

  factory :sample_author, class: Author do
    name { "Sample Author" }
  end
end
