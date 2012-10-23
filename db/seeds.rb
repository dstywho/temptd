# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
sports = EventType.find_or_create_by_name("Sports")
sports_event = Event.find_or_create_by_event_type_id(sports.id)
sports_event.timeslots.each &:destroy # to get rid of any timeslots from previous seeding

# 5 timeslots, each starting at 5PM
now = Time.now
5.times do |counter|
  slot_start = now + counter.days
  starts_at = Time.mktime(slot_start.year, slot_start.month, slot_start.day, 17)
  sports_event.timeslots.create!(starts_at: starts_at)
end

user = User.find_or_initialize_by_email("sports@scimedsolutions.com")
user.nickname = "Sporty"
user.password = "sporty"
user.password_confirmation = "sporty"
user.save!
