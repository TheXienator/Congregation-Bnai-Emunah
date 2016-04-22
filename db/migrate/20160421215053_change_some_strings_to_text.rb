class ChangeSomeStringsToText < ActiveRecord::Migration
  def change
    change_column :comments, :content, :text, :limit => nil
    change_column :tasks, :content, :text, :limit => nil
  end
end
