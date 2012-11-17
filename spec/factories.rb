require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do

  factory :event_type do
    name { Faker::Company.name }
  end

  factory :event do
    event_type factory: :event_type
  end

  factory :timeslot do
    event   factory: :event 
    starts_at { Time.now }
    ends_at   { starts_at + 2.hour }
  end
end
