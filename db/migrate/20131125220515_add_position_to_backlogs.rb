class AddPositionToBacklogs < ActiveRecord::Migration

  def change
    add_column :backlogs, :position, :integer, :default => 0
  end

end
