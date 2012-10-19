class CreateEventPreferences < ActiveRecord::Migration
  def change
    create_table :event_preferences do |t|
      t.integer :event_type_id
      t.string :category

      t.timestamps
    end
  end
end
