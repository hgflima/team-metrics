class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, :limit => 32
      t.text :description

      t.timestamps
    end
  end
end
