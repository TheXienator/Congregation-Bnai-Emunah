Given /^the following users exist:/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    u = User.create(user)
    u.password_confirmation = u.password
    u.save
    current_user = u
  end
end
