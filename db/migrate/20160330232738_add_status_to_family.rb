class AddStatusToFamily < ActiveRecord::Migration
  def change
    add_column :families, :status, :string
  end
end
