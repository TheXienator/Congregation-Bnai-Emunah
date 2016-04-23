# Add a declarative step here for populating the DB with comments.

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    com = Comment.new(content: comment[:content], confidential: comment[:confidential])
    family = Family.find_by name: comment[:family]
    user = User.find_by id: comment[:user_id]
    com.user_id = user
    com.family = family
    com.save!
    family.comments << com
    user.comments << com
  end
end
