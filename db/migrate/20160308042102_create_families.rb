class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :people
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
