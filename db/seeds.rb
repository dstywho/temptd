# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


EventType.destroy_all
Event.destroy_all
User.destroy_all
Timeslot.destroy_all
Vote.destroy_all

sport = EventType.find_or_create_by_name("Sports")
test_event = Event.find_or_create_by_event_type_id(sport.id)
test_user = User.create(email: "user@name.com", password: 'password', password_confirmation: 'password', nickname: "The Hammer")

monday = Time.now.beginning_of_week

5.times do |day_index|
  day = monday + day_index.days
  2.times do |i|
    start_time = day + (17 + i * 2).hours 
    end_time = day + (19 + i * 2).hours 

    Timeslot.create(event_id: test_event.id, starts_at: start_time, ends_at: end_time)
  end
end

Vote.create(user_id: test_user.id, event_id: test_event.id, timeslot_id: Timeslot.last.id)
Vote.create(user_id: 2, event_id: test_event.id, timeslot_id: Timeslot.first.id)
Vote.create(user_id: 3, event_id: test_event.id, timeslot_id: Timeslot.last.id)
