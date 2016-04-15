class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.string :priority
      t.references :user, index: true, foreign_key: true
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
