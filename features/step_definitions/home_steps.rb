Given(/^I am on home screen$/) do
  wait_for_elements_exist "view text:'Barcelona'"
  sleep 2
end