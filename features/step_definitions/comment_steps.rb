# Add a declarative step here for populating the DB with comments.

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    com = Comment.new(content: comment[:content])
    family = Family.find_by name: comment[:family]
    com.family = family
    com.save!
    family.comments << com
  end
end


Then /comment "(.*)" should be before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1)).to be < page.body.index(e2)
end