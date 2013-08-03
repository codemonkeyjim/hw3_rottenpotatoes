# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/\s+/).each do |rating|
    step %{I #{uncheck}check "ratings_#{rating}"}
  end
end

Then /I should see (all|none) of the movies/ do |all_or_none|
  page.all('table#movies tbody tr').count.should == (all_or_none == 'all' ? Movie.count : 0)
end
