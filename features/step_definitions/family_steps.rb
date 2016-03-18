# Add a declarative step here for populating the DB with families.

Given /the following families exist/ do |families_table|
  families_table.hashes.each do |family|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Family.create(family)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1)).to be < page.body.index(e2)
end
