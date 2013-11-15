# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :side, :class => 'Sides' do
    game_id 1
    shirt_colour "MyString"
  end
end
