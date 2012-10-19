class UserEventPreferences < ActiveRecord::Base
  attr_accessible :event_preference_id, :user_id, :value
end
