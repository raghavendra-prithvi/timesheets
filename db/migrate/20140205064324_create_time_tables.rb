class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :date
      t.float :hours

      t.timestamps
    end
  end
end
