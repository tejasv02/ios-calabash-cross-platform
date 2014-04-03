Given(/^I am on home screen$/) do
  @homePage.verify_home_page
end

Then(/^I see "(.*?)"$/) do |arg1|
  puts "step implemented"
  puts USER_DATA[:valid][:website]
end


When(/^I scroll till "([^"]*)" from home screen$/) do |arg|
  @homePage.scroll_table(arg)
end


Then(/^I wait to see "([^"]*)" in row (\d+)$/) do |arg, num|
  @homePage.verify_city_in_row(arg, num)
end


Given(/^I select the city "([^"]*)" from home screen$/) do |name|
  step "I am on home screen"
  step 'I scroll till "'+name+'" from home screen'
  step 'I should see "'+name+'"'
  step 'I touch "'+name+'"'
  @city_name=name
end


When(/^I navigate back to home screen$/) do
  step 'I should see a "DONE" button'
  step 'I press the "DONE" button'
end

Then(/^I see city name in row (.*)$/) do |num|
  @homePage.verify_city_in_row(@city_name, num)
end