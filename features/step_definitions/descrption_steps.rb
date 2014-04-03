
Then(/^I see details about the city$/) do
  @descriptionPage.verify_city_name(@city_name)
end