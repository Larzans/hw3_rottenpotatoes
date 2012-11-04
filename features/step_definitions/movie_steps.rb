# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
	Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: "(.*)"/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  rating_list.split.each do |boxname|
    if uncheck==nil
      check('ratings_'+boxname)
    else
      uncheck('ratings_'+boxname)
    end
  end
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should (not )?find text "(.*)" in table "(.*)"/ do |nothave, mnames, tname|
#  within "#" + tname
#    within('td')
      mnames.split.each do |name|
        #page.should have_content name
	if nothave==nil
          page.should have_content(name)
        else
          page.should_not have_content(name)
        end
      end
#    end
#  end
end

Then /Table "(.*)" should have (.*) entries/ do |tname, size|
  page.all('table#' + tname + ' tr').count.should == Integer(size)+1
end

Then /I should see all of the movies/ do
  step 'Table "movies" should have 10 entries'
end


