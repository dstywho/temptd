class CreateUserEventPreferences < ActiveRecord::Migration
  def change
    create_table :user_event_preferences do |t|
      t.integer :user_id
      t.integer :event_preference_id
      t.string :value

      t.timestamps
    end
  end
end
