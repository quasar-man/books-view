FactoryBot.define do
  factory :tag do
    name { "Test Tag" }
  end

  factory :sample_tag, class: Tag do
    name { "Sample Tag" }
  end
end
