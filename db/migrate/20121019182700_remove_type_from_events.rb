class RemoveTypeFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :type
    remove_column :events, :event_type_id
    add_column :events, :event_type_id, :integer, after: :id 
  end

  def down
  end
end
