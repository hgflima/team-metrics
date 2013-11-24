class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|
      t.string :title, :limit => 64
      t.text :description
      t.references :project, index: true
      t.timestamps
    end
  end
end
