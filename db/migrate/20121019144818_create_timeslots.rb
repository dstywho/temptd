class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :event_id
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
