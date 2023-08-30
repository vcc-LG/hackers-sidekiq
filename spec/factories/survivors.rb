FactoryBot.define do
  factory :survivor do
    name { 'Alice' }
    health { 100 }
    stamina { 80 }
    hunger { 30 }
    group
  end
end
