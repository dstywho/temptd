# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
EventType.destroy_all
Event.destroy_all
User.destroy_all
Timeslot.destroy_all
Vote.destroy_all

sports = EventType.find_or_create_by_name("Sports")
sports_event = Event.find_or_create_by_event_type_id(sports.id)

# 5 timeslots, each starting at 5PM
now = Time.now
5.times do |counter|
  slot_start = now + counter.days
  starts_at = Time.mktime(slot_start.year, slot_start.month, slot_start.day, 17)
  sports_event.timeslots.create!(starts_at: starts_at)
end

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

user = User.find_or_initialize_by_email("sports@scimedsolutions.com")
user.nickname = "Sporty"
user.password = "sporty"
user.password_confirmation = "sporty"
user.save!
