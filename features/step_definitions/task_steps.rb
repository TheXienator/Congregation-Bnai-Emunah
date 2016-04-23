# Add a declarative step here for populating the DB with tasks.

Given /the following tasks exist/ do |tasks_table|
  tasks_table.hashes.each do |task|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    t = Task.new(task)
    user = User.find(task[:user_id])
    admin = User.find(task[:admin_id])
    t.save!
    user.tasks << t
  end
end
