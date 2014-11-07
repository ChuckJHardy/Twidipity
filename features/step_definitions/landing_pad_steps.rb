Given(/^I go to the homepage$/) do
  visit "/"
end

Then(/^I should see "(.*?)" page title$/) do |title|
  expect(page).to have_title title
end

Then(/^I should see "(.*?)" on the page$/) do |text|
  expect(page).to have_content text
end
