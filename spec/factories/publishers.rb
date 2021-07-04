FactoryBot.define do
  factory :publisher do
    name { "Test Publisher" }
  end

  factory :sample_publisher, class: Publisher do
    name { "Sample Publisher" }
  end
end
