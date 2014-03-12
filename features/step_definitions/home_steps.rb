Given(/^I am on home screen$/) do
  wait_for_elements_exist "view text:'Barcelona'"
  sleep 2
end

Then(/^I see "(.*?)"$/) do |arg1|
  puts "step implemented"
  puts USER_DATA[:valid][:website]
end



When(/^I scroll till "([^"]*)" from home screen$/) do |arg|
  MainPage.new.scroll_table(arg)
end