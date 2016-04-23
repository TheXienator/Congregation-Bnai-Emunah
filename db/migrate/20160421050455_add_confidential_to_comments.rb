class AddConfidentialToComments < ActiveRecord::Migration
  def change
    add_column :comments, :confidential, :boolean
  end
end
